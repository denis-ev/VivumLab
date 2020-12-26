# frozen_string_literal: true

# Contains core tasks of the Vlab Cli
class Core < Thor
  require './tasks/utils'
  include Utils
  require 'etc'
  include VlabI18n

  ENCRYPTION_KEY = "#{Dir.home}/.vlab_vault_pass"

  desc 'check_version', 'checks the local version against the latest from github'
  def check_version
    I18n.t(:s_core_currentversion)
    I18n.t(:s_core_versionlatest).green if current_version == latest_version
    I18n.t(:s_core_versionupdate).yellow if current_version != latest_version
    invoke 'sanity_checks:local'
  end

  desc 'generate_vault_pass', 'Creates a new Vault Password'
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
    File.write(ENCRYPTION_KEY, SecureRandom.base64(32)) unless File.exist? "#{Dir.home}/.vlab_vault_pass"
  end

  desc 'deploy', 'Deploys VivumLab, configures it first if needed'
  def deploy
    I18n.t(:s_core_deploy).green
    run_playbook('playbook.vivumlab.yml', options)
  end

  #desc 'uninstall', 'Uninstalls VivumLab'
  #def uninstall
  #  invoke 'build', options
  #  I18n.t(:s_core_uninstall).yellow
  #  return unless yes? I18n.t(:q_core_uninstall).red
  #
  #  run_playbook('playbook.remove.yml', options)
  #  I18n.t(:s_core_uninstalled).yellow
  #end

  desc 'restore', 'Restores a server from backups. Assuming you ran them'
  def restore
    I18n.t(:s_core_restoring).yellow
    run_playbook('playbook.restore.yml', options)
    I18n.t(:s_core_restored).yellow
  end
end
