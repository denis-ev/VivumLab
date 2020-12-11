module Vlab
  class Terraform < SubCommandBase

    desc "terraform", "Spins up a cloud server with Terraform"
    def terraform
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build"
      invoke_subcommand "Git", "sync"
      invoke_subcommand "Config", "config"

      say "Deploying cloud server".yellow
      run_playbook("playbook.terraform.yml", options)
      terraform_ip = run_docker "/bin/bash -c cd #{options[:config_dir]}; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address"
    end

  end
end
