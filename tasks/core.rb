class Core < Thor
  require './tasks/utils.rb'
  include Utils
  require 'etc'
  desc "logo", "displays the VivumLab logo"
  def logo()
    cat "vivumlablogo.txt"
    invoke "core:check_version"
  end

  desc "check_version", "checks the local version against the latest from github"
  def check_version()
    say "You have version #{current_version} and #{latest_version} is the latest".blue
    say "You're up to date".green if current_version == latest_version
    cat "MOTD"
    invoke "sanity_checks:local"
  end

  desc "generate_ansible_pass", "Creates a new Vault Password"
  def generate_ansible_pass()
    # This *is* a deviation from the shell based version. Instead of
    # generating a datetime stamp, sha256sum'ing it then base64ing it
    # and snagging the first 32 bytes ... we're relying on ruby's
    # built in SecureRandom.base64 to give us a secure, high entropy
    # string that's already base64 encoded.
    #
    # This *SHOULD* be safe - this shouldn't run, unless
    # ~/.vlab_vault_pass *does not exist* It's imperative that calling
    # tasks that want to overwrite the vault pass, need to delete the existing
    # vault pass before calling this.
    if not File.exist? "#{Dir.home}/.vlab_vault_pass"
      File.write("#{Dir.home}/.vlab_vault_pass", SecureRandom.base64(32))
    end
  end

  # desc "build", "Forces a rebuild/repull of the Vlab Docker image"
  # def build()
  #   # if cache is ok, just pull, because if we're on the latest, cache will have it
  #   if options[:cache] and not options[:force]
  #     say "Pulling latest version, using cache if available".yellow
  #     execute_in_shell("sudo docker pull vivumlab/vivumlab")
  #     return #break
  #   else
  #     vlab_image = execute_in_shell("docker images -a | grep vivumlab/vivumlab")&.first&.split(/ {2,}/) rescue nil
  #     unless vlab_image.nil?
  #       say "test"
  #       # delete the existing image
  #       execute_in_shell("sudo docker rmi --force #{vlab_image[2]}")
  #     end
  #     if options[:build]
  #       # build from local directory, no cache.
  #       execute_in_shell("sudo docker build . --no-cache --force-rm -t vivumlab/vivumlab:latest")
  #     else
  #       # having forced the delte, pull a new version
  #       execute_in_shell("sudo docker pull vivumlab/vivumlab")
  #     end
  #   end
  # end

  desc "deploy", "Deploys VivumLab, configures it first if needed"
  def deploy()
    invoke "core:logo"
    say "Deploying Vivumlab".green
    run_playbook("playbook.vivumlab.yml", options)
  end

  desc "encrypt", "Encrypts the Vault"
  def encrypt()
    say "Encrypting the vault".red
    result = run_docker("ansible-vault encrypt #{options[:config_dir]}/vault.yml")
    # user_info = Etc.getpwnam(Etc.getlogin)
    # execute_in_shell("sudo chmod 640 #{options[:config_dir]}/vault.yml")
    # execute_in_shell("sudo chown #{user_info['uid']}:#{user_info['gid']} #{options[:config_dir]}/vault.yml")
    say "Vault Encrypted".green if result.success? or result.out.include? "input is already encrypted"
  end

  desc "decrypt", "Decrypts the Vault"
  def decrypt()
    say "Decrypting the vault"
    result = run_docker("ansible-vault decrypt #{options[:config_dir]}/vault.yml")
    # user_info = Etc.getpwnam(Etc.getlogin)
    # execute_in_shell("sudo chmod 640 #{options[:config_dir]}/vault.yml")
    # execute_in_shell("sudo chown #{user_info['uid']}:#{user_info['gid']} #{options[:config_dir]}/vault.yml")
    say "Vault Decrypted".green if result.success? or result.out.include? "is not a vault encrypted file"
  end

  desc "uninstall", "Uninstalls VivumLab"
  def uninstall()
    invoke "core:logo"
    invoke 'build', options
    say "Uninstalling Vivumlab".red
    return unless yes? "Are you sure?"
    run_playbook("playbook.remove.yml", options)
  end

  desc "restore", "Restores a server from backups. Assuming you ran them"
  def restore()
    say "Restoring..."
    run_playbook("playbook.restore.yml", options)
  end

  desc "install_cli", "Installs the CLI to /usr/local/bin so you can call vlab without ./"
  def install_cli()
    execute_in_shell("sudo ln -s $PWD/vlab /usr/local/bin/vlab")
  end

end
