module ConfigFileUtils

  class ConfigFile < Hashie::Mash
    disable_warnings
  end

  def ansible_yml
    return Psych.dump(decrypted_config_file.to_hash).gsub(': false', ': False').gsub(': true', ': True')
  end

  # these two methods load the config and vault files and convert them to
  # a special object type called Hashie#Mash. Mash objects extend the normal
  # hash (python dictionary) with dot notation access. This allows us to, for instance
  # call `config.sui.enable` and it will return the value for that field
  # if it exists. If that key doesn't exist, it will return nil. This is used
  # by last_good_key() (in utils.rb) to 'burn down' through the user provided
  # key and determine the most-specific key that matches.
  def vault_file
    @vault_file ||= ConfigFile.new(YAML.load_file("#{options[:config_dir]}/vault.yml"))
  end

  def decrypted_config_file
    return @decrypted_config_file unless @decrypted_config_file.nil?
    pass = File.read("/ansible_vault_pass")
    temp = YamlVault::Main.from_file(
        "#{options[:config_dir]}/encrypted.yml", [['*']],
        passphrase: pass
      ).decrypt_hash
    @decrypted_config_file ||= ConfigFile.new(temp)
  end

  def save_config_file
    say "Saving config.yml"
    to_encrypt = YamlVault::Main.from_content(ansible_yml, [['*']], passphrase: File.read('/ansible_vault_pass'))
    File.open("#{options[:config_dir]}/encrypted.yml", 'w') do |file|
      file.write(to_encrypt.encrypt_yaml)
    end
  end

  # this writes a temporarially decrypted version of the config file to disk.
  # run playbook executes this just before invoking ansible, and no matter the
  # outcome of the playbook, it deletes this version.
  def write_temporary_decrypted_config
    @temp_config ||= "#{options[:config_dir]}/.#{SecureRandom.urlsafe_base64}"
    File.open(@temp_config, 'w') do |file|
      file.write(ansible_yml)
    end
  end

  def last_good_key(hsh, key)
    # binding.pry
    while true do
      key_bad = hsh.instance_eval(key) rescue nil
      if key_bad.nil?  # if the user specified key is bad
        parts = key.split('.') # break that key up into an array of strings
        return nil if parts.size() == 1
        key = parts.take(parts.size() -1).join('.') # reset the key to be one section shorter. ie: sui.enabled -> sui
        # restart the loop.
      else
        # the provided key (or shortened key) is valid
        break # stop the loop
      end
    end
    return key # return the current, valid key.
  end

end
