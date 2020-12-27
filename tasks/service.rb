# frozen_string_literal: true

# Contains tasks and logic
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'remove', 'Removes the specified service from the VivumLab server'
  def remove(service)
    run_common
    say I18n.t(:s_service_removing).yellow
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    say I18n.t(:s_service_removed).green
  end

  desc 'reset', 'Resets the specified service\'s files on the server'
  def reset(service)
    say I18n.t(:s_service_resetting).yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(service))
    run_playbook('playbook.remove.yml', options, limit_to_service(service))
    run_playbook('playbook.vivumlab.yml', options, "#{limit_to_service(service)} -t deploy")
    say I18n.t(:s_service_reset).green
  end

  desc 'stop', 'Stops all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it stops all services.'
  def stop
    say I18n.t(:s_service_stopping).yellow
    run_common
    run_playbook('playbook.stop.yml', options, limit_to_service(options[:service]))
    say I18n.t(:s_service_stopped).green
  end

  desc 'restart', 'Restart all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it restarts all services.'
  def restart
    say I18n.t(:s_service_restarting).yellow
    run_common
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t(:s_service_restarted).green
  end

  desc 'update', 'Updates all services, or a selected service if you specify --service'
  option :service, type: :string, desc: 'Optional name of service. Without, it restarts all services.', aliases: ['-s']
  def update
    say I18n.t(:s_service_updating).yellow
    run_common
    run_playbook('playbook.vivumlab.yml', options, limit_to_service(options[:service]))
    run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
    say I18n.t(:s_service_updated).green
  end

  desc 'docs', 'Show the docs for the specified service'
  def docs(service)
    say TTY::Markdown.parse_file("docs/software/#{service}.md")
  end

  desc 'customize', 'Allows you to edit a specific deployed service with a docker-compose.override.yml'
  def customize(service)
    say I18n.t(:s_service_customizing).yellow
    return unless yes?(I18n.t(:q_service_customizing), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(service))
    say I18n.t(:s_service_customized).green
  end

  desc 'enable', 'Enables NAME'
  def enable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: true
    say I18n.t(:s_service_enabled).green
  end

  desc 'disable', 'Disables NAME'
  def disable(service_name)
    invoke 'config:set', [], config_key: "#{service_name}.enable", value: false
    say I18n.t(:s_service_disabled).green
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
      invoke 'git:sync', [], {}
      invoke 'config:new', [], { config_dir: options[:config_dir] }
    end
  end
end
