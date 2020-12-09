module Vlab
  class CI < SubCommandBase
    desc "build", "ci build for VivumLab, configures it first if needed"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :debug, :desc => "Debugs Ansible-playbook commands"
    option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def build()
      invoke_subtask "Core", "logo"
      invoke_subtask "Core", "build", options
      invoke_subtask "Core", "local", options
      File.write("tasks/ansible_bash.vars", "PASSWORDLESS_SSHKEY=''") unless File.exist? "tasks/ansible_bash.vars"
      debug_flag = options[:debug] ? '-vvv' : ''
      playbook_command = <<-PLAYBOOK
      ansible-playbook playbook.ci_config.yml #{debug_flag} \
      --extra-vars="@#{options[:config_dir]}/config.yml" \
      --extra-vars="@#{options[:config_dir]}/vault.yml" \
      -i inventory
      PLAYBOOK
      run_docker(playbook_command)
      invoke_subtask "Core", "encrypt"

      playbook_command = <<-PLAYBOOK
      ansible-playbook playbook.ci.yml #{debug_flag} \
      --extra-vars="@#{options[:config_dir]}/config.yml" \
      --extra-vars="@#{options[:config_dir]}/vault.yml" \
      -i inventory
      PLAYBOOK
      run_docker(playbook_command)
    end

  end
end
