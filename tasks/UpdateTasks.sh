#!/usr/bin/env bash

# Updates all services on the VivumLab server
Task::update() {
  : @desc "Updates all services on the VivumLab Server"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo
  Task::build
  Task::git_sync
  Task::config

  highlight "Updating VivumLab Services using $_config_dir"
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory -t deploy playbook.vivumlab.yml
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.restart.yml
  highlight "Update Complete"
}

# Updates the specified service on the VivumLab server
Task::update_one(){
  : @desc "Updates the specified service on the VivumLab server"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"

  Task::logo

  if [[ ${_force-true} == true ]] ; then
    if [[ ${_build-true} == true ]] ; then
      Task::build force=true build=true
    else
      Task::build force=true
    fi
  else
    if [[ ${_build-true} == true ]] ; then
      if [[ ${_force-true} == true ]] ; then
        Task::build build=true force=true
      else
        Task::build build=true
      fi
    else
      Task::build
    fi
  fi

  Task::git_sync
  Task::config

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars='{"services":["'${_service}'"]}' --extra-vars="@$_config_dir/config.yml" \
  --extra-vars="@$_config_dir/vault.yml" -i inventory -t deploy playbook.vivumlab.yml
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars='{"services":["'${_service}'"]}' --extra-vars="@$_config_dir/config.yml" \
  --extra-vars="@$_config_dir/vault.yml" -i inventory playbook.restart.yml
}
