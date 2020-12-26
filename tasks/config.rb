# frozen_string_literal: true

# Config namespace for vlab cli
class Config < Thor
  require './tasks/utils'
  include VlabI18n
  include Utils
  namespace 'config'
  require 'yaml'
  class_option :debug, desc: 'Debugs Ansible-playbook commands', enum: %w[none warn debug trace], default: :none
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc 'new', 'Creates or Updates the config file, as necessary'
  def new
    I18n.t(:s_config_creating)
    invoke 'sanity_checks:local'
    run_playbook('playbook.config.yml', options)
  end

  desc 'show', 'Shows the configuration settings for a specified service'
  option :service, required: true, desc: 'Name of the service to display', aliases: ['-s']
  def show
    config_hash = decrypted_config_file[options[:service]]
    table = TTY::Table.new(header: %w[option value], rows: config_hash)
    say table.render(:unicode)
  end

  desc 'reset', 'Resets Vlab config'
  def reset
    I18n.t(:s_config_resetting)
    I18n.t(:s_config_backup)
    FileUtils.mv("#{options[:config_dir]}/", 'settings-backup')
    invoke 'config:new'
  end

  desc 'edit_raw', 'Decrypts, and opens the config file in nano. Encrypts on save'
  def edit_raw
    I18n.t(:s_config_editfile)
    begin
      write_temporary_decrypted_config
      execute_in_shell "nano #{@temp_config}"
    rescue Subprocess::NonZeroExit
      I18n.t(:s_config_editerror).red
    ensure
      FileUtils.rm_f @temp_config
      I18n.t(:s_config_fileremove).yellow
    end
  end

  desc 'decrypt', 'Decrypts the encrypted config file. You must Re-ENCRYPT yourself using vlab config encrypt'
  option :outputfile, required: false, desc: 'Name of the file to write', default: 'decrypted.yml', aliases: ['-o']
  def decrypt
    write_temporary_decrypted_config
    FileUtils.mv @temp_config, "#{options[:config_dir]}/#{options[:outputfile]}"
    I18n.t(:s_config_decrypted).green
  end

  desc 'encrypt', 'Encrypts a given config.yml to encrypted.yml'
  option :inputfile, required: false, desc: 'Name of the file to encrypt', default: 'decrypted.yml', aliases: ['-i']
  def encrypt
    encrypt_temporary_decrypted_config "#{options[:config_dir]}/#{options[:inputfile]}"
    I18n.t(:s_config_encrypted).green
  end

  desc 'set', 'Sets a config variable'
  option :config_key, type: :string, required: true, desc: 'Dot notation key to set'
  option :value, type: :string, required: true, desc: 'value to set'
  # This method contains some advanced, idiomatic ruby that may not be entirely
  # clear to new rubyists. I've tried to comment for clarity.
  def set
    good_config_key = last_good_key(decrypted_config_file, options[:config_key])
    # if good_config_key is nil, then the key provided doesn't match *at all* throw an error.
    if good_config_key.nil?
      I18n.t(:s_config_nokey).red
      # Following else if block only executes if the user supplied key is entirely valid and found in the config file
    elsif options[:config_key] == good_config_key
      # rubocop:disable Security/Eval
      eval "decrypted_config_file.#{good_config_key.chomp}=#{options[:value]}", __FILE__, __LINE__
      # rubocop:enable Security/Eval
      save_config_file
      # this else block runs only when the user provided key partially matches. For instance if they
      # gave us 'sui.enabled' instead of 'sui.enable' this block runs, and prints a table
      # of all the sui.* keys and their current values.
    else
      draw_error_table options[:config_key], good_config_key
    end
  end

  def draw_error_table(config_key, good_config_key)
    I18n.t(:s_config_keynomatch).red
    I18n.t(:s_config_possiblekey).yellow
    table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", 'value'],
                           rows: decrypted_config_file[good_config_key])
    say table.render(:unicode)
  end
end
