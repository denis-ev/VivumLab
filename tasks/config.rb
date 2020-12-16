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
      # invoke_subcommand "Core", "build"
      say "Creating, or updating Config file #{options[:config_dir]}/config.yml".green
      run_playbook("playbook.config.yml", options)
      invoke_subcommand "Core", "encrypt"
    end

    desc "show_config", "Shows the configuration settings for a specified service"
    option :service, :required => true, :desc => "Name of the service to display"
    def show_config()
      config = YAML.load_file("#{options[:config_dir]}/config.yml")
      config_hash = hash_to_a(config[options[:service]])
      table = TTY::Table.new(header: ["option", "value"], rows: config_hash)
      say table.render(:unicode)
    end

    desc "config_reset", "Resets Vlab config"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def config_reset()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build"
      say "Resetting Config file #{options[:config_dir]}/config.yml".green
      say "Backing up your existing config"
      FileUtils.mv("#{options[:config_dir]}/", "settings-backup")
      invoke "config", [], options
    end

    desc "set", "Sets a config variable"
    option :config_key, :type => :string, :required => true, :desc => "Dot notation key to set"
    option :value, :type => :string, :required => true, :desc => "value to set"
    # This method contains some advanced, idiomatic ruby that may not be entirely
    # clear to new rubyists. I've tried to comment for clarity.
    def set()
      invoke_subcommand "Core", "decrypt" # decrypt the vault
      # these two lines load the config and vault files and convert them to
      # a special object type called Hashie#Mash. Mash objects extend the normal
      # hash (python dictionary) with dot notation access. This allows us to, for instance
      # call `config.sui.enable` and it will return the value for that field
      # if it exists. If that key doesn't exist, it will return nil. This is used
      # by last_good_key() (in utils.rb) to 'burn down' through the user provided
      # key and determine the most-specific key that matches.
      vault = Hashie::Mash.new(YAML.load_file("#{options[:config_dir]}/vault.yml"))
      config = Hashie::Mash.new(YAML.load_file("#{options[:config_dir]}/config.yml"))
      # These two lines ensure the user-provided config_key exists, and identify
      # which file it's in. (config or vault).
      good_config_key = last_good_key(config, options[:config_key])
      good_vault_key = last_good_key(vault, options[:config_key])
      # if both good_*_key variables are nil, then the key provided doesn't match *at all* throw an error.
      if good_config_key.nil? && good_vault_key.nil?
        say "Key #{options[:config_key]} not found in either config file. Did you spell it right?".red
        # Following else if block only executes if the user supplied key is entirely valid and found in the config file
      elsif options[:config_key] == good_config_key
        config[good_vault_key] = options[:value] # this sets the new value
        say "Saving config.yml"
        File.open("#{options[:config_dir]}/config.yml", 'w') do |file|
          file.write(Psych.dump(config.to_hash))
        end
        # Following else if block only executes if the user supplied key is entirely valid and found in the vault
      elsif options[:config_key] == good_vault_key
        config[good_vault_key] = options[:value]
        say "Saving Vault.yml"
        File.open("#{options[:config_dir]}/vault.yml", 'w') do |file|
          file.write(Psych.dump(vault.to_hash))
        end
        # this else block runs only when the user provided key partially matches. For instance if they
        # gave us 'sui.enabled' instead of 'sui.enable' this block runs, and prints a table
        # of all the sui.* keys and their current values.
      else
        say "Unable to find a full match for the key #{options[:config_key]}".red
        say "Here's the most specific match found:".red
        table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", "value"], rows: config[good_config_key])
        say table.render(:unicode)
      end
      # regardless of the change (or not), re-encrypt the vault
      invoke_subcommand "Core", "encrypt"
    end
  end
end
