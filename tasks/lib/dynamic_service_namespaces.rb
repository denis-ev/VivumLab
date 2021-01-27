# frozen_string_literal: true

# Contains logic for dynamically generating namespaces for each service
module DynamicServiceNamespaces
  require './tasks/lib/config_file_utils'
  extend ConfigFileUtils
  include VlabI18n

  if encrypted_yml_exist?
    service_list.each do |service|
      service_config = decrypted_config_file[service]
      next if service_config.nil?

      # For every constant known to this invocation, remove _'s and
      # capitalize - this makes apple_health_influx into Applehealthinflux
      # which, while not perfect, is a valid Ruby Class name.
      # this block takes that new class name and creates a new class inheriting
      # from thor.
      Object.const_set(
        service.split('_').collect(&:capitalize).join,
        Class.new(Thor) do
          # For each service configuration option thats valid for this service
          # create setter methods for each of them. ie:
          # vlab service NAME PropertyName -v = bob
          # This generates a 1:1 match between config file options for this service
          # and configuration setters.
          rejected_properties = %w[amd64 arm64 armv7]
          services = service_config.reject { |s| rejected_properties.include? s }
          services.each_key do |key|
            desc I18n.t('dynamic_namespaces.service.config.usage', service: service, key: key),
                 I18n.t('dynamic_namespaces.service.config.desc', service: service, key: key)
            option :value, required: true, banner: I18n.t('dynamic_namespaces.service.config.options.banner'),
                           alias: ['-v']
            define_method(key.to_s) do
              options[:value] = true if key.to_s == 'enable'
              options[:value] = true if key.to_s == 'disable'
              invoke 'config:set', [], config_key: "#{service}.#{key}", value: options[:value]
              invoke 'service:update', [], service: service if yes?(I18n.t('service.dynamic.out.applyupdates'))
            end
          end

          # This block identifies all the commands defined in the service namespace
          # and creates tasks that parallel them in this dynamic namespace.
          # anything in the rejected list is, of course rejected.
          require_relative '../service' unless defined? Service
          rejected = %w[limit_to_service run_common list
                        dynamic help interactive_setup run_playbooks guard_against_invalid_service_config?]
          ::Service.new.public_methods(false).reject { |klass_name| rejected.include? klass_name.to_s }.each do |meth|
            hidden = true if meth == :docs
            desc I18n.t('dynamic_namespaces.service.classes.usage', service: service, meth: meth),
                 I18n.t('dynamic_namespaces.service.classes.desc', service: service, meth: meth), hide: hidden
            define_method(meth.to_s) do
              invoke "service:#{meth}", [], service: service
            end
          end
          default_task :help
        end
      )
    end
  end
end
