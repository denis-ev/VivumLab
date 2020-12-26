# frozen_string_literal: true

# Class is responsible for migration tasks
class Migration < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :debug, desc: 'Debugs Ansible-playbook commands', enum: %w[none warn debug trace], default: :none, aliases: ['-d']
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc 'single_config', 'Migrates away from a config.yml, and vault.yml to a single encrypted.yml'
  def single_config
    # This task should return, having done nothing UNLESS
    # * There is no encrypted.yml in the current settings folder
    # * There is a vault.yml in the current settings folder
    # * There is a config.yml in the current settings folder
    if (File.exist? "#{options[:config_dir]}/config.yml") &&
       (File.exist? "#{options[:config_dir]}/vault.yml") &&
       (!File.exist? "#{options[:config_dir]}/encrypted.yml")
      invoke 'deprecated:vault_decrypt', [], {}
      config_file ||= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/config.yml"))
      vault_file ||= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/vault.yml"))

      @decrypted_config_file = config_file.merge vault_file.vault
      @decrypted_config_file.ansible_become_password = vault_file.ansible_become_password
      @decrypted_config_file.default_password = vault_file.default_password
      save_config_file
      FileUtils.rm "#{options[:config_dir]}/config.yml"
      FileUtils.rm "#{options[:config_dir]}/vault.yml"
    else
      say I18n.t(:s_migration_notdone)
    end
  end
end
