module Vlab
  class Core < SubCommandBase
    require 'etc'
    desc "logo", "displays the VivumLab logo"
    def logo()
      cat "vivumlablogo.txt"
      invoke_subcommand "Core", "check_version"
    end

    desc "check_version", "checks the local version against the latest from github"
    def check_version()
      say "You have version #{current_version} and #{latest_version} is the latest".blue
      say "You're up to date".green if current_version == latest_version
      cat "MOTD"

      invoke_subcommand "SanityChecks", "local"

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

    desc "show", "Show the docs for the specified service"
    def show(service)
      puts TTY::Markdown.parse_file("docs/software/#{service}.md")
    end

    desc "build", "Forces a rebuild/repull of the Vlab Docker image"
    option :cache, :type => :boolean, :default => true
    option :force, :type => :boolean, :default => false
    option :build, :type => :boolean, :default => false
    def build()
      # if cache is ok, just pull, because if we're on the latest, cache will have it
      if options[:cache] and not options[:force]
        say "Pulling latest version, using cache if available".yellow
        execute_in_shell("sudo docker pull vivumlab/vivumlab")
        return #break
      else
        vlab_image = execute_in_shell("docker images -a | grep vivumlab/vivumlab")&.first&.split(/ {2,}/) rescue nil
        unless vlab_image.nil?
          say "test"
          # delete the existing image
          execute_in_shell("sudo docker rmi --force #{vlab_image[2]}")
        end
        if options[:build]
          # build from local directory, no cache.
          execute_in_shell("sudo docker build . --no-cache --force-rm -t vivumlab/vivumlab:latest")
        else
          # having forced the delte, pull a new version
          execute_in_shell("sudo docker pull vivumlab/vivumlab")
        end
      end
    end

    desc "deploy", "Deploys VivumLab, configures it first if needed"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :debug, :desc => "Debugs Ansible-playbook commands"
    option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def deploy()
      invoke_subcommand "Core", "logo"
      invoke 'build', [], {:force => options[:force], :build => options[:build], :cache => options[:cache]}
      say "Deploying Vivumlab".green
      debug_flag = options[:debug] ? '-vvv' : ''
      playbook_command = <<-PLAYBOOK
      ansible-playbook playbook.vivumlab.yml #{debug_flag} \
      --extra-vars="@#{options[:config_dir]}/config.yml" \
      --extra-vars="@#{options[:config_dir]}/vault.yml" \
      -i inventory
      PLAYBOOK
      run_docker(playbook_command)
    end

    desc "sync", "Syncs your settings git repo"
    def sync
      cmd = TTY::Command.new(pty: true, uuid: false, printer: :progress)
      if Dir.exist? "settings/.git"
        say "Synching settings via Git".green
        FileUtils.mkdir_p 'settings/.git/hooks'
        FileUtils.cp 'git_sync_pre_commit', 'settings/.git/hooks/pre-commit'
        FileUtils.chmod '+x', 'settings/.git/hooks/pre-commit'
        cmd.run!("git pull", chdir: "settings/")
        cmd.run!("git add . > /dev/null", chdir: "settings/")
        cmd.run!("git commit -a -m 'Settings update' || true", chdir: "settings/")
        cmd.run!("git push > /dev/null", chdir: "settings/")
      else
        say "Warning! Your settings directory is not setup as a Git Repository. Make sure to back them up using some other method. https://vivumlab.com/setup/installation/#syncing-settings-via-git ".light_red
      end
    end

    desc "encrypt", "Encrypts the Vault"
    def encrypt()
      say "Encrypting the vault".red
      result = run_docker("ansible-vault encrypt settings/vault.yml")
      user_info = Etc.getpwnam(Etc.getlogin)
      execute_in_shell("sudo chmod 640 settings/vault.yml")
      execute_in_shell("sudo chown #{user_info['uid']}:#{user_info['gid']} settings/vault.yml")
      say "Vault Encrypted".green if result.success? or result.out.include? "input is already encrypted"
    end

    desc "decrypt", "Decrypts the Vault"
    def decrypt()
      say "Decrypting the vault"
      result = run_docker("ansible-vault decrypt settings/vault.yml")
      user_info = Etc.getpwnam(Etc.getlogin)
      execute_in_shell("sudo chmod 640 settings/vault.yml")
      execute_in_shell("sudo chown #{user_info['uid']}:#{user_info['gid']} settings/vault.yml")
      say "Vault Decrypted".green if result.success? or result.out.include? "is not a vault encrypted file"
    end

    desc "uninstall", "Uninstalls VivumLab"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :debug, :desc => "Debugs Ansible-playbook commands"
    option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def deploy()
      invoke_subcommand "Core", "logo"
      invoke 'build', [], {:force => options[:force], :build => options[:build], :cache => options[:cache]}
      say "Uninstalling Vivumlab".red
      return unless yes? "Are you sure?"

      debug_flag = options[:debug] ? '-vvv' : ''
      playbook_command = <<-PLAYBOOK
      ansible-playbook playbook.remove.yml #{debug_flag} \
      --extra-vars="@#{options[:config_dir]}/config.yml" \
      --extra-vars="@#{options[:config_dir]}/vault.yml" \
      -i inventory
      PLAYBOOK
      run_docker(playbook_command)
    end

    desc "restore", "Restores a server from backups. Assuming you ran them"
    option :debug, :desc => "Debugs Ansible-playbook commands"
    option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"
    def restore()
      say "Restoring..."
      debug_flag = options[:debug] ? '-vvv' : ''
      playbook_command = <<-PLAYBOOK
      ansible-playbook prestore.yml #{debug_flag} \
      --extra-vars="@#{options[:config_dir]}/config.yml" \
      --extra-vars="@#{options[:config_dir]}/vault.yml" \
      -i inventory
      PLAYBOOK
      run_docker(playbook_command)
    end

    desc "install_cli", "Installs the CLI to /usr/local/bin so you can call vlab without ./"
    def install_cli()
      execute_in_shell("sudo ln -s $PWD/vlab /usr/local/bin/vlab")
    end
  end
end
