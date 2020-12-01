#!/usr/bin/env bash

# Contains tasks specific to user actions.

# Allows you to switch between various branches and tags of VLAB
Task::track(){
  : @desc "Switches you to the specified branch or tag. use branch=<branchname>"
  : @param branch! "Required! Branch or tag name to track"

  git checkout $_branch || colorize red "error: track: $_branch"
}

# Opens a shell on the VivumLab server
Task::shell() {
  : @desc "Opens a shell in the VivumLab deploy server"

  ssh -i "$HOME/.ssh/$(pwless_sshkey)" "$(vlab_ssh_user)@$(vlab_ip)" -p "$(vlab_port)" \
  || colorize red "error: shell"
}

# Opens a shell in the VivumLab container
Task::docker_shell() {
  : @desc "Opens a shell (bash) in the deployed VivumLab docker container"

  Task::run_docker /bin/bash || colorize red "error: docker_shell"
}

# Reboots the server. Has the option for a timer (in minutes)
Task::reboot(){
  : @desc "Reboots the VivumLab deploy server"
  : @param t "Time (minutes) until server reboots"

  ssh -t -p "$(vlab_port)" -i "$HOME/.ssh/$(pwless_sshkey)" \
  "$(vlab_ssh_user)@$(vlab_ip)" "sudo shutdown -r +"$(countdown) \
  || colorize red "error: reboot"
}

# Shuts down the server. Has the option for a timer (in minutes)
Task::shutdown(){
  : @desc "Shuts down the VivumLab deploy server"
  : @param t "Sets a countdown (minutes) until server shuts down"

  ssh -t -p "$(vlab_port)" -i "$HOME/.ssh/$(pwless_sshkey)" \
  "$(vlab_ssh_user)@$(vlab_ip)" "sudo shutdown+"$(countdown) \
  || colorize red "error: shutdown"
}

# Allows the user to make edits to a service without changing the base docker-compose file
Task::service_edit() {
  : @desc "Allows user to edit a specific deployed service with a docker-compose.override.yml"
  : @param service "Service Name"
  : @param config_dir="settings"
  : @param debug true "Debugs ansible-playbook commands"

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.service-edit.yml || colorize red "error: service_edit"
}

Task::create_sshkey() {
  : @desc "Allows user to create an ssh key"

  Task::logo_local

  #colorize light_yellow "REMINDER: Having a passphrase is an optional extra layer of security for your SSH keys."
  #read -sp "If you would like a passphrase for the SSH keys, please enter one now (press return for no passphrase): " KEY_PASS
  #echo ""

  #if [[ -z ${KEY_PASS+} ]]; then
    KEY_PASS=""
  #fi

  colorize light_green "Creating $(pwless_sshkey) and $(pwless_sshkey).pub"
  ssh-keygen -q -N "$KEY_PASS" -C "VivumLab@$(domain_check)" -f "$HOME/.ssh/$(pwless_sshkey)"|| colorize red "error: create_sshkey"
}

Task::copy_sshkey() {
  : @desc "Allows user to copy an existing ssh key"

  colorize light_green "Copying keys over to the machine, located at $(vlab_ip)"
  ssh-copy-id -p "$(vlab_port)" -i "$HOME/.ssh/$(pwless_sshkey).pub" \
  "$(vlab_ssh_user)@$(vlab_ip)" || colorize red "error: create_sshkey: copying keys"
}


Task::setup_sshkey() {
  : @desc "Creates and copies a non-existing SSH key"

  Task::create_sshkey
  Task::copy_sshkey
}

# Provides the user with a terminal rendered 'contact us' doc
Task::find_help() {
  : @desc "Shows the user where to find help/ contact the VivumLab community"

  cat vivumlablogo.txt
  Task::check_version

  colorize light_yellow $'\nMOTD:' && colorize light_cyan "$(cat MOTD)" \
  && echo $'\n\n' || colorize light_red $'Could not get MOTD\n\n'

  Task::run_docker mdv -t 729.8953 docs/Contact-us.md
}
