# frozen_string_literal: true

# Contains logic and tasks related to SSH
class Ssh < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'launch', 'Opens a shell on your VivumLab server'
  def launch
    say I18n.t('ssh.s_launching')
    # rubocop:disable Layout/LineLength
    exec("ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port}")
    # rubocop:enable Layout/LineLength
  end

  desc 'create_sshkey', 'Creates an SSH key, if one doesn\'t exist'
  def create_sshkey
    say I18n.t('ssh.s_keyexists').red && return if ssh_key_exists?
    say I18n.t('ssh.s_keycreating').yellow
    # rubocop:disable Layout/LineLength
    execute_in_shell("ssh-keygen -q -N '' -C 'VivumLab@#{decrypted_config_file.domain}' -f #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
    # rubocop:enable Layout/LineLength
    say I18n.t('ssh.s_keycreated').green
  end

  desc 'copy_sshkey', 'Copy your ssh key over to the server'
  def copy_sshkey
    say I18n.t('ssh.s_keycopying').yellow
    to_run = <<-EXECUTE
    ssh-copy-id -p #{decrypted_config_file.vlab_ip} -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}.pub \
    #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip}
    EXECUTE
    execute_in_shell(to_run)
    say I18n.t('ssh.s_keycopied').green
  end

  desc 'setup', 'Creates and copies ssh keys to your server'
  def setup
    invoke create_sshkey
    invoke copy_sshkey
  end

  default_task :launch
end
