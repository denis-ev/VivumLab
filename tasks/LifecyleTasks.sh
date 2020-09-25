#!/usr/bin/env bash

# Main deployment task - used to deploy VLAB
Task::deploy(){
  : @desc "Main deployment task - used to deploy VLAB"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param cache false "Forces the build to use --no-cache --force-rm"
  : @param debug true "Debugs ansible-playbook commands"


  Task::logo
  Task::build $(build_check) $(force_check)

  highlight "Deploying VivumLab"
  if [[ ${_debug-false} == true ]] ; then
    Task::run_docker ansible-playbook $(debug_check) \
    --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
    -i inventory playbook.vivumlab.yml
  else
    Task::run_docker ansible-playbook $(debug_check) \
    --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
    -i inventory playbook.vivumlab.yml

  fi
}

# Restart All Enabled services
Task::restart(){
  : @desc "Restart all enabled services"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  highlight "Stopping all services"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.restart.yml
  highlight "Services restarting"
}

# Restart the selected service
Task::restart_one(){
  : @desc "Restarts the specified service"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.restart.yml
}

# Stop All Enabled services
Task::stop(){
  : @desc "Restart all enabled services"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  highlight "Stopping all services"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.stop.yml
  highlight "Services restarting"
}

# Stop the selected service
Task::stop_one(){
  : @desc "Restarts the specified service"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.stop.yml
}

# Removes One Service
Task::remove_one(){
  : @desc "Removes the specified service on the VivumLab server"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  highlight "Removing data for ${_service}"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml
  highlight "Removal Complete"
}

# Resets a services' data files
Task::reset_one(){
  : @desc "Resets the specified service' files on the VivumLab server"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build $(build_check) $(force_check)
  Task::git_sync
  Task::config

  highlight "Resetting ${_service}"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.stop.yml
	Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml
	highlight "Redeploying ${_service}"
	Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory -t deploy playbook.vivumlab.yml
	highlight "Done resetting ${_service}"
}
