# frozen_string_literal: true

# Contains tasks and logic
# rubocop:disable Metrics/ClassLength
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('service.list.name'), I18n.t('service.list.desc')
  option :columns, type: :numeric, required: false, default: 5, banner: 'example usage'
  def list
    services = service_list.each_slice(5).entries
    (5 - (service_list.size % 5)).times { services.last << '' }
    table = TTY::Table.new(rows: services)
    say table.render(:unicode)
  end

  desc I18n.t('service.remove.usage'), I18n.t('service.remove.desc'), hide: true
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def remove
    run_common
    options[:service].split(',').each do |service|
      say I18n.t('service.remove.out.removing', service: service).yellow
      run_playbook('playbook.remove.yml', options, limit_to_service(service))
      invoke 'config:set', [], config_key: "#{service}.enable", value: false
      say I18n.t('service.remove.out.removed', service: service).green
    end
  end

  desc I18n.t('service.stop.usage'), I18n.t('service.stop.desc'), hide: true
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def stop
    run_common
    options[:service].split(',').each do |service|
      say I18n.t('service.stop.out.stopping').yellow
      run_playbook('playbook.stop.yml', options, limit_to_service(service))
      say I18n.t('service.stop.out.stopped').green
    end
  end

  desc I18n.t('service.restart.usage'), I18n.t('service.restart.desc'), hide: true
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def restart
    run_common
    options[:service].split(',').each do |service|
      say I18n.t('service.restart.out.restarting').yellow
      run_playbook('playbook.restart.yml', options, limit_to_service(service))
      say I18n.t('service.restart.out.restarted').green
    end
  end

  desc I18n.t('service.update.usage'), I18n.t('service.update.desc'), hide: true
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def update
    run_common
    playbooks = %w[vivumlab restart]
    if options[:service].nil?
      run_playbooks(playbooks, options, nil)
    else
      options[:service].split(',').each do |service|
        say I18n.t('service.update.out.updating', service: service).yellow
        run_playbooks(playbooks, options, limit_to_service(service))
        say I18n.t('service.update.out.updated').green
      end
    end
  end

  desc I18n.t('service.docs.usage'), I18n.t('service.docs.desc'), hide: true
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def docs
    say TTY::Markdown.parse_file("website/docs/software/#{options[:service]}.md")
  end

  # rubocop:disable Metrics/AbcSize
  desc I18n.t('service.reset.usage'), I18n.t('service.reset.desc'), hide: true
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def reset
    run_common
    options[:service].split(',').each do |srv|
      say I18n.t('service.reset.out.resetting', service: srv.chomp).yellow
      run_playbooks(%w[stop remove vivumlab], options, limit_to_service(srv.chomp))
      say I18n.t('service.reset.out.reset', service: srv.chomp).green
    end
  end

  desc I18n.t('service.customize.usage'), I18n.t('service.customize.desc'), hide: true
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def customize
    say I18n.t('service.customize.out.customizing', service: options[:service]).yellow
    return unless yes?(I18n.t('service.customize.in.customizing', service: options[:service]), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.customize.out.customized', service: options[:service]).green
  end
  # rubocop:enable Metrics/AbcSize

  desc I18n.t('service.show.usage'), I18n.t('service.show.desc'), hide: true
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def show
    invoke 'config:show', [], service: options[:service]
  end

  desc I18n.t('service.setup.usage'), I18n.t('service.setup.desc'), hide: true
  option :service, required: true, type: :string, desc: I18n.t('options.servicename'), aliases: ['-s']
  def setup
    return if guard_against_invalid_service_config?(options[:service])

    interactive_setup(options[:service])
    @decrypted_config_file = nil
    invoke 'config:show', [], service: options[:service]
  end

  # This 'task' is responsible for yeilding to dynamically created namespaces for the
  # given service. Unlike other tasks, this one has a parameter, not an option.
  # this means the usage is like this: `vlab service SERVICENAME COMMAND` where
  # servicename and command are inputs from the user.
  desc 'SERVICENAME', 'dynamic service task defers to service specific namespace provided as parameter'
  option :value, type: :string, required: false, desc: I18n.t('options.valuetoset'), aliases: ['-v']
  def dynamic(dynamic_namespace, command = 'help')
    return if guard_against_invalid_service_config?(dynamic_namespace)

    if Object.const_get(dynamic_namespace.capitalize).new.respond_to? command.to_sym
      invoke "#{dynamic_namespace}:#{command}", [], { value: options[:value] }
    else
      say I18n.t('service.dynamic.out.invalidcommand', command: command, dynamic_namespace: dynamic_namespace).red
      say I18n.t('service.dynamic.out.validoptions').light_blue
      invoke dynamic_namespace.to_s, [], {}
    end
  end

  # rubocop:disable Metrics/BlockLength
  no_commands do
    def interactive_setup(service)
      say I18n.t('service.setup.out.editing', service: service)
      service_config = decrypted_config_file[service]
      ignored = %w[amd64 arm64 armv7]
      service_config.each_key do |key|
        unless ignored.include? key
          service_config[key] = ask(I18n.t('service.setup.in.keyvalue', key: key), default: service_config[key])
        end
      end

      decrypted_config_file.merge service_config
      save_config_file
    end

    def run_playbooks(playbooks, options, service_limit)
      playbooks.each do |playbook|
        run_playbook("playbook.#{playbook}.yml", options, service_limit)
      end
    end

    def guard_against_invalid_service_config?(service)
      service_config = decrypted_config_file[service]
      say I18n.t('service.setup.out.searchfail', service: service).red if service_config.nil?
      service_config.nil?
    end

    def limit_to_service(service = nil)
      "-e {'services':['#{service}']}" unless service.nil?
    end

    def run_common
      invoke 'migration:single_config'
      invoke 'git:sync', [], options
      invoke 'config:new', [], options
    end
  end
  # rubocop:enable Metrics/BlockLength

  default_task :dynamic
end
# rubocop:enable Metrics/ClassLength
