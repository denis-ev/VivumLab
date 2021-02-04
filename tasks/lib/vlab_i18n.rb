# frozen_string_literal: true

# Module contains the setup needed for vlab i18n support
module VlabI18n
  require 'i18n'
  I18n.load_path << Dir["#{File.expand_path('tasks/locales')}/*.yml"]
  # I18n.default_locale = :en
end
