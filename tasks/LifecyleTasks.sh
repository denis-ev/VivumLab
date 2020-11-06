#!/usr/bin/env bash

# Main deployment task - used to deploy VLAB
Task::deploy(){
  : @desc "Deploys VivumLab, configure VivumLab first"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)

  highlight "Deploying VivumLab"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  -i inventory playbook.vivumlab.yml || colorize light_red "error: deploy"
}

# Restart All Enabled services
Task::restart(){
  : @desc "Restart all enabled services"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Restarting all services"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  -i inventory playbook.restart.yml || colorize light_red "error: restart"
  highlight "Services restarted"
}

# Restart the selected service
Task::restart_one(){
  : @desc "Restarts the specified service"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.restart.yml || colorize light_red "error: restart_one"
  highlight "Restarted ${_service}"
}

# Stop All Enabled services
Task::stop(){
  : @desc "Stops all enabled services"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Stopping all services"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  -i inventory playbook.stop.yml || colorize light_red "error: stop"
  highlight "Services stopped"
}

# Stop the selected service
Task::stop_one(){
  : @desc "Stops the specified service"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.stop.yml  || colorize light_red "error: stop_one"
  highlight "Stopped ${_service}"
}

# Removes One Service
Task::remove_one(){
  : @desc "Removes the specified service from the VivumLab server"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Removing data for ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml || colorize light_red "error: remove_one"
  highlight "Removed ${_service}"
}

# Resets a services data files
Task::reset_one(){
  : @desc "Resets the specified service files from the VivumLab server"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"
  : @param user_config="prod" "Prefix of the user-cloned config files"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Resetting ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.stop.yml || colorize light_red "error: reset_one: stop"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml  || colorize light_red "error: reset_one: remove"
  highlight "Redeploying ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/$_user_config-config.yml" --extra-vars="@$_config_dir/$_user_config-vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory -t deploy playbook.vivumlab.yml || colorize light_red "error: reset_one: deploy"
  highlight "Reset ${_service}"
}
