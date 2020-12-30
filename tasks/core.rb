# frozen_string_literal: true

# Contains core tasks of the Vlab Cli
class Core < Thor
  require './tasks/utils'
  include Utils
  require 'etc'
  include VlabI18n

  ENCRYPTION_KEY = "#{Dir.home}/.vlab_vault_pass"

  desc I18n.t('core.checkversion.usage'), I18n.t('core.checkversion.desc')
  def check_version
    say I18n.t('core.checkversion.out.currentversion', current_version: current_version).light_blue
    say I18n.t('core.checkversion.out.versionlatest').green if current_version == latest_version
    say I18n.t('core.checkversion.out.versionupdate').yellow if current_version != latest_version
    invoke 'sanity_checks:local'
  end

  desc I18n.t('core.generate_vault_pass.usage'), I18n.t('core.generate_vault_pass.desc')
  def generate_vault_pass
    # This *is* a deviation from the shell based version. Instead of
    # generating a datetime stamp, sha256sum'ing it then base64ing it
    # and snagging the first 32 bytes ... we're relying on ruby's
    # built in SecureRandom.base64 to give us a secure, high entropy
    # string that's already base64 encoded.
    #
    # This *SHOULD* be safe - this shouldn't run, unless
    # ~/.vlab_vault_pass *does not exist* It's imperative that calling
    # tasks that want to overwrite the vault pass, need to delete the existing
    # vault pass before calling this.
    say I18n.t('core.generate_vault_pass.out.noaction').light_blue
    File.write(ENCRYPTION_KEY, SecureRandom.base64(32)) unless File.exist? "#{Dir.home}/.vlab_vault_pass"
  end

  desc I18n.t('core.deploy.usage'), I18n.t('core.deploy.desc')
  def deploy
    say I18n.t('core.deploy.out.deploy').light_blue
    run_playbook('playbook.vivumlab.yml', options)
  end

  desc I18n.t('core.restore.usage'), I18n.t('core.restore.desc')
  def restore
    say I18n.t('core.restore.out.restoring').yellow
    run_playbook('playbook.restore.yml', options)
    say I18n.t('core.restore.out.restored').green
  end
end
