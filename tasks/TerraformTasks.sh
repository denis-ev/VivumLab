#!/usr/bin/env bash

# Spin up a cloud server with Terraform https://vivumlab.com/setup/terraform/
Task::terraform(){
  : @desc "Spin up a cloud server with Terraform"
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo
  Task::build $(build_check) $(force_check) $(cache_check)

  Task::git_sync
  Task::config

  highlight "Deploying cloud server"
  # Generate Terraform files
  Task::run_docker ansible-playbook $(debug_check) $(sshkey_path) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.terraform.yml || colorize red "error: terraform: deploy"

  # Run terraform
  # If we send multiple commands to the docker container (/bin/bash -c), we can "cd" into the "settings" directory
  #  then run terraform... which will then place the .tfstate file in the "settings" directory for safe keeping (aka "backing up")
  Task::run_docker /bin/bash -c "cd settings; terraform init && terraform apply"

  # Get instance IP for next run
  TERRAFORM_IP=$(Task::run_docker /bin/bash -c "cd settings; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address")

  colorize green "Successfully created a server at: ${TERRAFORM_IP}\n\n"
  colorize light_yellow "Place this IP where you want it in your settings (either 'vlab_ip' or 'bastion.server_address'),"
  colorize light_yellow "then run 'vlab deploy' to complete the setup."

  highlight "Done deploying cloud server!"
}

# Destroys servers created by terraform
Task::terraform_destroy(){
  : @desc "Destroys servers created by terraform"
  : @param config_dir="settings"

  highlight "Destroying cloud servers"
  Task::run_docker /bin/bash -c "cd $_config_dir; terraform destroy" \
  || "error: terraform_destroy"
  highlight "Cloud Servers destroyed"
}
