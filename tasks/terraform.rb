module Vlab
  class Terraform < SubCommandBase

    desc "terraform", "Spins up a cloud server with Terraform"
    def terraform
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Git", "sync"
      invoke_subcommand "Config", "initial_config"

      say "Deploying cloud server".yellow
      run_playbook("playbook.terraform.yml", options)
      run_docker("/bin/bash -c 'cd #{options[:config_dir]}; terraform init && terraform apply'")
      terraform_ip = run_docker "/bin/bash -c cd #{options[:config_dir]}; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address"

      say "Succesfully created a server at: #{terraform_ip}".green
      say "Place this IP where you want it in your settings - either as vlab_ip or bastion.server_address".green
      say "Then run vlab deploy to complete the setup.".green
    end

    desc "destroy", "Destroys server(s) creatd by terraform"
    def destroy
      say "Destroying terraform built server".red
      run_docker("/bin/bash -c 'cd #{options[:config_dir]}; terraform destroy'")
      say "Cloud server(s) destroyed.".green
    end

  end
end
