# frozen_string_literal: true

# Contains memoized methods for constants
module VlabConstants
  def current_version
    @current_version ||= File.read('VERSION').chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end

  def python3_installed?
    @python3_installed ||= system('which python3')
  end

  def pre_commit_version
    @pre_commit_version ||= `$(which pre-commit) --version`.chomp.split(' ').last if $CHILD_STATUS.success?
  end

  def python_version
    @python_version ||= `python3 --version`.chomp.split(' ').last if $CHILD_STATUS.success?
  end

  def ssh_key_exists?
    @ssh_key_exists ||= File.exist?("#{Dir.home}/.ssh/#{decrypted_config_file.passwordless_sshkey}")
    if @ssh_key_exists
      say I18n.t('ssh.create_sshkey.out.keyexists',
                 home_dir: Dir.home,
                 passwordless_sshkey: decrypted_config_file.passwordless_sshkey).yellow
    end
    @ssh_key_exists
  end
end
