# frozen_string_literal: true

# Contains tasks for developing Vlab, not using it.
class Dev < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  class_option :debug, desc: 'Debugs Ansible-playbook commands',
                       enum: %w[none warn debug trace],
                       default: :none,
                       aliases: ['-d']
  class_option :config_dir, type: :string, desc: 'Config dir to use', default: 'settings'

  desc I18n.t('dev.setup.usage'), I18n.t('dev.setup.desc')
  def dev_setup
    return if system('which pre-commit >/dev/null')

    say I18n.t('dev.setup.out.welcome').light_blue
    return unless yes?(I18n.t('dev.setup.in.contribute'), :yellow)

    install_precommit
    say I18n.t('dev.setup.out.precommiterror').red unless system('which pre-commit >/dev/null')
    say I18n.t('dev.setup.out.readythanks').green
  end

  desc I18n.t('dev.set.usage'), I18n.t('dev.set.desc')
  option :config_key, type: :string, required: true, desc: 'Dot notation key to set'
  option :value, type: :string, required: true, desc: 'value to set'
  # This method contains some advanced, idiomatic ruby that may not be entirely
  # clear to new rubyists. I've tried to comment for clarity.
  def set
    good_config_key = last_good_key(decrypted_config_file, options[:config_key])
    say I18n.t('dev.set.out.nokey', config_key: options[:config_key]).red && return unless good_config_key
    eval_config_setting(good_config_key, options[:value]) if options[:config_key] == good_config_key
    return unless (options[:config_key].include? good_config_key) && (options[:config_key] != good_config_key)

    draw_error_table options[:config_key], good_config_key
  end

  no_commands do
    def eval_config_setting(key, value)
      # rubocop:disable Security/Eval
      if [true, false].include? value # sometimes the value is a string that also acts like a decimal (ip address)
        eval("decrypted_config_file.#{key.chomp}=#{value}", binding, __FILE__, __LINE__)
      else
        eval("decrypted_config_file.#{key.chomp}=\"#{value}\"", binding, __FILE__, __LINE__)
      end
      # rubocop:enable Security/Eval
      save_config_file
    end

    def draw_error_table(config_key, good_config_key)
      say I18n.t('config.draw_error_table.out.keynomatch', config_key: options[:config_key]).red
      say I18n.t('config.draw_error_table.out.possiblekey').yellow
      table = TTY::Table.new(header: ["#{good_config_key}.<<option>>", 'value'],
                             rows: decrypted_config_file[good_config_key])
      say table.render(:unicode)
    end

    def install_precommit
      say I18n.t('dev.install_precommit.out.readdevdocs').yellow
      say I18n.t('dev.install_precommit.out.precommitwarning').yellow
      say I18n.t('dev.install_precommit.out.pythonerror').red unless python3_installed
      `curl https://pre-commit.com/install-local.py | python3 -` if python3_installed? && yes?(I18n.t('dev.install_precommit.in.installprecommit'), :yellow)
    end
  end
end
