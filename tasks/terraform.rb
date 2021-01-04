# frozen_string_literal: true

# Contains tasks related to spinning up a server using Terraform
class Terraform < Thor
  include VlabI18n
  include Utils
  require 'open3'

  desc I18n.t('terraform.create.usage'), I18n.t('terraform.create.desc')
  def create
    invoke 'git:sync'
    invoke 'config:new'
    say I18n.t('terraform.create.out.creating').yellow
    if decrypted_config_file['do_access_token'] == false
      say "No valid DO access token found.  Please run 'vlab dev set --dev --config-key do_access_token --value <token>' before attempting terraform.".red
      exit 1
    end
    run_playbook('playbook.terraform.yml', options)
    FileUtils.mv "provider.tf", "settings/#{options[:config_dir]}/provider.tf"
    FileUtils.mv "cloud_vivumlab.tf", "settings/#{options[:config_dir]}/cloud_vivumlab.tf"
    FileUtils.mv "terraform.tfvars", "settings/#{options[:config_dir]}/terraform.tfvars"
    # @todo terraform create check functions
    # @body 'vlab terraform create' works, but code needs to be verified
    terraform_init = "/bin/bash -c 'exit 0'"
    terraform_init = "/bin/bash -c 'cd settings/#{options[:config_dir]} && terraform init'" unless Dir.exist? "settings/#{options[:config_dir]}/.terraform"
    Open3.popen2e(terraform_init) do |stdin, stdout_and_stderr, wait_thr|
      while line = stdout_and_stderr.gets
        puts line
      end
    end
    terraform_apply = "/bin/bash -c 'cd settings/#{options[:config_dir]} && terraform apply -auto-approve'"
    Open3.popen2e(terraform_apply) do |stdin, stdout_and_stderr, wait_thr|
      while line = stdout_and_stderr.gets
        puts line
      end
    end
    # rubocop:disable Layout/LineLength
    terraform_get_ip = "/bin/bash -c 'cd settings/#{options[:config_dir]} && terraform show -json | jq -r .values.root_module.resources[0].values.ipv4_address'"
    terraform_ip = ""
    Open3.popen2e(terraform_get_ip) do |stdin, stdout_and_stderr, wait_thr|
      while line = stdout_and_stderr.gets
        puts line
        terraform_ip = line
      end
    end
    # rubocop:enable Layout/LineLength
    invoke 'dev:set', [], config_key: "vlab_ip", value: terraform_ip
    say I18n.t('terraform.create.out.created', ip: terraform_ip).green
    say I18n.t('terraform.create.out.setip').light_blue
  end

  desc I18n.t('terraform.destroy.usage'), I18n.t('terraform.destroy.desc')
  def destroy
    say I18n.t('terraform.destroy.out.destroying').yellow
    terraform_destroy = "/bin/bash -c 'cd settings/#{options[:config_dir]} && terraform destroy -auto-approve'"
    Open3.popen2e(terraform_destroy) do |stdin, stdout_and_stderr, wait_thr|
      while line = stdout_and_stderr.gets
        puts line
      end
    end
    FileUtils.rm("settings/#{options[:config_dir]}/provider.tf") unless !File.exist? "settings/#{options[:config_dir]}/provider.tf"
    FileUtils.rm("settings/#{options[:config_dir]}/cloud_vivumlab.tf") unless !File.exist? "settings/#{options[:config_dir]}/cloud_vivumlab.tf"
    FileUtils.rm("settings/#{options[:config_dir]}/terraform.tfvars") unless !File.exist? "settings/#{options[:config_dir]}/terraform.tfvars"
    FileUtils.rm("settings/#{options[:config_dir]}/.terraform.lock.hcl") unless !File.exist? "settings/#{options[:config_dir]}/.terraform.lock.hcl"
    FileUtils.rm("settings/#{options[:config_dir]}/terraform.tfstate") unless !File.exist? "settings/#{options[:config_dir]}/terraform.tfstate"
    FileUtils.rm("settings/#{options[:config_dir]}/terraform.tfstate.backup") unless !File.exist? "settings/#{options[:config_dir]}/terraform.tfstate.backup"
    FileUtils.remove_dir("settings/#{options[:config_dir]}/.terraform") unless !Dir.exist? "settings/#{options[:config_dir]}/.terraform"
    say I18n.t('terraform.destroy.out.destroyed').green
  end
end
