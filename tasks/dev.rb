# frozen_string_literal: true

# Contains tasks for developing Vlab, not using it.
class Dev < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

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

    I18n.t(:s_dev_welcome)
    return unless yes?("I18n.t(:q_dev_contribute)", :yellow)

    I18n.t(:s_dev_welcome).green
    I18n.t(:s_dev_readdevdocs).yellow
    I18n.t(:s_dev_precommitwarning).yellow
    `curl https://pre-commit.com/install-local.py | python3 -` if python3_installed? && yes?('Install pre-commit now?')
    I18n.t(:s_dev_pythonerror).red unless python3_installed
    I18n.t(:s_dev_precommiterror).red unless system('which pre-commit >/dev/null')
    I18n.t(:s_dev_readythanks).green
  end
end
