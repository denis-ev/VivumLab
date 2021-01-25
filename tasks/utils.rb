# frozen_string_literal: true

# a module of utilities
module Utils
  require_relative './lib/vlab_constants'
  include VlabConstants
  require_relative './lib/config_file_utils'
  include ConfigFileUtils
  include VlabI18n

  def run_playbook(playbook, options, extra = nil, deploy: false)
    write_temporary_decrypted_config
    cmd = playbook_command(playbook, extra, options[:debug].to_sym, deploy).strip
    execute_in_shell(cmd)
    say I18n.t('utils.run_playbook.out.playbookexecuted', playbook_command: cmd).green
  rescue Subprocess::NonZeroExit => e
    say I18n.t('utils.run_playbook.out.playbookerror', e: e).red
  ensure
    FileUtils.rm_f @temp_config
  end

  def playbook_command(playbook, extra = nil, debug = '', deploy)
    command = []
    command << "ansible-playbook #{playbook.chomp}"
    command << convert_debug_enum(debug) unless convert_debug_enum(debug).size.zero?
    command << "-e \@#{@temp_config}" if playbook != 'playbook.config.yml'
    command << '--skip-tags setup' unless deploy
    command << '--skip-tags tor' unless decrypted_config_file[:enable_tor] rescue false
    command << '--skip-tags bastion' unless decrypted_config_file[:bastion][:enable] and not deploy rescue false
    command << "-e config_dir=#{options[:config_dir]}"
    command << extra.to_s unless extra.nil? || extra.size.zero?
    command << '-i inventory'
    command.join(' ')
  end

  def run_config_playbook(options, extra = '', deploy: false)
    playbook_cmd = playbook_command('playbook.config.yml', extra, options[:debug].to_sym, deploy).strip
    execute_in_shell(playbook_cmd)
    say I18n.t('utils.run_config_playbook.out.playbookexecuted', playbook_command: playbook_cmd).green
    # migration_invoke_override
    manual_invoke('migration:single_config', options)
  rescue Subprocess::NonZeroExit => e
    say I18n.t('utils.run_config_playbook.out.playbookerror', e: e).red
  end

  def execute_in_shell(params, cwd = './', fail_ok = nil)
    Subprocess.call(params.split(/\s(?=(?:[^"]|"[^"]*")*$)/), cwd: cwd) if fail_ok
    Subprocess.check_call(params.split(/\s(?=(?:[^"]|"[^"]*")*$)/), cwd: cwd) unless fail_ok
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

  # Because Thor automatically de-dupes repeated invocations of the same task, if we need to
  # manually invoke a task more than once, we do it through this method
  # Example: manual_invoke('config:set', options)
  def manual_invoke(what, options)
    what_arr = what.split(':')
    klass = Kernel.const_get("::#{what_arr.first.capitalize}").new
    klass.options = options
    klass.send(what_arr.last)
  end

  def convert_debug_enum(level)
    level_hash = { warn: '-v', debug: '-vv', trace: '-vvv', none: '' }
    level_hash[level]
  end
end
