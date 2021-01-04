# frozen_string_literal: true

# Contains tasks related to spinning up a server using Terraform
class Terraform < Thor
  include VlabI18n
  include Utils

  desc I18n.t('terraform.create.usage'), I18n.t('terraform.create.desc')
  def create
    invoke 'git:sync'
    invoke 'config:new'
    say I18n.t('terraform.create.out.creating').yellow
    run_playbook('playbook.terraform.yml', options)
    FileUtils.mv "provider.tf", "settings_#{options[:config_dir]}/provider.tf"
    FileUtils.mv "cloud_vivumlab.tf", "settings_#{options[:config_dir]}/cloud_vivumlab.tf"
    FileUtils.mv "terraform.tfvars", "settings_#{options[:config_dir]}/terraform.tfvars"
    # @todo terraform create not working
    # @body 'vlab terraform create' check_call Subprocess::NonZeroExit error
    execute_in_shell("/bin/bash -c 'cd settings_#{options[:config_dir]} && terraform init && terraform apply -auto-approve'")
    # rubocop:disable Layout/LineLength
    terraform_ip = execute_in_shell("/bin/bash -c 'cd settings_#{options[:config_dir]} && terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address'")
    # rubocop:enable Layout/LineLength
    invoke 'dev:set', [], config_key: "vlab_ip", value: terraform_ip
    say I18n.t('terraform.create.out.created', terraform_ip: terraform_ip).green
    say I18n.t('terraform.create.out.setip').light_blue
  end

  desc I18n.t('terraform.destroy.usage'), I18n.t('terraform.destroy.desc')
  def destroy
    say I18n.t('terraform.destroy.out.destroying').yellow
    execute_in_shell("/bin/bash -c 'cd settings_#{options[:config_dir]} && terraform destroy -auto-approve'")
    FileUtils.rm "settings_#{options[:config_dir]}/provider.tf"
    FileUtils.rm "settings_#{options[:config_dir]}/cloud_vivumlab.tf"
    FileUtils.rm "settings_#{options[:config_dir]}/terraform.tfvars"
    say I18n.t('terraform.destroy.out.destroyed').green
  end
end
