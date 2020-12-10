#!/usr/bin/env bash

# Contains VLAB specific tasks related to on-this-host tasks.

# Prints the Logo
Task::logo_local() {
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then return ; fi
  already_ran[${FUNCNAME[0]}]=1
  cat vivumlablogo.txt
  Task::check_version

  colorize light_yellow $'\nMOTD:' && colorize light_cyan "$(cat MOTD)" \
  && echo $'\n\n' || colorize light_red $'Could not get MOTD\n\n'

  Task::sanity_check_local
}

Task::logo() {
  Task::logo_local
  Task::sanity_check_remote
}

Task::generate_ansible_pass(){
  if [[ "$OSTYPE" == "darwin"* ]]; then
    function sha256sum() { shasum -a 256 "$@" ; } && export -f sha256sum
  fi
  date +%s | sha256sum | base64 | head -c 32  > ~/.vlab_vault_pass
}

#Shows the /docs/software/service.md rendered in the terminal
Task::show(){
  : @desc "Show the docs for the specified service"
  : @param service "Service name: service=serviceName"

  Task::run_docker mdv -t 729.8953 docs/software/${_service}.md
  highlight "Current Configuration settings"
  Task::show_config
}

# Builds the docker image used for VivumLab Deployments
Task::build() {
    : @param force true "Forces a rebuild/repull of the docker image"
    : @param build true "Pulls the image"
    : @param cache true "Allows the build to use the cache"

  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then return ; fi

  vlab_dockerimagver=$(docker images --filter reference=vivumlab/vivumlab | grep "${VERSION_CURRENT}" | awk '{print $2}')
  vlab_dockerimagid=$(docker images --filter reference=vivumlab/vivumlab | grep "${VERSION_CURRENT}" | awk '{print $3}')

  # if [[ ${vlab_dockerimagver} != ${VERSION_CURRENT} ]]; then
  #   sudo docker rmi --force ${vlab_dockerimagid}
  # fi

  function build_cache() {
    if [[ ${_cache-true} == true ]]; then
      echo ''
    else
      echo '--no-cache --force-rm'
    fi
  }

  if [[ ${_force-true} == true ]]; then
    if [[ -n ${vlab_dockerimagid} ]]; then
      sudo docker rmi --force ${vlab_dockerimagid}
    fi
  fi

  highlight "Getting VivumLab Docker Image"
  if [[ ! ${vlab_dockerimagid} == "" ]] && [[ ${VERSION_CURRENT} == ${VERSION_LATEST} ]]; then
    colorize light_yellow "Image number: ${vlab_dockerimagid}"
    colorize light_yellow "is the latest vlab image"
    colorize light_blue "Skipping vlab image retrieval"
  else
    if [[ ${_build-true} == true ]]; then
      sudo docker build . $(build_cache) -t vivumlab/vivumlab:${VERSION_CURRENT}
    else
      sudo docker pull vivumlab/vivumlab:${VERSION_CURRENT}
    fi
  fi
}

# Deploys VivumLab
Task::deploy(){
  : @desc "Deploys VivumLab, configure VivumLab first"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)

  highlight "Deploying VivumLab"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.vivumlab.yml || colorize red "error: deploy"
}

# Manually forces a settings Sync via Git
Task::git_sync() {
  : @desc "Manually forces a settings sync via git"

  local return_dir=$PWD
  if [[ -v "already_ran[${FUNCNAME[0]}]" ]] ;  then return ; fi
  already_ran[${FUNCNAME[0]}]=1
  mkdir -p settings > /dev/null 2>&1
  # If there is a git repo, then attempt to update
  if [ -d settings/.git/ ]; then
    mkdir -p settings/.git/hooks/ > /dev/null 2>&1
    cp git_sync_pre_commit settings/.git/hooks/pre-commit
    chmod +x settings/.git/hooks/pre-commit
    cd settings
    colorize yellow "Syncing settings via Git"
    git pull
    git add * > /dev/null
    git commit -a -m "Settings update" || true
    git push > /dev/null
  else
    colorize yellow "Warning! You do not have a git repo set up for your settings. Make sure to back them up using some other method. https://vivumlab.com/setup/installation/#syncing-settings-via-git "
  fi
  cd $return_dir

}

# Encrypt the vault
Task::encrypt(){
  : @desc "Encrypts the vault"

  highlight "Encrypting Vault"
    local userID=$(id -u)
    local groupID=$(id -g)
  Task::run_docker ansible-vault encrypt settings/vault.yml  || colorize red "error: encrypt"
  sudo chmod 640 settings/vault.yml
  sudo chown $userID:$groupID settings/vault.yml
  highlight "Vault encrypted!"
}

# Decrypts the vault
Task::decrypt(){
  : @desc "Decrypts the vault"

  highlight "Decrypting Vault"
    local userID=$(id -u)
    local groupID=$(id -g)
  Task::run_docker ansible-vault decrypt settings/vault.yml || colorize red "error: decrypt"
  sudo chmod 640 settings/vault.yml
  sudo chown $userID:$groupID settings/vault.yml
  highlight "Vault decrypted!"
}

# Uninstalls VivumLab
Task::uninstall(){
  : @desc "Uninstalls VivumLab"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)

  highlight "Uninstall VivumLab Completely"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory -t deploy playbook.remove.yml || colorize red "error: uninstall"
  highlight "Uninstall Complete"
}

# Restores a server from Backups. Assuming Backups were running
Task::restore() {
  : @desc "Restore a server from backups. Assuming backups were running"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"

  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory restore.yml  || colorize red "error: restore"
}

Task::run_docker() {
  docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/ansible_vault_pass \
  vivumlab/vivumlab:${VERSION_DOCKER} "$@"
}

# Checks the current version
Task::check_version() {
  VERSION_CURRENT=$(cat VERSION)
  VERSION_LATEST=$(curl -s -m 2 https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION)

  colorize yellow "You currently have version: $VERSION_CURRENT"
  colorize green "The newest Version available is: $VERSION_LATEST"

  if version_check $VERSION_LATEST $VERSION_CURRENT; then
    colorize red "* You should update to version $VERSION_LATEST! *"
    colorize red " * Update at https://github.com/Vivumlab/VivumLab/releases *"
  else
    colorize green "You are up to date!"
  fi
}

# Links the vlab command into /usr/local/bin
Task::install_cli(){
  : @desc "Links the vlab cli into /usr/local/bin so you can call vlab without the ./"

  sudo ln -s $PWD/vlab /usr/local/bin/vlab
}
