class Deprecated < Thor
  desc "encrypt", "Encrypts the ansible vault.yml - DEPRECATED"
  def encrypt()
    say "Encrypting the vault".red
    begin
      execute_in_shell("ansible-vault encrypt #{options[:config_dir]}/vault.yml")
      say "Vault Encrypted".green
    rescue Subprocess::NonZeroExit => e
      say "This command can fail, if the vault was already encrypted".green
    end
  end

  desc "decrypt", "Decrypts the ansible vault.yml - DEPRECATED"
  def decrypt()
    say "Decrypting the vault".blue
    begin
      execute_in_shell("ansible-vault decrypt #{options[:config_dir]}/vault.yml")
      say "Vault Decrypted".green
    rescue Subprocess::NonZeroExit => e
      say "This command can fail, if the vault was already decrypted".green
    end
  end
end
