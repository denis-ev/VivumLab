#!/usr/bin/env bash

# Run linting scripts
Task::lint(){
  highlight "Linting"
  Task::run_docker pip install yamllint; find . -type f -name '*.yml' | sed 's|\./||g' | egrep -v '(\.kitchen/|\[warning\]|\.molecule/)' | xargs yamllint -c yamllint.conf -f parsable

}

Task::dev_setup(){
  : @desc "Run to install dev requirements"

  colorize light_blue "Welcome to VivumLab Developer setup"
  echo ""
  read -p "Do you want to contribute to VivumLab (yes or no)?" contribute
  case $contribute in
  [Yy]|[Yy][Ee][Ss]|[Tt][Rr][Uu][Ee])
    colorize light_green "Thanks for helping out!!"
    colorize light_yellow "Firstly, please make sure you have read the developers docs for VivumLab"
    colorize light_yellow "The docs were written to help you"
      sleep 2
    colorize light_yellow "Before you push any changes you've made,"
    colorize light_yellow "pre-commit will need to be installed on your system"
      sleep 1
    colorize yellow "Let's try this now"
      sleep 2
    colorize light_yellow "Installing pre-commit"
      curl https://pre-commit.com/install-local.py | python -
    colorize light_red "if this fails, ensure you have python3 installed"
    colorize light_red "In future releases of VivumLab, VivumLab will assist in Python installation"
    sleep 1
    colorize light_blue "Thanks again for helping. Happy developing"
    ;;
  *)
    colorize light_yellow "If you change your mind, run this command again"
    colorize light_red "Please Note: if you don't, any changes you try to push will fail"
    ;;
  esac
}
