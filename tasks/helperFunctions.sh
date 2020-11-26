#!/usr/bin/env bash

# Helper Functions

function highlight() {
  termwidth="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  colorize yellow $(printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/16))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding")
}

# Usage: version_check ${VERSION_LATEST} <whatever>
function version_check() {
  test "$(echo "$@" | tr " " "\n" | sort | head -n 1)" != "$1";
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

function cache_check() {
    if [[ ${_cache-true} == true ]]; then
    echo 'cache=true'
  else
    echo ''
  fi
}

function countdown() {
  if [[ ${_t} == '' ]]; then
    echo 'now'
  elif [[ ${_t} == 0 ]]; then
    echo 'now'
  elif [[ ${_t} == '-1' ]]; then
    echo 'now'
  elif [[ ${_t} == 'now' ]]; then
    echo 'now'
  else
    echo $_t
  fi
}

function sshkey_path () {
  echo "--private-key=~/.ssh/$(pwless_sshkey)"
}

# Ansible -> Bash Variables

function varfile_check (){
  if [[ -f tasks/ansible_bash.vars ]]; then
    source tasks/ansible_bash.vars
  else
    colorize light_yellow "Run 'vlab config', first"
    exit
  fi
}

function vlab_ip (){
  varfile_check
  if [ -z ${VLAB_IP} ]; then
    VLAB_IP='localhost'
    echo $VLAB_IP
  else
    echo $VLAB_IP
  fi
}

function vlab_port () {
  varfile_check
  if [ -z ${VLAB_PORT} ]; then
    VLAB_PORT'22'
    echo $VLAB_PORT
  else
    echo $VLAB_PORT
  fi
}

function vlab_ssh_user () {
  varfile_check
  if [ -z ${VLAB_SSH_USER} ]; then
    VLAB_PORT='root'
    echo $VLAB_SSH_USER
  else
    echo $VLAB_SSH_USER
  fi
}

function admin_email () {
  varfile_check
  if [ -z ${ADMIN_EMAIL} ]; then
    ADMIN_EMAIL='admin_email@vivumlab.com'
    echo $ADMIN_EMAIL
  else
    echo $ADMIN_EMAIL
  fi
}

function default_username () {
  varfile_check
  if [ -z ${DEFAULT_USERNAME} ]; then
    DEFAULT_USERNAME='admin'
    echo $DEFAULT_USERNAME
  else
    echo $DEFAULT_USERNAME
  fi
}

function domain_check () {
  varfile_check
  if [ -z ${DOMAIN} ]; then
    DOMAIN='localhost'
    echo $ARM
  else
    echo $ARM
  fi
}

function arm_check () {
  varfile_check
  if [ -z ${ARM} ]; then
    ARM='False'
    echo $ARM
  else
    echo $ARM
  fi
}

function pwless_sshkey () {
  varfile_check
  if [ -z ${PASSWORDLESS_SSHKEY} ]; then
    PASSWORDLESS_SSHKEY='id_rsa'
    echo $PASSWORDLESS_SSHKEY
  else
    echo $PASSWORDLESS_SSHKEY
  fi
}
