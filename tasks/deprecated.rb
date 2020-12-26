# frozen_string_literal: true

# The tasks in this class are deprecated, and should only be used in rare situations
class Deprecated < Thor
  require './tasks/utils'
  include Utils

  desc 'vault_encrypt', 'Encrypts the ansible vault.yml - DEPRECATED'
  def vault_encrypt
    say 'Encrypting the vault'.red
    begin
      execute_in_shell("ansible-vault encrypt #{options[:config_dir]}/vault.yml")
      say 'Vault Encrypted'.green
    rescue Subprocess::NonZeroExit
      say 'This command can fail, if the vault was already encrypted'.green
    end
  end

  desc 'vault_decrypt', 'Decrypts the ansible vault.yml - DEPRECATED'
  def vault_decrypt
    say 'Decrypting the vault'.blue
    begin
      execute_in_shell("ansible-vault decrypt #{options[:config_dir]}/vault.yml")
      say 'Vault Decrypted'.green
    rescue Subprocess::NonZeroExit
      say 'This command can fail, if the vault was already decrypted'.green
    end
  end
end
