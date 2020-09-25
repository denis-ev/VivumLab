#!/usr/bin/env bash

# Helper Functions

function highlight() {
  termwidth="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  colorize yellow $(printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/16))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding")
}

function debug_check() {
  if [[ ${_debug-true} == 'super' ]]; then
    echo '-vvvv'
  elif [[ ${_debug-true} == 'high' ]]; then
    echo '-vvv'
  elif [[ ${_debug-true} == 'low' ]]; then
    echo '-vv'
  elif [[ ${_debug-true} == true ]]; then
    echo '-vv'
  fi
  }

function build_check() {
  if [[ ${_build-true} == true ]]; then
    echo 'build=true'
   else
    echo ''
  fi
}

function force_check() {
  if [[ ${_force-true} == true ]]; then
    echo 'force=true'
  else
    echo ''
  fi
}

# Ansible -> Bash Variables

function vlab_ip (){
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ VLAB_IP == '' ]]; then
    VLAB_IP='localhost'
    echo $VLAB_IP
  else
    echo $VLAB_IP
  fi
  else
  VLAB_IP='localhost'
  echo $VLAB_IP
fi
}

function vlab_port () {
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ VLAB_PORT == '' ]]; then
    VLAB_PORT'22'
    echo $VLAB_PORT
  else
    echo $VLAB_PORT
  fi
  else
  VLAB_PORT='22'
  echo $VLAB_PORT
fi
}

function vlab_ssh_user () {
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ VLAB_SSH_USER == '' ]]; then
    VLAB_PORT='root'
    echo $VLAB_SSH_USER
  else
    echo $VLAB_SSH_USER
  fi
  else
  VLAB_PORT='root'
  echo $VLAB_SSH_USER
fi
}

function admin_email () {
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ ADMIN_EMAIL == '' ]]; then
    ADMIN_EMAIL='admin_email@vivumlab.com'
    echo $ADMIN_EMAIL
  else
    echo $ADMIN_EMAIL
  fi
  else
  ADMIN_EMAIL='admin_email@vivumlab.com'
  echo $ADMIN_EMAIL
fi
}

function default_username () {
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ DEFAULT_USERNAME == '' ]]; then
    DEFAULT_USERNAME='admin'
    echo $DEFAULT_USERNAME
  else
    echo $DEFAULT_USERNAME
  fi
  else
  DEFAULT_USERNAME='admin'
  echo $DEFAULT_USERNAME
fi
}

function arm_check () {
if [[ -f tasks/ansible_bash.vars ]]; then
  source tasks/ansible_bash.vars
  if [[ ARM == '' ]]; then
    ARM='False'
    echo $ARM
  else
    echo $ARM
  fi
  else
  ARM='False'
  echo $ARM
fi
}
