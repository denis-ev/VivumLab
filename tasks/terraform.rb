# frozen_string_literal: true

# Contains tasks related to spinning up a server using Terraform
class Terraform < Thor
  include VlabI18n
  include Utils
  require 'json'

  desc I18n.t('terraform.bastion.usage'), I18n.t('terraform.bastion.desc')
  def bastion
    exit 1 unless prerequisites_met?
    terraform_ansible_setup(options)
    @terraform_ip = terraform_shell_commands(options)
    invoke 'config:set', [], config_key: 'bastion.server_address', value: @terraform_ip
    say I18n.t('terraform.create.out.created', ip: @terraform_ip).green
    say I18n.t('terraform.create.out.setip', ip: @terraform_ip, config_dir: options[:config_dir]).light_blue
  end

  desc I18n.t('terraform.create.usage'), I18n.t('terraform.create.desc')
  def create
    exit 1 unless prerequisites_met?
    terraform_ansible_setup(options)
    @terraform_ip = terraform_shell_commands(options)
    say I18n.t('terraform.create.out.created', ip: @terraform_ip).green
    say I18n.t('terraform.create.out.setip', ip: @terraform_ip, config_dir: options[:config_dir]).light_blue
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

  no_commands do
    def prerequisites_met?
      invoke 'git:sync'
      invoke 'config:new'
      say I18n.t('terraform.create.out.creating').yellow
      if decrypted_config_file['do_access_token'] == false
        say I18n.t('terraform.prereq.out.notoken').red
        say I18n.t('terraform.prereq.out.pleaserun').red
        say I18n.t('terraform.prereq.out.before').red
      end
      decrypted_config_file['do_access_token']
    end

    def extract_ip_from_terraform_json(json)
      data = ConfigFile.new(JSON.parse(json))['values']
      data.root_module
          .resources
          .first['values']
          .ipv4_address
    end

    def terraform_ansible_setup(options)
      run_playbook('playbook.terraform.yml', options)
      FileUtils.mv 'provider.tf', "settings/#{options[:config_dir]}/provider.tf"
      FileUtils.mv 'cloud_vivumlab.tf', "settings/#{options[:config_dir]}/cloud_vivumlab.tf"
      FileUtils.mv 'terraform.tfvars', "settings/#{options[:config_dir]}/terraform.tfvars"
    end

    def terraform_shell_commands(options)
      # @todo terraform_shell_commands() do not always run init
      # @body init if .terraform dir !exists or force option
      execute_in_shell('terraform init', "settings/#{options[:config_dir]}")
      execute_in_shell('terraform apply -auto-approve', "settings/#{options[:config_dir]}")
      shell_command = 'terraform show -json'.split(/\s(?=(?:[^"]|"[^"]*")*$)/)
      terraform_json = Subprocess.check_output(shell_command, cwd: "settings/#{options[:config_dir]}")
      extract_ip_from_terraform_json(terraform_json)
    end
  end
end
