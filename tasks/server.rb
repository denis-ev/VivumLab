class Server < Thor
  include VlabI18N

  desc "shutdown", "Executes a shutdown of the Vlab server, optionally with countdown"
  option :time, :type => :numeric, :desc => "Sets a countdown in minutes until the server shuts down"
  def shutdown
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port} sudo shutdown #{options[:time]}"
  end

  desc "restart", "Executes a restart of the Vlab server, optionally with countdown"
  option :time, :type => :numeric, :desc => "Sets a countdown in minutes until the server restarts"
  def restart
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port} sudo shutdown -r #{options[:time]}"
  end
end
