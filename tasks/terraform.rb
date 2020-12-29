# frozen_string_literal: true

# Contains tasks related to spinning up a server using Terraform
class Terraform < Thor
  include VlabI18n
  include Utils

  desc I18n.t('terraform.create.name'), I18n.t('terraform.create.desc')
  def create
    invoke 'git:sync'
    invoke 'config:new'
    say I18n.t('terraform.create.out.creating').yellow
    run_playbook('playbook.terraform.yml', options)
    execute_in_shell("/bin/bash -c 'cd #{options[:config_dir]}; terraform init && terraform apply'")
    # rubocop:disable Layout/LineLength
    terraform_ip = execute_in_shell "/bin/bash -c cd #{options[:config_dir]}; terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address"
    # rubocop:enable Layout/LineLength
    say I18n.t('terraform.create.out.created, terraform_ip: terraform_ip').green
    say I18n.t('terraform.create.out.setip').light_blue
  end

  desc I18n.t('terraform.destroy.name'), I18n.t('terraform.destroy.desc')
  def destroy
    say I18n.t('terraform.destroy.out.destroying').yellow
    execute_in_shell("/bin/bash -c 'cd #{options[:config_dir]}; terraform destroy'")
    say I18n.t('terraform.destroy.out.destroyed').green
  end
end
