# frozen_string_literal: true

# The tasks in this class are deprecated, and should only be used in rare situations
class Deprecated < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'vault_encrypt', 'Encrypts the ansible vault.yml - DEPRECATED'
  def vault_encrypt
    I18n.t(:s_deprecated_encrypting).yellow
    begin
      execute_in_shell("ansible-vault encrypt #{options[:config_dir]}/vault.yml")
      I18n.t(:s_deprecated_encrypted).green
    rescue Subprocess::NonZeroExit
      I18n.t(:s_deprecated_failencrypt).green
    end
  end

  desc 'vault_decrypt', 'Decrypts the ansible vault.yml - DEPRECATED'
  def vault_decrypt
    I18n.t(:s_deprecated_decrypting).yellow
    begin
      execute_in_shell("ansible-vault decrypt #{options[:config_dir]}/vault.yml")
      I18n.t(:s_deprecated_decrypted).green
    rescue Subprocess::NonZeroExit
      I18n.t(:s_deprecated_faildecrypt).green
    end
  end
end
