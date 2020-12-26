module Utils
  require_relative './lib/vlab_constants.rb'
  include VlabConstants
  require_relative './lib/config_file_utils.rb'
  include ConfigFileUtils
  include VlabI18n

  def run_playbook(playbook, options, extra="")
    say "Using config directory: #{options[:config_dir]}/config.yml".yellow
    # NOTE THIS IS NOT A DIRECT PORT OF THE BASH VERSION
    # THE BASH VERSION DOES SHELL EXPANSION, AND SHELL EXPANSION WITHIN " "'S
    # BREAKS RUBY'S EXECUTION OF THIS IN A SUB-PROCESS SHELL.
    # DO NOT, I REPEAT, DO NOT PUT THE QUOTES BACK IN
    begin
      write_temporary_decrypted_config
      playbook_command = <<-PLAYBOOK
      ansible-playbook #{playbook} #{convert_debug_enum(options[:debug].to_sym)} \
      -e \@./#{@temp_config} \
      #{extra} \
      -i inventory
      PLAYBOOK
      binding.pry
      say I18n.t(:s_utils_playbookexecuting).yellow if options[:debug] != :none
      execute_in_shell(playbook_command.squeeze(' ').strip)
      say I18n.t(:s_utils_playbookexecuted).green
    rescue => e
      say I18n.t(:s_utils_playbookerror).red
      binding.pry
    ensure
      FileUtils.rm_f @temp_config
    end
  end

  def run_config_playbook(options, extra='')
    begin
      playbook_command = <<-PLAYBOOK
      ansible-playbook playbook.config.yml #{convert_debug_enum(options[:debug].to_sym)} \
      #{extra} \
      -i inventory
      PLAYBOOK
      say I18n.t(:s_utils_playbookexecuting).yellow if options[:debug] != :none
      execute_in_shell(playbook_command.squeeze(' ').strip)
      say I18n.t(:s_utils_playbookexecuted).green
      # Because we always invoke migrations as part of the sanity checks,
      # this invoke call fails (as already run) if written this way:
      # invoke 'migration:single_config', [], options
      # so we'll invoke it manually
      migration = Migration.new
      migration.options = options
      migration.single_config
    rescue => e
      say "Failed to run Ansible playbook: playbook.config.yml".red
      say "Error is: #{e}"
    end
  end

  def execute_in_shell(params)
    Subprocess.check_call(params.split(' '))
  end

  def cat file
    Subprocess.call(['cat', file])
  end

  def convert_debug_enum(level)
    case level
    when :warn
      return '-v'
    when :debug
      return '-vv'
    when :trace
      return '-vvv'
    end
  end
end
