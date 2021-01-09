# frozen_string_literal: true

# Class is responsible for migration tasks
class Migration < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('migration.single_config.usage'), I18n.t('migration.single_config.desc')
  def single_config
    # This task should return, having done nothing UNLESS
    # * There is no encrypted.yml in the current settings folder
    # * There is a vault.yml in the current settings folder
    # * There is a config.yml in the current settings folder
    if meets_new_path_config_conditions?
      FileUtils.mv('settings/', 'settings_migration')
      FileUtils.mkdir_p 'settings'
      FileUtils.mv('settings_migration/', 'settings/prod')
    end
    if meets_single_config_conditions?
      invoke 'deprecated:vault_decrypt', [], {}
      execute_single_config_migration
      save_config_file
      cleanup
    else
      say I18n.t('migration.single_config.out.notdone').light_blue
    end
  end

  no_commands do
    def execute_single_config_migration(config_file, vault_file)
      config_file ||= ConfigFile.new(YAML.load_file("settings/#{options[:config_dir]}/config.yml"))
      vault_file ||= ConfigFile.new(YAML.load_file("settings/#{options[:config_dir]}/vault.yml"))
      @decrypted_config_file = config_file.merge vault_file.vault
      @decrypted_config_file.ansible_become_password = vault_file.ansible_become_password
      @decrypted_config_file.default_password = vault_file.default_password
    end

    def meets_single_config_conditions?
      (File.exist? "settings/#{options[:config_dir]}/config.yml") &&
        (File.exist? "settings/#{options[:config_dir]}/vault.yml") &&
        (!File.exist? "settings/#{options[:config_dir]}/encrypted.yml")
    end

    def meets_new_path_config_conditions?
      (File.exist? 'settings/encrypted.yml') ||
        ((File.exist? 'settings/config.yml') &&
        (File.exist? 'settings/vault.yml'))
    end

    def cleanup
      FileUtils.rm "settings/#{options[:config_dir]}/config.yml"
      FileUtils.rm "settings/#{options[:config_dir]}/vault.yml"
    end
  end
end
