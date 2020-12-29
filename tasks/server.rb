# frozen_string_literal: true

# Contains convience tasks for remote operation of your vlab server
class Server < Thor
  include VlabI18n

  desc I18n.t('server.shutdown.name'), I18n.t('server.shutdown.desc')
  option :time, type: :numeric, desc: 'Sets a countdown in minutes until the server shuts down'
  def shutdown
    # rubocop:disable Layout/LineLength
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port} sudo shutdown #{options[:time]}"
    # rubocop:enable Layout/LineLength
    say I18n.t('server.shutdown.out.shutdown', time: options[:time]).yellow
  end

  desc I18n.t('server.restart.name'), I18n.t('server.restart.desc')
  option :time, type: :numeric, desc: 'Sets a countdown in minutes until the server restarts'
  def restart
    # rubocop:disable Layout/LineLength
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port} sudo shutdown -r #{options[:time]}"
    # rubocop:enable Layout/LineLength
    say I18n.t('server.restart.out.restart', time: options[:time]).yellow
  end
end
