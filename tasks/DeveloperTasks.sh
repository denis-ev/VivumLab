#!/usr/bin/env bash

# Run linting scripts
Task::lint(){
  highlight "Linting"
  Task::run_docker pip install yamllint; find . -type f -name '*.yml' | sed 's|\./||g' | egrep -v '(\.kitchen/|\[warning\]|\.molecule/)' | xargs yamllint -c yamllint.conf -f parsable

}

Task::dev_setup(){
  echo "Welcome to VivumLab Dev setup"
  echo ""
  read -p "Do you want to contribute to VivumLab (yes or no)?" contribute
  case $contribute in
  [Yy]|[Yy][Ee][Ss]|[Tt][Rr][Uu][Ee])
    echo "Thanks for helping out!!"
    echo "Firstly, please make sure you read the developers docs for VivumLab"
    echo "The docs were written to help you"
      sleep 2
    echo "Before you push any changes you've made,"
    echo "pre-commit will need to be installed on your system"
      sleep 1
    echo "Let's try this now"
      sleep 2
    echo "Installing pre-commit"
      curl https://pre-commit.com/install-local.py | python -
    echo "if this fails, ensure you have python3 installed"
    echo "In future releases of VivumLab, VivumLab will assist in Python installation"
    sleep 1
    echo "Thanks again for helping. Happy developing"
    ;;
  *)
    echo "If you change your mind, run this command again"
    echo "Please Note: if you don't, any changes you try to push will fail"
    ;;
  esac
}
