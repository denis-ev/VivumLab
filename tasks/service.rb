# frozen_string_literal: true

# Contains tasks and logic
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :disable_push, required: false, type: :boolean, desc: 'Disable pushing git to remote', default: false
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc I18n.t('service.remove.name'), I18n.t('service.remove.desc')
  def remove(service)
    run_common
    say I18n.t('service.remove.out.removing', service: options[:service]).yellow
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    say I18n.t('service.remove.out.removed', service: options[:service]).green
  end

  desc I18n.t('service.reset.name'), I18n.t('service.reset.desc')
  def reset(service)
    service.split(',').each do |service|
      say I18n.t('service.s_resetting', service: service).yellow
      run_common
      run_playbook('playbook.stop.yml', options, limit_to_service(service))
      run_playbook('playbook.remove.yml', options, limit_to_service(service))
      run_playbook('playbook.vivumlab.yml', options, "#{limit_to_service(service)} -t deploy")
      say I18n.t('service.s_reset', service: service).green
    end
  end

  desc I18n.t('service.stop.name'), I18n.t('service.stop.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it stops all services.'
  def stop
    say I18n.t('service.stop.out.stopping').yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.stop.out.stopped').green
  end

  desc I18n.t('service.restart.name'), I18n.t('service.restart.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it restarts all services.'
  def restart
    say I18n.t('service.restart.out.restarting').yellow
    run_common
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.restart.out.restarted').green
  end

  desc I18n.t('service.update.name'), I18n.t('service.update.desc')
  option :service, type: :string, desc: 'Optional name of service. Without, it updates all services.', aliases: ['-s']
  def update
    say I18n.t('service.update.out.updating', service: options[:service]).yellow
    run_common
    run_playbook('playbook.vivumlab.yml', options, limit_to_service(options[:service]))
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.update.out.updated').green
  end

  desc I18n.t('service.docs.name'), I18n.t('service.docs.desc')
  def docs(service)
    say TTY::Markdown.parse_file("docs/software/#{service}.md")
  end

  desc I18n.t('service.customize.name'), I18n.t('service.customize.desc')
  def customize(service)
    say I18n.t('service.customize.out.customizing', service: options[:service]).yellow
    return unless yes?(I18n.t('service.customize.in.customizing', service: options[:service]), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(service))
    say I18n.t('service.customize.out.customized', service: options[:service]).green
  end

  desc I18n.t('service.enable.name'), I18n.t('service.enable.desc')
  def enable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: true
    say I18n.t('service.enable.out.enabled', service: service_name).green
  end

  desc I18n.t('service.disable.name'), I18n.t('service.disable.desc')
  def disable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: false
    say I18n.t('service.disable.out.disabled', service: service_name).green
  end

  desc I18n.t('service.show.name'), I18n.t('service.show.desc')
  def show(service_name)
    invoke 'config:show', [], service: service_name
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
