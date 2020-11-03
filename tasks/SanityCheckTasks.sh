#!/usr/bin/env bash

# Checks to make sure the current environment is setup correctly
Task::sanity_check_local(){
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then exit 0; fi
  already_ran[${FUNCNAME[0]}]=1

  Task::check_for_settings
  Task::check_vault_pass
  Task::check_for_git
  Task::check_for_precommit
  Task::check_for_hostdockerdaemon

  colorize green "Core sanity checks passed"
}

Task::sanity_check_remote(){
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then exit 0; fi
  already_ran[${FUNCNAME[0]}]=1

  Task::check_ssh_keys
  Task::check_ssh_with_keys

  colorize green "Remote sanity checks passed"
}

Task::create_vault_pass() {
    [ -f ~/.vlab_vault_pass ] || Task::generate_ansible_pass
}

# Ensures there is a place to put all the required settings..
Task::check_for_settings(){
  : @desc "Verifies User Settings exist. Creates it if it's not present"

    mkdir -p settings/passwords
    [ -f ~/.vlab_vault_pass ] || Task::generate_ansible_pass

    if [[ ! -d settings ]]; then
        colorize light_red "Creating settings directory"
        mkdir -p settings
    fi
    if  [[ ! -d settings/passwords ]]; then
        colorize light_red "Creating passwords directory"
        mkdir -p settings/passwords
    fi
    if [[ ! -f settings/prod-config.yml ]]; then
        colorize light_red "Creating an empty config file"
        echo "blank_on_purpose: True" > settings/prod-config.yml
    fi
    if [[ ! -f settings/prod-vault.yml ]]; then
        colorize light_red "Creating an empty Vault"
        echo "blank_on_purpose: True" > settings/prod-vault.yml
    fi
    if [[ ! -f tasks/prod-ansible_bash.vars ]]; then
      colorize light_red "Creating ansible_bash.vars file"
      echo "PASSWORDLESS_SSHKEY=''" > tasks/prod-ansible_bash.vars
    fi
}

Task::check_for_git(){
  git --version 2>&1 >/dev/null # improvement by tripleee
  GIT_IS_AVAILABLE=$?
  if ! [ $GIT_IS_AVAILABLE -eq 0 ]; then
    colorize red "You need to install Git"
  fi
}

Task::check_ssh_with_keys(){
  : @param config_dir="settings"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  IP=$(Task::run_docker yq r "$_config_dir/$_user_config-config.yml" "vlab_ip" | tr -d '[:space:]')
  USERNAME=$(Task::run_docker yq r "$_config_dir/$_user_config-config.yml" "vlab_ssh_user" | tr -d '[:space:]')
  Task::run_docker ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 -i /root/.ssh/$(pwless_sshkey) "$USERNAME@$IP" exit 2>&1 && echo $?
  if ! [ $? -eq 0 ]; then
    colorize red "VivumLab is unable to ssh to your server using the information in your $_config_dir/$_user_config-config.yml: $USERNAME at $IP, and your $HOME/.ssh/id_rsa keypair to SSH into your server. Because the VivumLab docker container cannot ssh to your server with the specified key, VivumLab cannot deploy"
    exit 1
  fi
}

Task::check_vault_pass(){
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then exit 0; fi
  already_ran[${FUNCNAME[0]}]=1

  if [ ! -f "$HOME/.vlab_vault_pass" ]; then
    echo "Oops, your vault password in $HOME, doesn't appear to exist"
    echo "This is unusual, but could be caused by the user being changed during setup."
    colorize yellow "VivumLab can create a new '.vlab_vault_pass' file for you."
    colorize yellow "Or did you want to exit, and try to sort this out, yourself"
    read -p "Let VivumLab create a new '.vlab_vault_pass' file for you? [yes/no]" decision_missingvaultpass
        case decision_missingvaultpass in
          [Yy][Ee][Ss]|[Tt][Rr][Uu][Ee])
            Task::generate_ansible_pass
           ;;
           *)
            Task::find_help
           ;;
        esac
  fi
}

Task::check_ssh_keys() {
  : @desc "Checks for SSH keys, creates/updates as necessary."
  : @param config_dir="settings"

  if ! [ -f "$HOME/.ssh/$(pwless_sshkey)" -a -f "$HOME/.ssh/$(pwless_sshkey).pub" ]; then
    echo "The directory: $HOME/.ssh, does not have any keys called $(pwless_sshkey)"
    read -p 'Do the keys exist? Is the name of the keys (above) incorrect? [yes/no]: ' ssh_confirm
    case $ssh_confirm in
        [Yy]|[Yy][Ee][Ss])
          echo "OK, refreshing VivumLab. Run 'vlab config' when you are ready"
          sed -i "/^passwordless_sshkey:/c\ " $_config_dir/config.yml
          sed -i "/^PASSWORDLESS_SSHKEY=/c\PASSWORDLESS_SSHKEY=" tasks/ansible_bash.vars
          exit
        ;;
        [Nn]|[Nn][Oo])
          Task::create_sshkey
          exit
        ;;
        *)
          echo "VivumLab requires passwordless shh keys. Consider creatng some keys and re-running VivumLab."
          echo "REMINDER: 'vlab create_sshkey' can help you create some keys"
          exit
        ;;
    esac
  else
     echo "Using $(pwless_sshkey) and $(pwless_sshkey).pub keys"
  fi
}

Task::check_for_precommit () {
  pcver=$(pre-commit --version || echo "0.0.0")
  reqpy="3.6.1"
  reqpc="2.6.0"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    pyver=$(python3 --version)
  else
    pyver=$(python --version)
  fi

  if [ "$(printf '%s\n' "$reqpy" "$pyver" | sort -V | head -n1)" = "$reqpy" ]; then
   if [ "$(printf '%s\n' "$reqpc" "$pcver" | sort -V | head -n1)" = "$reqpc" ]; then
     [ ! -f .git/pre-commit ] || pre-commit install && pre-commit install --install-hooks > /dev/null 2>&1
   else
     echo "Pre-commit is not installed"
     echo "Contributions via git, require pre-commit. Run vlab dev_setup, to begin"
     echo "after your deployment has finished, of course"
     sleep 3
   fi
 fi
}

# It would be nice to verify passwordless ssh to the server works.

Task::check_for_hostdockerdaemon() {
    if ! docker info >/dev/null 2>&1 ; then
        echo "Docker Check: Failed. Starting Docker"
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open -g -a Docker.app || exit
        elif [[ `systemctl` =~ -\.mount ]]; then
            sudo systemctl start docker
        elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then
            sudo service docker start
        fi
    fi
}
