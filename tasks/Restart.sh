#!/usr/bin/env bash

### ALL ENABLED SERVICES ###
Task::restart(){
  : @desc "Restart all enabled services"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Restarting all services"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.restart.yml || colorize red "error: restart"
  highlight "Services restarted"
}

# SELECTED SERVICE ###
Task::restart_one(){
  : @desc "Restarts the specified service"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"

  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.restart.yml || colorize red "error: restart_one"
  highlight "Restarted ${_service}"
}
