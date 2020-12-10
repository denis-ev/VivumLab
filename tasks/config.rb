module Vlab
  class Config < SubCommandBase
    require 'yaml'
    class_option :debug, :desc => "Debugs Ansible-playbook commands", :enum => ["none", "warn", "debug", "trace"], :default => :none
    class_option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"

    desc "config", "Creates or Updates the config file, as necessary"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def config()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build", options
      say "Creating, or updating Config file #{options[:config_dir]}/config.yml".green
      run_playbook("playbook.config.yml", options)
      invoke_subcommand "Core", "encyrpt"
    end

    desc "show_config", "Shows the configuration settings for a specified service"
    option :service, :required => true, :desc => "Name of the service to display"
    def show_config()
      config = YAML.load_file("settings/config.yml")
      config_hash = hash_to_a(config[options[:service]])
      table = TTY::Table.new(header: ["option", "value"], rows: config_hash)
      puts table.render(:unicode)
    end

    desc "config_reset", "Resets Vlab config"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def config_reset()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build", options
      say "Resetting Config file #{options[:config_dir]}/config.yml".green
      say "Backing up your existing config"
      FileUtils.mv("settings/", "settings-backup")
      invoke "config", [], options
    end

    desc "set", "Sets a config variable"
    option :config_key, :type => :string, :required => true, :desc => "Dot notation key to set"
    option :value, :type => :string, :required => true, :desc => "value to set"
    def set()
      invoke_subcommand "Core", "decrypt"
      vault = Hashie::Mash.new(YAML.load_file("settings/vault.yml"))
      config = Hashie::Mash.new(YAML.load_file("settings/config.yml"))
      good_config_key = last_good_key(config, options[:config_key])
      good_vault_key = last_good_key(vault, options[:config_key])
      if good_config_key.nil? && good_vault_key.nil?
        say "Key #{options[:config_key]} not found in either config file. Did you spell it right?".red
      elsif options[:config_key] == good_config_key
        config[good_vault_key] = options[:value]
        say "Saving config.yml"
        File.open("#{options[:config_dir]}/config.yml", 'w') do |file|
          file.write(Psych.dump(config.to_hash))
        end
      elsif options[:config_key] == good_vault_key
        config[good_vault_key] = options[:value]
        say "Saving Vault.yml"
        File.open("#{options[:config_dir]}/vault.yml", 'w') do |file|
          file.write(Psych.dump(vault.to_hash))
        end
      else
        say "Unable to find a full match for the key #{options[:config_key]}".red
        say "Here's the most specific match found:".red
        table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", "value"], rows: config[good_config_key])
        puts table.render(:unicode)
      end
      invoke_subcommand "Core", "encrypt"
    end
  end
end
