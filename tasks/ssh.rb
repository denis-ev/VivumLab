class Ssh < Thor
  require './tasks/utils.rb'
  include Utils

  desc "run_shell", "Opens a shell on your VivumLab server"
  def run_shell
    say "Launching an SSH session to your server"
    exec("ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port}")
  end

  desc "create_sshkey", "Creates an SSH key, if one doesn't exist"
  def create_sshkey
    if File.exist("#{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
      say "SSH Key already exists at #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}".red
      return
    end
    say "Creating #{decrypted_config_file.passwordless_sshkey} and #{decrypted_config_file.passwordless_sshkey}.pub".light_green
    execute_in_shell("ssh-keygen -q -N '' -C 'VivumLab@#{decrypted_config_file.domain}' -f #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
    say "Key Created".green
  end

  desc "copy_sshkey", "Copy your ssh key over to the server"
  def copy_sshkey
    say "Copying keys to your server at #{decrypted_config_file.vlab_ip}"
    to_run = <<-EXECUTE
    ssh-copy-id -p #{decrypted_config_file.vlab_ip} -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}.pub \
    #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip}
    EXECUTE
    execute_in_shell(to_run)
  end

  desc "setup_ssh", "Creates and copies ssh keys to your server"
  def setup_ssh
    invoke create_sshkey
    invoke copy_sshkey
  end

  default_task :run_shell
end
