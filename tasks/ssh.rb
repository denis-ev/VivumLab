class Ssh < Thor
  require './tasks/utils.rb'
  include Utils
  include VlabI18n

  desc "launch", "Opens a shell on your VivumLab server"
  def launch
    I18n.t(:s_ssh_launching)
    exec("ssh -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey} #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip} -p #{decrypted_config_file.vlab_port}")
  end

  desc "create_sshkey", "Creates an SSH key, if one doesn't exist"
  def create_sshkey
    if File.exist("#{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
      I18n.t(:s_ssh_keyexists).red
      return
    end
    I18n.t(:s_ssh_keycreating).yellow
    execute_in_shell("ssh-keygen -q -N '' -C 'VivumLab@#{decrypted_config_file.domain}' -f #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
    I18n.t(:s_ssh_keycreated).green
  end

  desc "copy_sshkey", "Copy your ssh key over to the server"
  def copy_sshkey
    I18n.t(:s_ssh_keycopying).yellow
    to_run = <<-EXECUTE
    ssh-copy-id -p #{decrypted_config_file.vlab_ip} -i #{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}.pub \
    #{decrypted_config_file.vlab_ssh_user}@#{decrypted_config_file.vlab_ip}
    EXECUTE
    execute_in_shell(to_run)
    I18n.t(:s_ssh_keycopied).green
  end

  desc "setup", "Creates and copies ssh keys to your server"
  def setup
    invoke create_sshkey
    invoke copy_sshkey
  end

  default_task :launch
end
