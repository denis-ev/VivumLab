# frozen_string_literal: true

# Contains tasks and logic
class Service < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :disable_push, required: false, type: :boolean, desc: 'Disable pushing git to remote', default: false
  class_option :config_dir, type: :string, desc: I18n.t('options.configdir'), default: 'settings'

  desc I18n.t('service.list.name'), I18n.t('service.list.desc')
  option :columns, type: :numeric, required: false, default: 5, banner: 'example useage'
  def list
    services = service_list.each_slice(5).entries
    (5 - (service_list.size % 5)).times { services.last << '' }
    table = TTY::Table.new(rows: services)
    say table.render(:unicode)
  end

  desc I18n.t('service.remove.usage'), I18n.t('service.remove.desc')
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def remove
    options[:service].split(',').each do |service|
      run_common
      say I18n.t('service.remove.out.removing', service: options[:service]).yellow
      run_playbook('playbook.remove.yml', options, limit_to_service(service))
      invoke 'dev:set', [], config_key: "#{service}.enable", value: false
      say I18n.t('service.remove.out.removed', service: options[:service]).green
    end
  end

  desc I18n.t('service.reset.usage'), I18n.t('service.reset.desc')
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def reset(service)
    service.split(',').each do |srv|
      say I18n.t('service.reset.out.resetting', service: srv.chomp).yellow
      run_common
      run_playbook('playbook.stop.yml', options, limit_to_service(srv.chomp))
      run_playbook('playbook.remove.yml', options, limit_to_service(srv.chomp))
      run_playbook('playbook.vivumlab.yml', options, "#{limit_to_service(srv.chomp)} -t deploy")
      say I18n.t('service.s_reset', service: srv.chomp).green
    end
  end

  desc I18n.t('service.stop.usage'), I18n.t('service.stop.desc')
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def stop
    options[:service].split(',').each do |service|
      say I18n.t('service.stop.out.stopping').yellow
      run_common
      run_playbook('playbook.stop.yml', options, limit_to_service(options[:service]))
      say I18n.t('service.stop.out.stopped').green
    end
  end

  desc I18n.t('service.restart.usage'), I18n.t('service.restart.desc')
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def restart
    options[:service].split(',').each do |service|
      say I18n.t('service.restart.out.restarting').yellow
      run_common
      run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
      say I18n.t('service.restart.out.restarted').green
    end
  end

  desc I18n.t('service.update.usage'), I18n.t('service.update.desc')
  option :service, type: :string, desc: I18n.t('options.serviceswarning'), aliases: ['-s']
  def update
    options[:service].split(',').each do |service|
      say I18n.t('service.update.out.updating', service: options[:service]).yellow
      run_common
      run_playbook('playbook.vivumlab.yml', options, limit_to_service(options[:service]))
      run_playbook('playbook.restart.yml', options, limit_to_service(options[:service]))
      say I18n.t('service.update.out.updated').green
    end
  end

  desc I18n.t('service.docs.usage'), I18n.t('service.docs.desc')
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def docs
    say TTY::Markdown.parse_file("website/docs/software/#{options[:service]}.md")
  end

  desc I18n.t('service.customize.usage'), I18n.t('service.customize.desc')
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def customize
    say I18n.t('service.customize.out.customizing', service: options[:service]).yellow
    return unless yes?(I18n.t('service.customize.in.customizing', service: options[:service]), :yellow)

    run_playbook('playbook.service-edit.yml', options, limit_to_service(options[:service]))
    say I18n.t('service.customize.out.customized', service: options[:service]).green
  end

  desc I18n.t('service.show.usage'), I18n.t('service.show.desc')
  option :service, required: true, type: :string, desc: I18n.t('options.servicerequired'), aliases: ['-s']
  def show
    invoke 'config:show', [], service: options[:service]
  end

  desc I18n.t('service.setup.usage'), I18n.t('service.setup.desc')
  option :service, required: true, type: :string, desc: I18n.t('options.servicename'), aliases: ['-s']
  def setup
    service_config = decrypted_config_file[options[:service]]
    say I18n.t('service.setup.out.searchfail', service: options[:service]).green if service_config.nil?
    return if service_config.nil?

    say I18n.t('service.setup.out.editing', service: options[:service])
    service_config.each do |key,value|
      ignored = %w[amd64 arm64 armv7]
      service_config[key] = ask(I18n.t('service.setup.in.keyvalue', key: key), default: service_config[key]) unless ignored.include? key
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
