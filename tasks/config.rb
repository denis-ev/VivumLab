# frozen_string_literal: true

# Config namespace for vlab cli
class Config < Thor
  require './tasks/utils'
  include VlabI18n
  include Utils
  namespace 'config'
  require 'yaml'

  desc I18n.t('config.new.usage'), I18n.t('config.new.desc')
  def new
    say I18n.t('config.new.out.creating', config_dir: options[:config_dir]).light_blue
    invoke 'sanity_checks:local'
    if File.exist? "settings/#{options[:config_dir]}/encrypted.yml"
      write_temporary_decrypted_config
      FileUtils.mv @temp_config, "decrypted.yml"
      say I18n.t('config.decrypt.out.decrypted').green
      run_config_playbook(options, "-e @decrypted.yml")
      encrypt_temporary_decrypted_config "decrypted.yml"
      say I18n.t('config.encrypt.out.encrypted').green
    else
      FileUtils.mkdir_p "settings/#{options[:config_dir]}/passwords" unless Dir.exist? "settings/#{options[:config_dir]}/passwords"
      run_config_playbook(options)
      encrypt_temporary_decrypted_config "decrypted.yml"
      say I18n.t('config.encrypt.out.encrypted').green
    end
  end

  desc I18n.t('dev.set.usage'), I18n.t('dev.set.desc')
  option :config_key, type: :string, required: true, desc: I18n.t('options.keytoset')
  option :value, type: :string, required: true, desc: I18n.t('options.valuetoset')
  # This method contains some advanced, idiomatic ruby that may not be entirely
  # clear to new rubyists. I've tried to comment for clarity.
  # rubocop:disable Metrics/AbcSize
  def set
    good_config_key = last_good_key(decrypted_config_file, options[:config_key])
    say I18n.t('dev.set.out.nokey', config_key: options[:config_key]).red unless good_config_key
    eval_config_setting(good_config_key, options[:value]) if options[:config_key] == good_config_key
    return unless (options[:config_key].include? good_config_key) && (options[:config_key] != good_config_key)

    draw_error_table options[:config_key], good_config_key
  end
  # rubocop:enable Metrics/AbcSize

  desc I18n.t('config.show.usage'), I18n.t('config.show.desc')
  option :service, required: true, desc: I18n.t('options.servicename'), aliases: ['-s']
  def show
    config_hash = decrypted_config_file[options[:service]]
    begin
      table = TTY::Table.new(header: %w[option value], rows: config_hash)
      say table.render(:unicode)
    rescue StandardError
      say I18n.t('config.show.out.tablenorender').light_blue
      ap config_hash
    end
  end

  desc I18n.t('config.reset.usage'), I18n.t('config.reset.desc')
  def reset
    say I18n.t('config.reset.out.resetting', config_dir: options[:config_dir]).light_blue
    say I18n.t('config.reset.out.backup').light_blue
    FileUtils.mv("settings/#{options[:config_dir]}/", "settings/backup-#{options[:config_dir]}")
    invoke 'config:new'
  end

  desc I18n.t('config.edit_raw.usage'), I18n.t('config.edit_raw.desc')
  def edit_raw
    say I18n.t('config.edit_raw.out.editfile', config_dir: options[:config_dir]).light_blue
    begin
      decrypt_edit_encrypt
    rescue Subprocess::NonZeroExit
      say I18n.t('config.edit_raw.out.editerror').red
    ensure
      FileUtils.rm_f @temp_config
      say I18n.t('config.edit_raw.out.fileremove').yellow
    end
  end

  desc I18n.t('config.decrypt.usage'), I18n.t('config.decrypt.desc')
  option :outputfile, required: false, desc: I18n.t('options.filetowrite'), default: 'decrypted.yml', aliases: ['-o']
  def decrypt
    write_temporary_decrypted_config
    FileUtils.mv @temp_config, "settings/#{options[:config_dir]}/#{options[:outputfile]}"
    say I18n.t('config.decrypt.out.decrypted').green
  end

  desc I18n.t('config.encrypt.usage'), I18n.t('config.encrypt.desc')
  option :inputfile, required: false, desc: I18n.t('options.filetowrite'), default: 'decrypted.yml', aliases: ['-i']
  def encrypt
    encrypt_temporary_decrypted_config "settings/#{options[:config_dir]}/#{options[:inputfile]}"
    say I18n.t('config.encrypt.out.encrypted').green
  end

  no_commands do
    def eval_config_setting(key, value)
      exit 1 unless key
      # rubocop:disable Security/Eval
      if [true, false].include? value # sometimes the value is a string that also acts like a decimal (ip address)
        eval("decrypted_config_file.#{key.chomp}=#{value}", binding, __FILE__, __LINE__)
      else
        eval("decrypted_config_file.#{key.chomp}=\"#{value}\"", binding, __FILE__, __LINE__)
      end
      # rubocop:enable Security/Eval
      save_config_file
    end

    def draw_error_table(config_key, good_config_key)
      say I18n.t('config.draw_error_table.out.keynomatch', config_key: config_key).red
      say I18n.t('config.draw_error_table.out.possiblekey').yellow
      sanitized_array = decrypted_config_file[good_config_key].reject do |key,value|
        value.instance_of? ConfigFileUtils::ConfigFile
      end
      table = TTY::Table.new(rows: sanitized_array.to_a)
      say table.render(:unicode)
    end

    def decrypt_edit_encrypt
      write_temporary_decrypted_config
      execute_in_shell "nano #{@temp_config}"
      encrypt_temporary_decrypted_config
    end
  end
end
