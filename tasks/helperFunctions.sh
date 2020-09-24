#!/usr/bin/env bash

# Helper Functions

function highlight() {
  termwidth="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  colorize yellow $(printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/16))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding")
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