# frozen_string_literal: true

# Class contains logic for verifing the "sanity" of the environment before
# vlab attempts to deploy, or configure services
class SanityChecks < Thor
  require 'English'
  REQUIRED_PYTHON_VERSION = '3.6.1'
  REQUIRED_PRECOMMIT_VERSION = '2.6.0'
  include VlabI18n

  desc 'check_ssh_keys', 'Creates or updates SSH keys as necessary'
  # @TODO: Write this task
  def check_ssh_keys
    # if File.exist?
  end

  desc 'local', 'Local Sanity Checks'
  def local
    invoke 'check_for_settings'
    invoke 'check_vault_pass'
    invoke 'check_for_git'
    invoke 'check_for_precommit'

    say I18n.t(:s_sc_localpassed).green
  end

  desc "remote", "Remote Server sanity checks"
  def remote
    say I18n.t(:s_sc_sshkeyverifying).yellow
    invoke check_ssh_keys
    invoke check_ssh_with_keys
    say I18n.t(:s_sc_sshkeyverified).green
  end

  desc 'check_for_settings', 'Verifies settings exist'
  def check_for_settings
    FileUtils.mkdir_p "#{options[:config_dir]}/passwords"
    invoke 'migration:single_config'
    File.write("tasks/ansible_bash.vars", "PASSWORDLESS_SSHKEY=''") unless File.exist? "tasks/ansible_bash.vars"
  end

  desc 'check_vault_pass', 'Checks for the presence of a Vault Password file'
  def check_vault_pass
    if (!File.exist?("/vlab_vault_pass")) || (File.size("/vlab_vault_pass") == 0)
      say I18n.t(:s_sc_vaultpassmissing).red
      say I18n.t(:s_sc_vaultpasscreate).light_yellow

      decision = yes?("say I18n.t(:q_sc_vaultpasscreate)", :yellow)
      # decision = yes?("Let Vlab create a new `.vlab_vault_pass` for you? [yes/no]", :red, limited_to: ['yes', 'no'])
      if decision
        invoke "core:generate_vault_pass"
      end
    end
  end

  desc 'check_for_git', 'Checks the local machine for Git'
  def check_for_git
    `which git`
    say I18n.t(:s_sc_gitnoexist).red unless $CHILD_STATUS.success?
  end

  desc 'check_for_precommit', 'Checks for the presence of Pre-commit'
  def check_for_precommit
    if system('which pre-commit', out: File::NULL)
      pre_commit_version = `pre-commit --version`.chomp.split(' ').last if $CHILD_STATUS.success?
      python_version = `python3 --version`.chomp.split(' ').last if $CHILD_STATUS.success?
      if python_version >= REQUIRED_PYTHON_VERSION
        if pre_commit_version <= REQUIRED_PRECOMMIT_VERSION
          say I18n.t(:s_sc_lowprecommit).yellow
        end
      else
        say I18n.t(:s_sc_lowpython).yellow
      end
    else
      say I18n.t(:s_sc_noprecommit).yellow
    end
  end

  no_commands do
    def check_ssh_with_keys()
      execute_in_shell "ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 #{decrypted_config_file["VLAB_SSH_USER"]}@#{decrypted_config_file["VLAB_IP"]} exit"
      say I18n.t(:s_sc_sshunable).red unless $?.success?
    end
  end
end
