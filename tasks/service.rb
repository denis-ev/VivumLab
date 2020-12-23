class Service < Thor
  require './tasks/utils.rb'
  include Utils

  desc "remove_one", "Removes the specified service from the VivumLab server"
  def remove_one(service)
    run_common
    say "Removing data for service: #{service}"
    run_playbook("playbook.remove.yml", options,  limit_to_service(service))
  end

  desc "reset_one", "Resets the specified service's files on the server "
  def reset_one(service)
    run_common
    extra = "{\"services\":[\"#{service}\"]}"
    run_playbook("playbook.stop.yml", options, limit_to_service(service))
    run_playbook("playbook.remove.yml", options, limit_to_service(service))
    extra = " -t deploy "
    run_playbook("playbook.vivumlab.yml", options, limit_to_service(service) + extra)

    say "Reset #{options[:service]}"
  end

  desc "stop", "Stops all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it stops all services."
  def stop()
    run_common
    run_playbook("playbook.stop.yml", options, limit_to_service(options[:service]))
  end

  desc "restart", "Restart all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it restarts all services."
  def restart()
    run_common
    run_playbook("playbook.restart.yml", options, limit_to_service(options[:service]))
  end

  desc "update", "Updates all services, or a selected service if you specify --service"
  option :service, :type => :string, desc: "Optional name of service. Without, it restarts all services.", aliases: ['-s']
  def update()
    run_common
    run_playbook("playbook.vivumlab.yml", options, limit_to_service(options[:service]))
    run_playbook("playbook.restart.yml", options, limit_to_service(options[:service]))
  end

  desc "show", "Show the docs for the specified service"
  def show(service)
    say TTY::Markdown.parse_file("docs/software/#{service}.md")
  end

  desc "customize_service", "Allows you to edit a specific deployed service with a docker-compose.override.yml"
  def customize_service(service)
    run_playbook("playbook.service-edit.yml", options, limit_to_service(service))
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
    def limit_to_service(service = nil)
      "-e {\"services\":[\"#{service}\"]}" unless service.nil?
    end

    def run_common
      invoke "git:sync", [], {}
      invoke "config:initial_config", [], {config_dir: options[:config_dir]}
    end
  }
end
