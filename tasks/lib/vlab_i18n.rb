module VlabI18N

    require 'i18n'
    I18n.load_path << Dir[File.expand_path("tasks/locales") + "/*.yml"]
    I18n.default_locale = :en
  end