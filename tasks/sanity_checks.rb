# frozen_string_literal: true

# Class contains logic for verifing the 'sanity' of the environment before
# vlab attempts to deploy, or configure services
class SanityChecks < Thor
  require 'English'
  REQUIRED_PYTHON_VERSION = '3.6.1'
  REQUIRED_PRECOMMIT_VERSION = '2.6.0'
  include VlabI18n
  include VlabConstants

  desc I18n.t('sanity_checks.check_ssh_keys.name'), I18n.t('sanity_checks.check_ssh_keys.desc')
  # @TODO: Write this task
  def check_ssh_keys
    # if File.exist?
  end

  desc I18n.t('sanity_checks.local.name'), I18n.t('sanity_checks.local.desc')
  def local
    invoke 'check_for_settings'
    invoke 'check_vault_pass'
    invoke 'check_for_git'
    invoke 'check_for_precommit'

    say I18n.t('sanity_checks.local.passed').green
  end

  desc I18n.t('sanity_checks.remote.name'), I18n.t('sanity_checks.remote.desc')
  def remote
    say I18n.t('sanity_checks.remote.sshkeyverifying').yellow
    invoke check_ssh_keys
    invoke check_ssh_with_keys
    say I18n.t('sanity_checks.remote.sshkeyverified').green
  end

  desc I18n.t('sanity_checks.check_for_settings.name'), I18n.t('sanity_checks.check_for_settings.desc')
  def check_for_settings
    FileUtils.mkdir_p "#{options[:config_dir]}/passwords"
    invoke 'migration:single_config'
    File.write('tasks/ansible_bash.vars', "PASSWORDLESS_SSHKEY=''") unless File.exist? 'tasks/ansible_bash.vars'
  end

  desc I18n.t('sanity_checks.check_vault_pass.name'), I18n.t('sanity_checks.check_vault_pass.desc')
  def check_vault_pass
    return unless File.exist?('/vlab_vault_pass') && File.size('/vlab_vault_pass').zero?

    say I18n.t('sanity_checks.check_vault_pass.vaultpassmissing', home_dir: Dir.home).red
    say I18n.t('sanity_checks.check_vault_pass.vaultpasscreate').light_yellow

    decision = yes?(I18n.t('sanity_checks.check_vault_pass.vaultpasscreate'), :yellow)
    invoke 'core:generate_vault_pass' if decision
  end

  desc I18n.t('sanity_checks.check_for_git.name'), I18n.t('sanity_checks.check_for_git..desc')
  def check_for_git
    `which git`
    say I18n.t('sanity_checks.check_for_git.gitnoexist').red unless $CHILD_STATUS.success?
  end

  desc I18n.t('sanity_checks.check_for_precommit.name'), I18n.t('sanity_checks.check_for_precommit.desc')
  def check_for_precommit
    if system('which pre-commit', out: File::NULL)
      if python_version >= REQUIRED_PYTHON_VERSION
        say I18n.t('sanity_checks.check_for_precommit.lowprecommit', req_precommit_ver: REQUIRED_PRECOMMIT_VERSION).red if pre_commit_version <= REQUIRED_PRECOMMIT_VERSION
      else
        say I18n.t('sanity_checks.check_for_precommit.lowpython', req_python_ver: REQUIRED_PYTHON_VERSION).red
      end
    else
      say I18n.t('sanity_checks.check_for_precommit.noprecommit').red
    end
  end

  no_commands do
    def check_ssh_with_keys
      # rubocop:disable Layout/LineLength
      execute_in_shell "ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 #{decrypted_config_file['VLAB_SSH_USER']}@#{decrypted_config_file['VLAB_IP']} exit"
      # rubocop:enable Layout/LineLength
      say I18n.t('sanity_checks.check_ssh_with_keys.sshunable').red unless $CHILD_STATUS.success?
    end
  end
end
