module Vlab
  class Core < SubCommandBase
    desc "logo", "displays the VivumLab logo"
    def logo()
      cat "vivumlablogo.txt"
      invoke_subcommand "Core", "check_version"
    end

    desc "check_version", "checks the local version against the latest from github"
    def check_version()
      current_version = File.read("VERSION").chomp
      latest_version = HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
      say "You have version #{current_version} and #{latest_version} is the latest".blue
      say "You're up to date".green if current_version == latest_version
      cat "MOTD"

      invoke_subcommand "SanityChecks", "local"

    end

    desc "generate_ansible_pass", "Creates a new Vault Password"
    def generate_ansible_pass()
      # This *is* a deviation from the shell based version. Instead of
      # generating a datetime stamp, sha256sum'ing it then base64ing it
      # and snagging the first 32 bytes ... we're relying on ruby's
      # built in SecureRandom.base64 to give us a secure, high entropy
      # string that's already base64 encoded.
      #
      # This *SHOULD* be safe - this shouldn't run, unless
      # ~/.vlab_vault_pass *does not exist* It's imperative that calling
      # tasks that want to overwrite the vault pass, need to delete the existing
      # vault pass before calling this.
      if not File.exist? "#{Dir.home}/.vlab_vault_pass"
        File.write("#{Dir.home}/.vlab_vault_pass", SecureRandom.base64(32))
      end
    end
  end
end
