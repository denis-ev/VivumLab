module Utils
  require_relative './lib/vlab_constants.rb'
  include VlabConstants
  require_relative './lib/config_file_utils.rb'
  include ConfigFileUtils
  include VlabI18N

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
      -e \@./#{options[:config_dir]}/vault.yml \
      #{extra} \
      -i inventory
      PLAYBOOK
      say "executing playbook command: #{playbook_command}".yellow if options[:debug] != :none
      execute_in_shell(playbook_command.squeeze(" ").strip)
    rescue
      say "Ansible Playbook command returned with an error code.".red
    ensure
      FileUtils.rm_f @temp_config
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
