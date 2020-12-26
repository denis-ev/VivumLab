# frozen_string_literal: true

# Contains tasks for developing Vlab, not using it.
class Dev < Thor
  require './tasks/utils'
  include Utils
  include VlabI18N

  desc 'lint', 'Lints all the YAML files'
  def lint
    lint_exec = <<-LINT
    pip3 install yamllint; \
    find . -type f -name '*.yml' | sed 's|\./||g' | egrep -v '(\.kitchen/|\[warning\]|\.molecule/)' | \
    xargs yamllint -c yamllint.conf -f parsable
    LINT
    execute_in_shell lint_exec
  end

  desc 'setup', 'Run to install Dev Requirements'
  def setup
    return if system('which pre-commit >/dev/null')

    say 'Welcome to VivumLab Developer Setup'.blue
    return unless yes?('Do you want to contribute to VivumLab (Yes or no)?')

    say 'Thanks for helping out'.light_green
    # TODO: add url to dev docs
    say 'First, please make sure you have read the developer docs'.light_yellow
    say 'Before you push any changes you\'ve made, pre-commit will need to be installed on your system'.light_yellow
    `curl https://pre-commit.com/install-local.py | python3 -` if python3_installed? && yes?('Install pre-commit now?')
    say 'Vlab was unable to find Python3 using `which python3`. You must install python3'.red unless python3_installed
    failed_to_find_precommit = 'Unable to find pre-commit in your path, you may need to add ~/bin to your path.'
    say failed_to_find_precommit.red unless system('which pre-commit >/dev/null')
    say 'All set!'.green
  end
end
