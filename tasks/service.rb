# frozen_string_literal: true

# Contains tasks and logic
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :disable_push, required: false, type: :boolean, desc: 'Disable pushing git to remote', default: false
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc I18n.t('service.remove.usage'), I18n.t('service.remove.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it removes all services.', aliases: ['-s']
  def remove
    run_common
    say I18n.t('service.remove.out.removing', service: options[:service]).yellow
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    invoke 'dev:set', [], config_key: "#{service}.enable", value: false
    say I18n.t('service.remove.out.removed', service: options[:service]).green
  end

  desc I18n.t('service.reset.name'), I18n.t('service.reset.desc')
  def reset(service)
    service.split(',').each do |service|
      say I18n.t('service.s_resetting', service: service.chomp).yellow
      run_common
      run_playbook('playbook.stop.yml', options, limit_to_service(service.chomp))
      run_playbook('playbook.remove.yml', options, limit_to_service(service.chomp))
      run_playbook('playbook.vivumlab.yml', options, "#{limit_to_service(service.chomp)} -t deploy")
      say I18n.t('service.s_reset', service: service.chomp).green
    end
  end

  desc I18n.t('service.stop.usage'), I18n.t('service.stop.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it stops all services.', aliases: ['-s']
  def stop
    say I18n.t('service.stop.out.stopping').yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.stop.out.stopped').green
  end

  desc I18n.t('service.restart.usage'), I18n.t('service.restart.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it restarts all services.', aliases: ['-s']
  def restart
    say I18n.t('service.restart.out.restarting').yellow
    run_common
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.restart.out.restarted').green
  end

  desc I18n.t('service.update.usage'), I18n.t('service.update.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it updates all services.', aliases: ['-s']
  def update
    say I18n.t('service.update.out.updating', service: options[:service]).yellow
    run_common
    run_playbook('playbook.vivumlab.yml', options, limit_to_service(options[:service]))
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.update.out.updated').green
  end

  desc I18n.t('service.docs.usage'), I18n.t('service.docs.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def docs
    say TTY::Markdown.parse_file("website/docs/software/#{options[:service]}.md")
  end

  desc I18n.t('service.customize.usage'), I18n.t('service.customize.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def customize
    say I18n.t('service.customize.out.customizing', service: options[:service]).yellow
    return unless yes?(I18n.t('service.customize.in.customizing', service: options[:service]), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.customize.out.customized', service: options[:service]).green
  end

  desc I18n.t('service.enable.usage'), I18n.t('service.enable.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def enable
    invoke 'dev:set', [], config_key: "#{options[:service]}.enable", value: true
    say I18n.t('service.enable.out.enabled', service: options[:service]).green
  end

  desc I18n.t('service.disable.usage'), I18n.t('service.disable.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def disable
    invoke 'dev:set', [], config_key: "#{options[:service]}.enable", value: false
    say I18n.t('service.disable.out.disabled', service: options[:service]).green
  end

  desc I18n.t('service.show.usage'), I18n.t('service.show.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def show
    invoke 'config:show', [], service: options[:service]
  end

  desc I18n.t('service.https_only.usage'), I18n.t('service.https_only.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :value, required: true, type: :string, desc: 'Required value (true/false).', aliases: ['-v']
  def https_only
    invoke 'dev:set', [], config_key: "#{options[:service]}.https_only", value: "#{options[:value]}"
    say I18n.t('service.https_only.out.value', service: options[:service], value: options[:value]).green
  end

  desc I18n.t('service.auth.usage'), I18n.t('service.auth.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :value, required: true, type: :string, desc: 'Required value (true/false).', aliases: ['-v']
  def auth
    invoke 'dev:set', [], config_key: "#{options[:service]}.auth", value: "#{options[:value]}"
    say I18n.t('service.auth.out.value', service: options[:service], value: options[:value]).green
  end

  desc I18n.t('service.domain.usage'), I18n.t('service.domain.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :value, required: true, type: :string, desc: 'Required value.', aliases: ['-v']
  def domain
    invoke 'dev:set', [], config_key: "#{options[:service]}.domain", value: "#{options[:value]}"
    say I18n.t('service.domain.out.value', service: options[:service], value: options[:value]).green
  end

  desc I18n.t('service.subdomain.usage'), I18n.t('service.subdomain.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :value, required: true, type: :string, desc: 'Required value.', aliases: ['-v']
  def subdomain
    invoke 'dev:set', [], config_key: "#{options[:service]}.subdomain", value: "#{options[:value]}"
    say I18n.t('service.subdomain.out.value', service: options[:service], value: options[:value]).green
  end

  desc I18n.t('service.version.usage'), I18n.t('service.version.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :value, required: true, type: :string, desc: 'Required value.', aliases: ['-v']
  def version
    invoke 'dev:set', [], config_key: "#{options[:service]}.version", value: "#{options[:value]}"
    say I18n.t('service.version.out.value', service: options[:service], value: options[:value]).green
  end

  desc I18n.t('service.set.usage'), I18n.t('service.set.desc')
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  option :enable, type: :boolean, desc: 'Enable the service (true/false).'
  option :https_only, type: :boolean, desc: 'Enable https_only for service (true/false).'
  option :auth, type: :boolean, desc: 'Enable auth for service (true/false).'
  option :domain, type: :string, desc: 'Set custom domain for service (subdomain.example.com).'
  option :subdomain, type: :string, desc: 'Set subdomain for service (subdomain).'
  option :version, type: :string, desc: 'Set version for service (latest).'
  def set
    invoke 'dev:set', [], config_key: "#{options[:service]}.enable", value: "#{options[:enable]}" unless options[:enable].nil?
    invoke 'dev:set', [], config_key: "#{options[:service]}.https_only", value: "#{options[:https_only]}" unless options[:https_only].nil?
    invoke 'dev:set', [], config_key: "#{options[:service]}.auth", value: "#{options[:auth]}" unless options[:auth].nil?
    invoke 'dev:set', [], config_key: "#{options[:service]}.domain", value: "#{options[:domain]}" unless options[:domain].nil?
    invoke 'dev:set', [], config_key: "#{options[:service]}.subdomain", value: "#{options[:subdomain]}" unless options[:subdomain].nil?
    invoke 'dev:set', [], config_key: "#{options[:service]}.version", value: "#{options[:version]}" unless options[:version].nil?
    say I18n.t('service.set.out.value', service: options[:service], value: options[:value]).green
  end

  desc 'setup', 'Interactive setup of a service\'s configuration settings'
  option :service, required: true, type: :string, desc: 'Required name of service.', aliases: ['-s']
  def setup
    # need list of services config settings.
    # loop over hash asking for data, presenting the current example as the default
    service_config = decrypted_config_file[options[:service]]
    say "Failed to find a service config for service: #{options[:service]}" if service_config.nil?
    return if service_config.nil?

    service_config.each do |key,value|
      service_config[key] = ask "What value would you like to set for #{key}: ", default: service_config[key]
    end

    decrypted_config_file.merge service_config
    save_config_file
    @decrypted_config_file = nil
    invoke 'config:show', [], service: options[:service]
  end

  no_tasks do
    def limit_to_service(service = nil)
      "-e {'services':['#{service}']}" unless service.nil?
    end

    def run_common
      invoke 'git:sync', [], options
      invoke 'config:new', [], { config_dir: options[:config_dir] }
    end
  end
end
