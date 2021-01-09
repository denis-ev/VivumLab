# frozen_string_literal: true

# Contains logic surrounding vivumlab config files
module ConfigFileUtils
  # Class extends hashie::mash to silence warnings
  include VlabI18n
  class ConfigFile < Hashie::Mash
    disable_warnings
  end

  def ansible_yml
    Psych.dump(decrypted_config_file.to_hash).gsub(': false', ': False').gsub(': true', ': True')
  end

  def service_list
    @service_list ||= Dir.glob('roles/*')
                         .select { |f| File.directory? f }
                         .reject { |f| f.include? 'vivumlab' }
                         .map { |x| x.split('/').last }
  end

  def constantized_services
    @constantized_services ||= service_list.map { |service| service.split('_').collect(&:capitalize).join }
  end

  # these two methods load the config and vault files and convert them to
  # a special object type called Hashie#Mash. Mash objects extend the normal
  # hash (python dictionary) with dot notation access. This allows us to, for instance
  # call `config.sui.enable` and it will return the value for that field
  # if it exists. If that key doesn't exist, it will return nil. This is used
  # by last_good_key() (in utils.rb) to 'burn down' through the user provided
  # key and determine the most-specific key that matches.
  def vault_file
    @vault_file ||= ConfigFile.new(YAML.load_file("settings/#{options[:config_dir]}/vault.yml"))
  end

  def decrypted_config_file
    return @decrypted_config_file unless @decrypted_config_file.nil?

    # rubocop:disable Style/RescueModifier
    config_dir = options[:config_dir].nil? ? 'prod' : options[:config_dir] rescue 'prod'
    # rubocop:enable Style/RescueModifier
    return unless encrypted_yml_exist?

    pass = File.read('/vlab_vault_pass')
    temp = YamlVault::Main.from_file("settings/#{config_dir}/encrypted.yml", [['*']], passphrase: pass).decrypt_hash
    @decrypted_config_file ||= ConfigFile.new(temp)
  end

  def encrypted_yml_exist?
    # rubocop:disable Style/RescueModifier
    config_dir = options[:config_dir].nil? ? 'prod' : options[:config_dir] rescue 'prod'
    # rubocop:enable Style/RescueModifier
    exists = File.exist? "settings/#{config_dir}/encrypted.yml"
    puts I18n.t('conffile_utils.encryptedyml.out.noexist', config_dir: config_dir).red unless exists
    exists
  end

  def save_config_file
    say I18n.t('conffile_utils.saveconf.out.saving').light_blue
    to_encrypt = YamlVault::Main.from_content(ansible_yml, [['*']], passphrase: File.read('/vlab_vault_pass'))
    persist_current_config to_encrypt
  end

  def encrypt_temporary_decrypted_config(tmp_file = @temp_config)
    to_encrypt = YamlVault::Main.from_file(tmp_file, [['*']], passphrase: File.read('/vlab_vault_pass'))
    persist_current_config to_encrypt
    FileUtils.rm tmp_file
  end

  def persist_current_config(to_encrypt)
    File.open("settings/#{options[:config_dir]}/encrypted.yml", 'w') do |file|
      file.write(to_encrypt.encrypt_yaml)
    end
    say "settings/#{options[:config_dir]}/encrypted.yml saved".green
  end

  # this writes a temporarially decrypted version of the config file to disk.
  # run playbook executes this just before invoking ansible, and no matter the
  # outcome of the playbook, it deletes this version.
  def write_temporary_decrypted_config
    @temp_config ||= "settings/#{options[:config_dir]}/.#{SecureRandom.urlsafe_base64}.yml"
    File.open(@temp_config, 'w') do |file|
      file.write(ansible_yml)
    end
  end

  def last_good_key(hsh, key)
    return key if nested_key_exists?(hsh, key) # hsh.keys.include? key

    while true
      # rubocop:disable Style/RescueModifier
      key_bad = hsh.instance_eval(key) rescue nil
      # rubocop:enable Style/RescueModifier
      break unless key_bad.nil?

      parts = key.split('.') # break that key up into an array of strings
      return nil if parts.size == 1

      key = parts.take(parts.size - 1).join('.') # reset the key to be one section shorter. ie: sui.enabled -> sui
    end
    key # return the current, valid key.
  end

  def nested_key_exists?(obj, key)
    return true if obj.respond_to?(:key?) && obj.key?(key)
    return false unless obj.is_a? Enumerable

    parts = key.split('.') # 'foo.bar' -> [foo,bar]
    return false if parts.size == 1

    nested_object = parts.first
    parts.shift
    new_key = parts.join('.')
    nested_key_exists?(obj.instance_eval(nested_object), new_key) if obj.key?(nested_object)
  end
end
