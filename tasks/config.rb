# frozen_string_literal: true

# Config namespace for vlab cli
class Config < Thor
  require './tasks/utils'
  include VlabI18n
  include Utils
  namespace 'config'
  require 'yaml'
  class_option :debug, desc: 'Debugs Ansible-playbook commands',
                       enum: %w[none warn debug trace],
                       default: :none,
                       aliases: ['-d']
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc I18n.t('config.new.name'), I18n.t('config.new.desc')
  def new
    say I18n.t('config.new.out.creating', config_dir: options[:config_dir]).light_blue
    invoke 'sanity_checks:local'
    run_config_playbook(options) unless File.exist? "#{options[:config_dir]}/encrypted.yml"
  end

  desc I18n.t('config.show.name'), I18n.t('config.show.desc')
  option :service, required: true, desc: 'Name of the service to display', aliases: ['-s']
  def show
    config_hash = decrypted_config_file[options[:service]]
    begin
      table = TTY::Table.new(header: %w[option value], rows: config_hash)
      say table.render(:unicode)
    rescue => e
      say I18n.t('config.show.out.tablenorender').light_blue
      ap config_hash
    end
  end

  desc I18n.t('config.reset.name'), I18n.t('config.reset.desc')
  def reset
    say I18n.t('config.reset.out.resetting', config_dir: options[:config_dir]).light_blue
    say I18n.t('config.reset.out.backup').light_blue
    FileUtils.mv("#{options[:config_dir]}/", 'settings-backup')
    invoke 'config:new'
  end

  desc I18n.t('config.edit_raw.name'), I18n.t('config.edit_raw.desc')
  def edit_raw
    say I18n.t('config.edit_raw.out.editfile', config_dir: options[:config_dir]).light_blue
    begin
      write_temporary_decrypted_config
      execute_in_shell "nano #{@temp_config}"
    rescue Subprocess::NonZeroExit
      say I18n.t('config.edit_raw.out.editerror').red
    ensure
      FileUtils.rm_f @temp_config
      say I18n.t('config.edit_raw.out.fileremove').yellow
    end
  end

  desc I18n.t('config.decrypt.name'), I18n.t('config.decrypt.desc')
  option :outputfile, required: false, desc: 'Name of the file to write', default: 'decrypted.yml', aliases: ['-o']
  def decrypt
    write_temporary_decrypted_config
    FileUtils.mv @temp_config, "#{options[:config_dir]}/#{options[:outputfile]}"
    say I18n.t('config.decrypt.out.decrypted').green
  end

  desc I18n.t('config.encrypt.name'), I18n.t('config.encrypt.desc')
  option :inputfile, required: false, desc: 'Name of the file to encrypt', default: 'decrypted.yml', aliases: ['-i']
  def encrypt
    encrypt_temporary_decrypted_config "#{options[:config_dir]}/#{options[:inputfile]}"
    say I18n.t('config.encrypt.out.encrypted').green
  end

  desc I18n.t('config.set.name'), I18n.t('config.set.desc')
  option :config_key, type: :string, required: true, desc: 'Dot notation key to set'
  option :value, type: :string, required: true, desc: 'value to set'
  # This method contains some advanced, idiomatic ruby that may not be entirely
  # clear to new rubyists. I've tried to comment for clarity.
  def set
    good_config_key = last_good_key(decrypted_config_file, options[:config_key])
    say I18n.t('config.set.out.nokey', config_key: options[:config_key]).red && return unless good_config_key
    eval_config_setting(good_config_key, options[:value]) if options[:config_key] == good_config_key
    return unless (options[:config_key].include? good_config_key) && (options[:config_key] != good_config_key)

    draw_error_table options[:config_key], good_config_key
  end

  no_commands do
    def eval_config_setting(key, value)
      # rubocop:disable Security/Eval
      eval("decrypted_config_file.#{key.chomp}=#{value}", binding, __FILE__, __LINE__)
      # rubocop:enable Security/Eval
      save_config_file
    end

    def draw_error_table(config_key, good_config_key)
      say I18n.t('config.draw_error_table.out.keynomatch', config_key: options[:config_key]).red
      say I18n.t('config.draw_error_table.out.possiblekey').yellow
      table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", 'value'],
                             rows: decrypted_config_file[good_config_key])
      say table.render(:unicode)
    end
  end
end
