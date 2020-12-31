# frozen_string_literal: true

# Config namespace for vlab cli
class Config < Thor
  require './tasks/utils'
  include VlabI18n
  include Utils
  namespace 'config'
  require 'yaml'
  class_option :debug, desc: I18n.t('options.ansibledebug'),
                       enum: %w[none warn debug trace],
                       default: :none,
                       aliases: ['-d']
  class_option :config_dir, type: :string, desc: I18n.t('options.configdir'), default: 'settings'

  desc I18n.t('config.new.usage'), I18n.t('config.new.desc')
  def new
    say I18n.t('config.new.out.creating', config_dir: options[:config_dir]).light_blue
    invoke 'sanity_checks:local'
    run_config_playbook(options) unless File.exist? "#{options[:config_dir]}/encrypted.yml"
  end

  desc I18n.t('config.show.usage'), I18n.t('config.show.desc')
  option :service, required: true, desc: I18n.t('options.servicename'), aliases: ['-s']
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

  desc I18n.t('config.reset.usage'), I18n.t('config.reset.desc')
  def reset
    say I18n.t('config.reset.out.resetting', config_dir: options[:config_dir]).light_blue
    say I18n.t('config.reset.out.backup').light_blue
    FileUtils.mv("#{options[:config_dir]}/", 'settings-backup')
    invoke 'config:new'
  end

  desc I18n.t('config.edit_raw.usage'), I18n.t('config.edit_raw.desc')
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

  desc I18n.t('config.decrypt.usage'), I18n.t('config.decrypt.desc')
  option :outputfile, required: false, desc: I18n.t('options.filetowrite'), default: 'decrypted.yml', aliases: ['-o']
  def decrypt
    write_temporary_decrypted_config
    FileUtils.mv @temp_config, "#{options[:config_dir]}/#{options[:outputfile]}"
    say I18n.t('config.decrypt.out.decrypted').green
  end

  desc I18n.t('config.encrypt.usage'), I18n.t('config.encrypt.desc')
  option :inputfile, required: false, desc: I18n.t('options.filetowrite'), default: 'decrypted.yml', aliases: ['-i']
  def encrypt
    encrypt_temporary_decrypted_config "#{options[:config_dir]}/#{options[:inputfile]}"
    say I18n.t('config.encrypt.out.encrypted').green
  end
end
