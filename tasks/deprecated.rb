# frozen_string_literal: true

# The tasks in this class are deprecated, and should only be used in rare situations
class Deprecated < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('deprecated.vault_encrypt.usage'), I18n.t('deprecated.vault_encrypt.desc')
  def vault_encrypt
    say I18n.t('deprecated.vault_encrypt.out.encrypting').yellow
    begin
      execute_in_shell("ansible-vault encrypt settings/#{options[:config_dir]}/vault.yml")
      say I18n.t('deprecated.vault_encrypt.out.encrypted').green
    rescue Subprocess::NonZeroExit
      say I18n.t('deprecated.vault_encrypt.out.failencrypt').light_blue
    end
  end

  desc I18n.t('deprecated.vault_decrypt.usage'), I18n.t('deprecated.vault_decrypt.desc')
  def vault_decrypt
    say I18n.t('deprecated.vault_decrypt.out.decrypting').yellow
    begin
      execute_in_shell("ansible-vault decrypt settings/#{options[:config_dir]}/vault.yml")
      say I18n.t('deprecated.vault_decrypt.out.decrypted').green
    rescue Subprocess::NonZeroExit
      say I18n.t('deprecated.vault_decrypt.out.faildecrypt').light_blue
    end
  end
end
