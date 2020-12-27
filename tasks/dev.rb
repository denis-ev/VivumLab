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

    say I18n.t(:dev.s_welcome)
    return unless yes?(I18n.t(:dev.q_contribute), :yellow)

    install_precommit
    say I18n.t(:dev.s_precommiterror).red unless system('which pre-commit >/dev/null')
    say I18n.t(:dev.s_readythanks).green
  end

  no_commands do
    def install_precommit
      say I18n.t(:dev.s_welcome).green
      say I18n.t(:dev.s_readdevdocs).yellow
      say I18n.t(:dev.s_precommitwarning).yellow
      say I18n.t(:dev.s_pythonerror).red unless python3_installed
      `curl https://pre-commit.com/install-local.py | python3 -` if python3_installed? && yes?('Install pre-commit now?')
    end
  end
end
