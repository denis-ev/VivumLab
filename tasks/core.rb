module Vlab
  class Core < SubCommandBase
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
    option :force, :type => :boolean
    option :build, :type => :boolean
    def build()
      vlab_image = execute_in_mshell("docker images -a | grep vivumlab/vivumlab")&.first&.split(/ {2,}/) rescue nil
      say "No Vlab Image Found".red
      if((not options[:cache]) && (not vlab_image.nil?))
        execute_in_shell("sudo docker rmi --force #{vlab_image[2]}") if vlab_image[1].casecmp("latest") and not options[:cache]
      end
      if((not vlab_image.nil?) && (options[:force]))
        execute_in_shell("sudo docker rmi --force #{vlab_image[3]}")
      end

      use_version = latest_version if current_version == latest_version

      say "Getting VivumLab Docker Image".green
      if((not vlab_image.nil?) && (vlab_image[3]&.empty? && vlab_image[2].casecmp("latest")))
        say "Image Nubmer: #{vlab_image[3]} is the latest vlab image".light_yellow
        say "Skipping vlab image retrieval".blue
      else
        if options[:build]
          if options[:cache]
            execute_in_shell("sudo docker build . --no-cache --force-rm -t vivumlab/vivumlab:#{use_version}")
          else
            execute_in_shell("sudo docker build . --no-cache --force-rm -t vivumlab/vivumlab:#{use_version}")
          end
        else
          execute_in_shell("sudo docker pull vivumlab/vivumlab:#{use_version}")
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
  end
end
