# frozen_string_literal: true

# Contains tasks related to spinning up a server using Terraform
class Terraform < Thor
  include VlabI18n
  include Utils
  require 'json'

  desc I18n.t('terraform.create.usage'), I18n.t('terraform.create.desc')
  def create
    invoke 'git:sync'
    invoke 'config:new'
    say I18n.t('terraform.create.out.creating').yellow
    if decrypted_config_file['do_access_token'] == false
      say 'No valid DO access token found.'
      say "Please run 'vlab dev set --dev --config-key do_access_token --value <token>'"
      say 'before attempting terraform.'.red
      exit 1
    end
    run_playbook('playbook.terraform.yml', options)
    FileUtils.mv 'provider.tf', "settings/#{options[:config_dir]}/provider.tf"
    FileUtils.mv 'cloud_vivumlab.tf', "settings/#{options[:config_dir]}/cloud_vivumlab.tf"
    FileUtils.mv 'terraform.tfvars', "settings/#{options[:config_dir]}/terraform.tfvars"
    execute_in_shell('terraform init', "settings/#{options[:config_dir]}")
    execute_in_shell('terraform apply -auto-approve', "settings/#{options[:config_dir]}")
    terraform_json = Subprocess.check_output('terraform show -json', "settings/#{options[:config_dir]}")
    terraform_ip = Hashie::Mash.new(JSON.parse(terraform_json))
                               .values
                               .last
                               .root_module.resources[0]
                               .values.select{ |y| y.instance_of? Hashie::Mash }
                               .first
                               .ipv4_address
    say I18n.t('terraform.create.out.created', ip: terraform_ip).green
    say I18n.t('terraform.create.out.setip', ip: terraform_ip, config_dir: options[:config_dir]).light_blue
  end

  desc I18n.t('terraform.destroy.usage'), I18n.t('terraform.destroy.desc')
  def destroy
    say I18n.t('terraform.destroy.out.destroying').yellow
    execute_in_shell('terraform destroy -auto-approve', "settings/#{options[:config_dir]}")
    files = %w[provider.tf cloud_vivumlab.tf terrraform.tfvars terraform.lock.hcl
               terraform.tfstate terraform.tfstate.backup]
    files.each do |file|
      FileUtils.rm("settings/#{options[:config_dir]}/#{file}") if File.exist? "settings/#{options[:config_dir]}/#{file}"
    end
    say I18n.t('terraform.destroy.out.destroyed').green
  end
end
