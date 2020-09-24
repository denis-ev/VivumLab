#!/usr/bin/env bash

# Spin up a cloud server with Terraform https://vivumlab.com/setup/terraform/
Task::terraform(){
  : @desc "Spin up a cloud server with Terraform"
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

  highlight "Deploying cloud server"
  # Generate Terraform files
  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.terraform.yml

  # Run terraform
  # If we send multiple commands to the docker container (/bin/bash -c), we can "cd" into the "settings" directory
  #  then run terraform... which will then place the .tfstate file in the "settings" directory for safe keeping (aka "backing up")
  Task::run_docker /bin/bash -c "cd settings; terraform init && terraform apply"

  # Get instance IP for next run
  TERRAFORM_IP=$(Task::run_docker /bin/bash -c "cd settings; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address")

  echo "Successfully created a server at: ${TERRAFORM_IP}\n\nPlace this IP where you want it in your settings (either 'vlab_ip' or 'bastion.server_address'), then run 'vlab deploy' to complete the setup."

  highlight "Done deploying cloud server!"
}

# Destroys servers created by terraform
Task::terraform_destroy(){
  : @desc "Destroys servers created by terraform"
  : @param config_dir="settings"

  highlight "Destroying cloud servers"
  Task::run_docker /bin/bash -c "cd $_config_dir; terraform destroy"
  highlight "Cloud Servers destroyed"
}
