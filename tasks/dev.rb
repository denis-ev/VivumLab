# frozen_string_literal: true

# Contains tasks for developing Vlab, not using it.
class Dev < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('dev.lint.name'), I18n.t('dev.lint.desc')
  def lint
    lint_exec = <<-LINT
    pip3 install yamllint; \
    find . -type f -name '*.yml' | sed 's|\./||g' | egrep -v '(\.kitchen/|\[warning\]|\.molecule/)' | \
    xargs yamllint -c yamllint.conf -f parsable
    LINT
    execute_in_shell lint_exec
  end

  desc I18n.t('dev.setup.name'), I18n.t('dev.setup.desc')
  def setup
    return if system('which pre-commit >/dev/null')

    say I18n.t('dev.setup.out.welcome').light_blue
    return unless yes?(I18n.t('dev.setup.in.contribute'), :yellow)

    install_precommit
    say I18n.t('dev.setup.out.precommiterror').red unless system('which pre-commit >/dev/null')
    say I18n.t('dev.setup.out.readythanks').green
  end

  no_commands do
    def install_precommit
      say I18n.t('dev.install_precommit.out.readdevdocs').yellow
      say I18n.t('dev.install_precommit.out.precommitwarning').yellow
      say I18n.t('dev.install_precommit.out.pythonerror').red unless python3_installed
      `curl https://pre-commit.com/install-local.py | python3 -` if python3_installed? && yes?(I18n.t('dev.install_precommit.in.installprecommit'), :yellow)
    end
  end
end
