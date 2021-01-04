# frozen_string_literal: true

# Contains tasks for developing Vlab, not using it.
class Dev < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('dev.setup.usage'), I18n.t('dev.setup.desc')
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
      return unless python3_installed? && yes?(I18n.t('dev.install_precommit.in.installprecommit'), :yellow)

      `curl https://pre-commit.com/install-local.py | python3 -`
    end
  end
end
