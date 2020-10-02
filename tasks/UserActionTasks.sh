#!/usr/bin/env bash

# Contains tasks specific to user actions.

# Allows you to switch between various branches and tags of VLAB
Task::track(){
  : @desc "Switches you to the specified branch or tag. use branch=<branchname>"
  : @param branch! "Required! Branch or tag name to track"

  git checkout $_branch || colorize light_red "error: track: $_branch"
}

# Opens a shell on the VivumLab server
Task::shell() {
  : @desc "Opens a shell in the VivumLab deploy server"

  ssh -i "$HOME/.ssh/$(pwless_sshkey)" $(vlab_ssh_user)@$(vlab_ip) -p $(vlab_port) \
  || colorize light_red "error: shell"
}

# Opens a shell in the VivumLab container
Task::docker_shell() {
  : @desc "Opens a shell (bash) in the deployed VivumLab docker container"

  Task::run_docker /bin/bash || colorize light_red "error: docker_shell"
}

# Reboots the server. Has the option for a timer (in minutes)
Task::reboot(){
  : @desc "Reboots the VivumLab deploy server"
  : @param t "Time (minutes) until server reboots"

  ssh -t -i "$HOME/.ssh/$(pwless_sshkey)" $(vlab_ssh_user)@$(vlab_ip) -p $(vlab_port) \
  "sudo shutdown -r +"$(countdown)|| colorize light_red "error: reboot"
}

# Shuts down the server. Has the option for a timer (in minutes)
Task::shutdown(){
  : @desc "Shuts down the VivumLab deploy server"
  : @param t "Sets a countdown (minutes) until server shuts down"

  ssh -t -i "$HOME/.ssh/$(pwless_sshkey)" $(vlab_ssh_user)@$(vlab_ip) -p $(vlab_port) \
  "sudo shutdown -h +"$(countdown) || colorize light_red "error: shutdown"
}
