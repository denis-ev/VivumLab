#!/usr/bin/env bash

# Removes One Service
Task::remove_one(){
  : @desc "Removes the specified service from the VivumLab server"
  : @param service! "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Removing data for ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml || colorize red "error: remove_one"
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

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)
  Task::git_sync
  Task::config

  highlight "Resetting ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.stop.yml || colorize red "error: reset_one: stop"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory playbook.remove.yml  || colorize red "error: reset_one: remove"
  highlight "Redeploying ${_service}"
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  --extra-vars='{"services":["'${_service}'"]}' -i inventory -t deploy playbook.vivumlab.yml || colorize red "error: reset_one: deploy"
  highlight "Reset ${_service}"
}
