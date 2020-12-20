class Service < Thor
  require './tasks/utils.rb'
  include Utils

  desc "remove_one", "Removes the specified service from the VivumLab server"
  option :service, :type => :string, :required => true, desc: "Name of service"
  def remove_one()
    run_common
    say "Removing data for service: #{options[:service]}"
    run_playbook("playbook.remove.yml", options,  limit_to_service)
  end

  desc "reset_one", "Resets the specified service's files on the server "
  option :service, :type => :string, :required => true, desc: "Name of service"
  def reset_one()
    run_common
    extra = "{\"services\":[\"#{options[:service]}\"]}"
    run_playbook("playbook.stop.yml", options, limit_to_service)
    run_playbook("playbook.remove.yml", options, limit_to_service)
    extra = " -t deploy "
    run_playbook("playbook.vivumlab.yml", options, limit_to_service + extra)

    say "Reset #{options[:service]}"
  end

  desc "stop", "Stops all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it stops all services."
  def stop()
    run_common
    run_playbook("playbook.stop.yml", options, limit_to_service)
  end

  desc "restart", "Restart all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it restarts all services."
  def restart()
    run_common
    run_playbook("playbook.restart.yml", options, limit_to_service)
  end

  desc "update", "Updates all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it restarts all services."
  def update()
    run_common
    run_playbook("playbook.vivumlab.yml", options, limit_to_service)
    run_playbook("playbook.restart.yml", options, limit_to_service)
  end

  desc "show", "Show the docs for the specified service"
  def show(service)
    say TTY::Markdown.parse_file("docs/software/#{service}.md")
  end

  desc "customize_service", "Allows you to edit a specific deployed service with a docker-compose.override.yml"
  option :service, type: :string, required: true, desc: "The name of the service to create an override file for"
  def customize_service
    run_playbook("playbook.service-edit.yml", options, limit_to_service)
  end

  desc "enable", "Enables NAME"
  def enable(service_name)
    invoke "config:set", [], config_key:"#{service_name}.enable", value:true
  end

  desc "disable", "Disables NAME"
  def disable(service_name)
    invoke "config:set", [], config_key:"#{service_name}.enable", value:false
  end

  desc "show", "Show the configuration options for NAME"
  def show(service_name)
    invoke "config:show", [], service: service_name
  end

  no_tasks {
    def limit_to_service()
      "-e {\"services\":[\"#{options[:service]}\"]}" unless options[:service].nil?
    end

    def run_common
      invoke "core:logo", [], {}
      invoke "git:sync", [], {}
      invoke "config:initial_config", [], {config_dir: options[:config_dir]}
    end
  }
end
