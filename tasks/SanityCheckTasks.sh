#!/usr/bin/env bash

# Checks to make sure the current environment is setup correctly
Task::sanity_check(){
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then exit 0; fi
  already_ran[${FUNCNAME[0]}]=1

  Task::check_for_settings
  Task::check_vault_pass
  Task::check_ssh_keys
  #Task::check_ssh_with_keys
  Task::check_for_git
  Task::check_for_precommit
  Task::check_for_hostdockerdaemon

  colorize green "Sanity checks passed"
}

Task::create_vault_pass() {
    [ -f ~/.vlab_vault_pass ] || Task::generate_ansible_pass
}

# Ensures there is a place to put all the required settings..
Task::check_for_settings(){
  : @desc "Verifies User Settings exist. Creates it if it's not present"
    mkdir -p settings/passwords
    [ -f ~/.vlab_vault_pass ] || Task::generate_ansible_pass

    if ! [[ -d settings ]]; then
        colorize red "Seems to be your first time running this."
        colorize light_red "Creating settings directory"
        mkdir -p settings
    fi
    if  ! [[ -d settings/passwords ]]; then
        colorize light_red "Creating passwords directory"
        mkdir -p settings/passwords
    fi
    if ! [[ -f settings/config.yml ]]; then
        colorize light_red "Creating an empty config file"
        echo "blank_on_purpose: True" > settings/config.yml
    fi
    if ! [[ -f settings/vault.yml ]]; then
        colorize light_red "Creating an empty Vault"
        echo "blank_on_purpose: True" > settings/vault.yml
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
  IP=$(Task::run_docker yq r "settings/config.yml" "vlab_ip" | tr -d '[:space:]')
  USERNAME=$(Task::run_docker yq r "settings/config.yml" "vlab_ssh_user" | tr -d '[:space:]')
  Task::run_docker ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 "$USERNAME@$IP" exit 2>&1 && echo $?
  if ! [ $? -eq 0 ]; then
    colorize red "VivumLab is unable to ssh to your server using the information in your config.yml: $USERNAME at $IP, and your $HOME/.ssh/id_rsa keypair to SSH into your server. Because the VivumLab docker container cannot ssh to your server with the specified key, VivumLab cannot deploy"
  fi
}

Task::check_vault_pass(){
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then exit 0; fi
  already_ran[${FUNCNAME[0]}]=1

  if [ ! -f "$HOME/.vlab_vault_pass" ]; then
    echo "Oops, I cannot find your vault password in $HOME/.vlab_vault_pass"
    echo "This is unusual, but could be caused by the user being changed during setup."
    colorize red "FIX: Create the file in the right place.  Then file a bug report."
    exit 1
  fi
}

Task::check_ssh_keys() {
  if ! [ -f "$HOME/.ssh/id_rsa" -a -f "$HOME/.ssh/id_rsa.pub" -a -f "$HOME/.vlab_vault_pass" ]; then
    echo "You have no SSH keys in your home directory: $HOME"
    echo "Please generate a set of keys using the command:"
    echo "   ssh-keygen -t rsa"
    echo "or copy your id_rsa and id_rsa.pub keys to $HOME/.ssh/"
    echo "Then retry the operation"
    read -p "Press ctrl-c and fix your ssh keys"
    exit 1
  fi
}

Task::check_for_precommit () {
  pcver=$(pre-commit --version)
  reqpy="3.6.1"
  reqpc="2.6.0"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    pyver=$(python3 --version)
  else
    pyver=$(python --version)
  fi

  if [ "$(printf '%s\n' "$reqpy" "$pyver" | sort -V | head -n1)" = "$reqpy" ]; then
   if [ "$(printf '%s\n' "$reqpc" "$pcver" | sort -V | head -n1)" = "$reqpc" ]; then
     [ ! -f .git/pre-commit ] || pre-commit install && pre-commit install --install-hooks
   else
     echo "/bin/sh\ncurl https://pre-commit.com/install-local.py | python -" > INSTALL_PRECOMMIT.sh
     sudo chmod +x INSTALL_PRECOMMIT.sh
     echo "Contributions via git, require pre-commit. Use INSTALL_PRECOMMIT.sh, to begin"
     echo "after your deployment has finished, of course"
     sleep 3
   fi
  else
     echo "/bin/sh\ncurl https://pre-commit.com/install-local.py | python -" > INSTALL_PRECOMMIT.sh
     sudo chmod +x INSTALL_PRECOMMIT.sh
     echo "The latest version of Python, is required to contribute via git"
     echo "Check it out here: https://duckduckgo.com/?q=download+python"
     echo "If you wanted to contribute, install the latest version and re-deploy"
     sleep 3
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