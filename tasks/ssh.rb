# frozen_string_literal: true

# Contains logic and tasks related to SSH
class Ssh < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('ssh.launch.usage'), I18n.t('ssh.launch.desc')
  def launch
    say I18n.t('ssh.launch.out.launching').light_blue
    # rubocop:disable Layout/LineLength
    exec("ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port}")
    # rubocop:enable Layout/LineLength
  end

  desc I18n.t('ssh.create_sshkey.usage'), I18n.t('ssh.create_sshkey.desc')
  def create_sshkey
    return if ssh_key_exists?

    say I18n.t('ssh.create_sshkey.out.keycreating',
               passwordless_sshkey: decrypted_config_file.passwordless_sshkey).yellow
    # rubocop:disable Layout/LineLength
    execute_in_shell("ssh-keygen -q -N '' -C 'VivumLab@#{decrypted_config_file.domain}' -f #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
    # rubocop:enable Layout/LineLength
    say I18n.t('ssh.create_sshkey.out.keycreated').green
  end

  desc I18n.t('ssh.copy_sshkey.usage'), I18n.t('ssh.copy_sshkey.desc')
  # rubocop:disable Metrics/AbcSize
  def copy_sshkey
    say I18n.t('ssh.copy_sshkey.out.keycopying', vlab_ip: decrypted_config_file.vlab_ip).light_blue
    to_run = <<~EXECUTE
      ssh-copy-id -p #{decrypted_config_file.vlab_port} -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}.pub \
      #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip}
    EXECUTE
    execute_in_shell(to_run)
    say I18n.t('ssh.copy_sshkey.out.keycopied').green
  end
  # rubocop:enable Metrics/AbcSize

  desc I18n.t('ssh.setup.usage'), I18n.t('ssh.setup.desc')
  def setup
    invoke create_sshkey
    invoke copy_sshkey
  end

  default_task :launch
end
