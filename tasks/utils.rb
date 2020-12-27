# frozen_string_literal: true

# a module of utilities
module Utils
  require_relative './lib/vlab_constants'
  include VlabConstants
  require_relative './lib/config_file_utils'
  include ConfigFileUtils
  include VlabI18n

  def run_playbook(playbook, options, extra = nil)
    write_temporary_decrypted_config
    execute_in_shell(playbook_command(playbook, extra, options[:debug].to_sym).strip)
    say I18n.t(:s_utils_playbookexecuted).green
  rescue Subprocess::NonZeroExit => e
    say I18n.t(:s_utils_playbookerror).red
    say "Exception is: #{e}"
  ensure
    FileUtils.rm_f @temp_config
  end

  def playbook_command(playbook, extra, debug = '')
    command = []
    command << "ansible-playbook #{playbook} #{debug}"
    command << "-e \@./#{@temp_config}" if playbook.equals('playbook.config.yml')
    command << extra.to_s
    command << '-i inventory'
    command.join(' ')
  end

  def run_config_playbook(options, extra = '')
    say I18n.t(:s_utils_playbookexecuting).yellow if options[:debug] != :none
    execute_in_shell(playbook_command('playbook.config.yml', extra, options[:debug].to_sym).strip)
    say I18n.t(:s_utils_playbookexecuted).green
    migration_invoke_override
  rescue Subprocess::NonZeroExit => e
    say 'Failed to run Ansible playbook: playbook.config.yml'.red
    say "Error is: #{e}"
  end

  def execute_in_shell(params)
    Subprocess.check_call(params.split(' '))
  end

  def cat(file)
    Subprocess.call(['cat', file])
  end

  def migration_invoke_override
    # Because we always invoke migrations as part of the sanity checks,
    # this invoke call fails (as already run) if written this way:
    # invoke 'migration:single_config', [], options
    # so we'll invoke it manually
    migration = Migration.new
    migration.options = options
    migration.single_config
  end

  def convert_debug_enum(level)
    level_hash = { warn: '-v', debug: '-vv', trace: '-vvv', none: '' }
    level_hash[level]
  end
end
