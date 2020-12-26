class Terraform < Thor
  include VlabI18n

  desc "create", "Spins up a cloud server with Terraform"
  def create
    invoke "git:sync"
    invoke "config:new"

    say I18n.t(:s_terraform_creating).yellow
    run_playbook("playbook.terraform.yml", options)
    execute_in_shell("/bin/bash -c 'cd #{options[:config_dir]}; terraform init && terraform apply'")
    terraform_ip = execute_in_shell "/bin/bash -c cd #{options[:config_dir]}; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address"

    say I18n.t(:s_terraform_create_success).green
    say I18n.t(:s_terraform_ip_set).green
  end

  desc "destroy", "Destroys server(s) created by terraform"
  def destroy
    say I18n.t(:s_terraform_destroying).yellow
    execute_in_shell("/bin/bash -c 'cd #{options[:config_dir]}; terraform destroy'")
    say I18n.t(:s_terraform_destroy_success).green
  end

end
