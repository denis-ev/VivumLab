# frozen_string_literal: true

# Class contains logic for verifing the "sanity" of the environment before
# vlab attempts to deploy, or configure services
class SanityChecks < Thor
  require 'English'
  REQUIRED_PYTHON_VERSION = '3.6.1'
  REQUIRED_PRECOMMIT_VERSION = '2.6.0'

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

    say 'Local sanity checks passed'.green
  end

  desc 'remote', 'Remote Server sanity checks'
  def remote
    say 'Verifying SSH Keys, and the ability to remotely log in to your vLab server via passwordless ssh'.yellow
    invoke check_ssh_keys
    invoke check_ssh_with_keys
    say 'SSH Keys good to go'.green
  end

  desc 'check_for_settings', 'Verifies settings exist'
  def check_for_settings
    FileUtils.mkdir_p "#{options[:config_dir]}/passwords"
    invoke 'migration:single_config'
    # rubocop:disable Layout/LineLength
    File.write("#{options[:config_dir]}/config.yml", 'blank_on_purpose: True') unless File.exist? "#{options[:config_dir]}/config.yml"
    File.write("#{options[:config_dir]}/vault.yml", 'blank_on_purpose: True') unless File.exist? "#{options[:config_dir]}/vault.yml"
    # rubocop:enable Layout/LineLength
    File.write('tasks/ansible_bash.vars', "PASSWORDLESS_SSHKEY=''") unless File.exist? 'tasks/ansible_bash.vars'
  end

  desc 'check_vault_pass', 'Checks for the presence of a Vault Password file'
  def check_vault_pass
    return unless !File.exist?('/vlab_vault_pass') || File.size('/vlab_vault_pass').zero?

    missing = <<-NOVAULT
    Oops, your vault password in #{Dir.home}, doesn't appear to exist.
    This is unusual, but could be the result of the username changing after setup.
    NOVAULT
    say missing.red

    create = <<-CREATE
    Vlab can create a new `.vlab_vault_pass` file for you.
    Or you can exit, and try to sort this out yourself
    CREATE
    say create.light_yellow

    decision = yes?('Let Vlab create a new .vlab_vault_pass for you? [y/n]', :yellow)
    invoke 'core:generate_vault_pass' if decision
  end

  desc 'check_for_git', 'Checks the local machine for Git'
  def check_for_git
    `which git`
    say 'You need to install git!'.red unless $CHILD_STATUS.success?
  end

  desc 'check_for_precommit', 'Checks for the presence of Pre-commit'
  def check_for_precommit
    if system('which pre-commit', out: File::NULL)
      pre_commit_version = `pre-commit --version`.chomp.split(' ').last if $CHILD_STATUS.success?
      python_version = `python3 --version`.chomp.split(' ').last if $CHILD_STATUS.success?
      if python_version >= REQUIRED_PYTHON_VERSION
        if pre_commit_version <= REQUIRED_PRECOMMIT_VERSION
          required_version = <<-REQUIRED
          Pre-commit is not installed or a new enough version.
          Vlab requires Pre-Commit version #{REQUIRED_PRECOMMIT_VERSION} for Contributions.
          Run `vlab dev setup` when you're ready
          REQUIRED
          say required_version.blue
        end
      else
        say "Python version #{REQUIRED_PYTHON_VERSION} is required for vLab to work"
      end
    else
      say 'Pre-commit is not installed'.yellow
      say 'Contributions require installing \'pre-commit\'. Run vlab dev_setup, when you\'re ready'.yellow
    end
  end

  no_commands do
    def check_ssh_with_keys
      # rubocop:disable Layout/LineLength
      execute_in_shell "ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=3 #{decrypted_config_file['VLAB_SSH_USER']}@#{decrypted_config_file['VLAB_IP']} exit"
      # rubocop:enable Layout/LineLength
      say 'VivumLab is unable to ssh to your server using the information in your config.yml'.red unless $CHILD_STATUS.success?
    end
  end
end
