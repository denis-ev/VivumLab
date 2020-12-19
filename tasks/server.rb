class Server < Thor
  desc "shutdown", "Executes a shutdown of the Vlab server, optionally with countdown"
  option :time, :type => :numeric, :desc => "Sets a countdown in minutes until the server shuts down"
  def shutdown
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{config_file.passwordless_sshkey} #{config_file.vlab_ssh_user}@#{config_file.vlab_ip} -p #{config_file.vlab_port} sudo shutdown #{options[:time]}"
  end

  desc "shutdown", "Executes a restart of the Vlab server, optionally with countdown"
  option :time, :type => :numeric, :desc => "Sets a countdown in minutes until the server restarts"
  def shutdown
    execute_in_shell "ssh -i #{Dir.home}/.ssh/#{config_file.passwordless_sshkey} #{config_file.vlab_ssh_user}@#{config_file.vlab_ip} -p #{config_file.vlab_port} sudo shutdown -r #{options[:time]}"
  end
end
