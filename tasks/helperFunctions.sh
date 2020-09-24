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
  else
    echo ''
  fi
}