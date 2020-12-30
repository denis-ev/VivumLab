# frozen_string_literal: true

# Contains tasks and logic
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :disable_push, required: false, type: :boolean, desc: 'Disable pushing git to remote', default: false
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc 'remove', 'Removes the specified service from the VivumLab server'
  def remove(service)
    run_common
    say I18n.t('service.s_removing', service: options[:service]).yellow
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    say I18n.t('service.s_removed', service: options[:service]).green
  end

  desc 'reset', 'Resets the specified service\'s files on the server'
  def reset(service)
    say I18n.t('service.s_resetting', service: options[:service]).yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(service))
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    run_playbook('playbook.vivumlab.yml', options, "#{limit_to_service(service)} -t deploy")
    say I18n.t('service.s_reset', service: options[:service]).green
  end

  desc 'stop', 'Stops all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it stops all services.'
  def stop
    say I18n.t('service.s_stopping').yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.s_stopped').green
  end

  desc 'restart', 'Restart all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it restarts all services.'
  def restart
    say I18n.t('service.s_restarting').yellow
    run_common
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.s_restarted').green
  end

  desc 'update', 'Updates all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it updates all services.', aliases: ['-s']
  def update
    say I18n.t('service.s_updating', service: options[:service]).yellow
    run_common
    run_playbook('playbook.vivumlab.yml', options, limit_to_service(options[:service]))
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.s_updated').green
  end

  desc 'docs', 'Show the docs for the specified service'
  def docs(service)
    say TTY::Markdown.parse_file("docs/software/#{service}.md")
  end

  desc 'customize', 'Allows you to edit a specific deployed service with a docker-compose.override.yml'
  def customize(service)
    say I18n.t('service.s_customizing', service: options[:service]).yellow
    return unless yes?(I18n.t('service.q_customizing', service: options[:service]), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(service))
    say I18n.t('service.s_customized', service: options[:service]).green
  end

  desc 'enable', 'Enables NAME'
  def enable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: true
    say I18n.t('service.s_enabled', service: options[:service]).green
  end

  desc 'disable', 'Disables NAME'
  def disable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: false
    say I18n.t('service.s_disabled', service: options[:service]).green
  end

  desc 'show', 'Show the configuration options for NAME'
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
