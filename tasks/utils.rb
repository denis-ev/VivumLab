module Utils
  def run_docker(*params)
    current_version = File.read("VERSION").chomp
    args = (not params.nil? && args.nil?) ? params : args
    executable = <<-DOCKERRUN
      docker run --rm -it \
      -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}" \
      -v "$HOME/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub":"/root/.ssh/#{ansible_vars["PASSWORDLESS_SSHKEY"]}.pub" \
      -v $(pwd):/data \
      -v $HOME/.vlab_vault_pass:/ansible_vault_pass \
      vivumlab/vivumlab:#{current_version} #{args.join ' '}
    DOCKERRUN
    cmd = TTY::Command.new(pty: true)
    cmd.run(executable.chomp)
  end

  def cat file
    fork{exec("cat #{file}")}
  end

  def ansible_vars()
    # Load the .env file found in tasks/ansible_bash.vars
    @ansible_vars ||= Dotenv.load 'tasks/ansible_bash.vars'
  end


end
