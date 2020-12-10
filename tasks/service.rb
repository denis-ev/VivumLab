module Vlab
  class Service < SubCommandBase

    desc "remove_one", "Removes the specified service from the VivumLab server"
    option :service, :type => :string, :required => true, desc: "Name of service"
    def remove_one()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build"
      invoke_subcommand "Git", "sync"
      invoke_subcommand "Config", "config"
      say "Removing data for service: #{options[:service]}"
      extra = "{\"services\":[\"#{options[:service]}\"]}"
      run_playbook("playbook.remove.yml", options,  extra)
    end

    desc "reset_one", "Resets the specified service's files on the server "
    option :service, :type => :string, :required => true, desc: "Name of service"
    def reset_one()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build"
      invoke_subcommand "Git", "sync"
      invoke_subcommand "Config", "config"
      extra = "{\"services\":[\"#{options[:service]}\"]}"
      run_playbook("playbook.stop.yml", options, extra)
      run_playbook("playbook.remove.yml", options, extra)
      extra += " -t deploy "
      run_playbook("playbook.vivumlab.yml", options,  extra)

      say "Reset #{options[:service]}"
    end

    # desc "stop_one", "Stops the specified service"
    # option :service, :type => :string, :required => true, desc: "Name of service"
    # def stop_one()
    #   invoke_subcommand "Core", "logo"
    #   invoke_subcommand "Core", "build"
    #   invoke_subcommand "Git", "sync"
    #   invoke_subcommand "Config", "config"
    #   extra = "{\"services\":[\"#{options[:service]}\"]}"
    #   run_playbook("playbook.stop.yml", extra)
    # end

    desc "stop", "Stops ALL services"
    option :service, :type => :string, desc: "Optional name of service. Without, it stops all services."
    def stop()
      invoke_subcommand "Core", "logo"
      invoke_subcommand "Core", "build"
      invoke_subcommand "Git", "sync"
      invoke_subcommand "Config", "config"
      extra = "{\"services\":[\"#{options[:service]}\"]}" unless options[:service].nil?

      # run_playbook("playbook.stop.yml", options, extra)
    end
  end
end
