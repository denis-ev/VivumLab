class Dev < Thor
  require './tasks/utils.rb'
  include Utils
  desc "lint", "Lints all the YAML files"
  def lint()
    run_docker "pip3 install yamllint; find . -type f -name '*.yml' | sed 's|\./||g' | egrep -v '(\.kitchen/|\[warning\]|\.molecule/)' | xargs yamllint -c yamllint.conf -f parsable"
  end

  desc "setup", "Run to install Dev Requirements"
  def setup
    return if system("which pre-commit >/dev/null")
    say "Welcome to VivumLab Developer Setup".blue
    if yes?("Do you want to contribute to VivumLab (Yes or no)?")
      say "Thanks for helping out".light_green
      # todo: add url to dev docs
      say "First, please make sure you have read the developer docs".light_yellow
      say "Before you push and changes you've made, pre-commit will need to be installed on your system".light_yellow
      if system("which python3")
        if yes?("Install pre-commit now?")
          %x{curl https://pre-commit.com/install-local.py | python3 -}
        end
      else
        say "Vlab was unable to find Python3 using `which python3`. You must install python3".red
      end
      say "Unable to find pre-commit in your path, you may need to add ~/bin to your path." unless system("which pre-commit >/dev/null")
      say "All set!".green
    end
  end
end
