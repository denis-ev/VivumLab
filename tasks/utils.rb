module Utils
  def current_version
    @current_version ||= File.read("VERSION").chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end

  # def generate_docker_executable_call(*params)
  #   args = (not params.nil? && args.nil?) ? params : args
  #   executable = <<-DOCKERRUN
  #     docker run --rm -it \
  #     -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}" \
  #     -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub" \
  #     -v $(pwd):/data \
  #     -v $HOME/.vlab_vault_pass:/ansible_vault_pass \
  #     vivumlab/vivumlab:#{current_version} #{args.join ' '}
  #   DOCKERRUN
  # end

  def run_docker(*params)
    execute_in_shell(params)
  end

  def exec_docker(*params)
    exec params
  end

  def run_playbook(playbook, options, extra="")
    playbook_command = <<-PLAYBOOK
    ansible-playbook #{playbook} #{convert_debug_enum(options[:debug].to_sym)} \
    --extra-vars="@#{options[:config_dir]}/config.yml" \
    --extra-vars="@#{options[:config_dir]}/vault.yml" \
    #{extra} -i inventory
    PLAYBOOK
    say playbook_command
    run_docker(playbook_command)
  end

  # def run_playbook(playbook, options, extra="")
  #   playbook_command = <<-PLAYBOOK
  #   ansible-playbook #{playbook} #{convert_debug_enum(options[:debug].to_sym)} \
  #   --extra-vars="@#{options[:config_dir]}/config.yml" \
  #   --extra-vars="@#{options[:config_dir]}/vault.yml" \
  #   #{extra} -i inventory
  #   PLAYBOOK
  #   say playbook_command
  #   run_docker(playbook_command)
  # end

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

  def config_file
    @config_file ||= Hashie::Mash.new(YAML.load_file("#{options[:config_dir]}/config.yml"))
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

  def hash_to_a(object)  # { 3 => 4 }
    return object unless object.is_a? Hash
      object.map do |k, v|
      [hash_to_a(k), hash_to_a(v)]
    end
  end

  def last_good_key(hsh, key)
    # binding.pry
    while true do
      key_bad = hsh.instance_eval(key) rescue nil
      if key_bad.nil?  # if the user specified key is bad
        parts = key.split('.') # break that key up into an array of strings
        return nil if parts.size() == 1
        key = parts.take(parts.size() -1).join('.') # reset the key to be one section shorter. ie: sui.enabled -> sui
        # restart the loop.
      else
        # the provided key (or shortened key) is valid
        break # stop the loop
      end
    end
    return key # return the current, valid key.
  end
end
