module Utils
  def current_version
    @current_version ||= File.read("VERSION").chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end

  def run_docker(*params)
    args = (not params.nil? && args.nil?) ? params : args
    executable = <<-DOCKERRUN
      docker run --rm -it \
      -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}" \
      -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub" \
      -v $(pwd):/data \
      -v $HOME/.vlab_vault_pass:/ansible_vault_pass \
      vivumlab/vivumlab:#{current_version} #{args.join ' '}
    DOCKERRUN
    execute_in_shell(executable)
  end

  def run_playbook(playbook, options)
    playbook_command = <<-PLAYBOOK
    ansible-playbook #{playbook} #{convert_debug_enum(options[:debug].to_sym)} \
    --extra-vars="@#{options[:config_dir]}/config.yml" \
    --extra-vars="@#{options[:config_dir]}/vault.yml" \
    -i inventory
    PLAYBOOK
    run_docker(playbook_command)
  end

  def execute_in_shell(params)
    cmd = TTY::Command.new(pty: true, uuid: false)
    cmd.run!(params.chomp)
  end

  def cat file
    fork{exec("cat #{file}")}
  end

  def ansible_vars()
    # Load the .env file found in tasks/ansible_bash.vars
    @ansible_vars ||= Dotenv.load 'tasks/ansible_bash.vars'
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
