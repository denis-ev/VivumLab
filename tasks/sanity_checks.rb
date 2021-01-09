# frozen_string_literal: true

# Class contains logic for verifing the 'sanity' of the environment before
# vlab attempts to deploy, or configure services
class SanityChecks < Thor
  require 'English'
  REQ_PYTHON_VER = '3.6.1'
  REQ_PRECOMMIT_VER = '2.6.0'
  include VlabI18n
  include VlabConstants
  include Utils

  desc I18n.t('sanity_checks.check_ssh_keys.usage'), I18n.t('sanity_checks.check_ssh_keys.desc')
  # @todo Write check_ssh_keys task (sanity_check.rb)
  def check_ssh_keys
    # if File.exist?
  end

  desc I18n.t('sanity_checks.local.usage'), I18n.t('sanity_checks.local.desc')
  def local
    invoke 'check_for_settings'
    invoke 'check_vault_pass'
    invoke 'check_for_git'
    invoke 'check_for_precommit'

    say I18n.t('sanity_checks.local.out.passed').green
  end

  desc I18n.t('sanity_checks.remote.usage'), I18n.t('sanity_checks.remote.desc')
  def remote
    say I18n.t('sanity_checks.remote.out.sshkeyverifying').yellow
    invoke check_ssh_keys
    invoke check_ssh_with_keys
    say I18n.t('sanity_checks.remote.out.sshkeyverified').green
  end

  desc I18n.t('sanity_checks.check_for_settings.usage'), I18n.t('sanity_checks.check_for_settings.desc')
  def check_for_settings
    FileUtils.mkdir_p "settings/#{options[:config_dir]}/passwords"
    invoke 'migration:single_config'
    File.write('tasks/ansible_bash.vars', "PASSWORDLESS_SSHKEY=''") unless File.exist? 'tasks/ansible_bash.vars'
    File.write("settings/#{options[:config_dir]}/.gitignore", ".DS_Store\n/*.yml\n!/encrypted.yml\n") unless File.exist? "settings/#{options[:config_dir]}/.gitignore"
  end

  desc I18n.t('sanity_checks.check_vault_pass.usage'), I18n.t('sanity_checks.check_vault_pass.desc')
  def check_vault_pass
    return unless File.exist?('/vlab_vault_pass') && File.size('/vlab_vault_pass').zero?

    say I18n.t('sanity_checks.check_vault_pass.out.vaultpassmissing', home_dir: Dir.home).red
    say I18n.t('sanity_checks.check_vault_pass.out.vaultpasscreate').light_yellow

    decision = yes?(I18n.t('sanity_checks.check_vault_pass.out.vaultpasscreate'), :yellow)
    invoke 'core:generate_vault_pass' if decision
  end

  desc I18n.t('sanity_checks.check_for_git.usage'), I18n.t('sanity_checks.check_for_git..desc')
  def check_for_git
    `which git`
    say I18n.t('sanity_checks.check_for_git.out.gitnoexist').red unless $CHILD_STATUS.success?
  end

  desc I18n.t('sanity_checks.check_for_precommit.usage'), I18n.t('sanity_checks.check_for_precommit.desc')
  def check_for_precommit
    if system('which pre-commit', out: File::NULL)
      if python_version >= REQ_PYTHON_VER
        required_precommit_exists
      else
        say I18n.t('sanity_checks.check_for_precommit.out.lowpython', req_python_ver: REQ_PYTHON_VER).red
      end
    else
      say I18n.t('sanity_checks.check_for_precommit.out.noprecommit').red
    end
  end

  no_commands do
    def check_ssh_with_keys
      # rubocop:disable Layout/LineLength
      execute_in_shell "ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 #{decrypted_config_file['VLAB_SSH_USER']}@#{decrypted_config_file['VLAB_IP']} exit"
      # rubocop:enable Layout/LineLength
      say I18n.t('sanity_checks.check_ssh_with_keys.out.sshunable').red unless $CHILD_STATUS.success?
    end

    def required_precommit_exists
      return unless pre_commit_version <= REQ_PRECOMMIT_VER

      say I18n.t('sanity_checks.check_for_precommit.out.lowprecommit', precom_ver: REQ_PRECOMMIT_VER).red
    end
  end
end
