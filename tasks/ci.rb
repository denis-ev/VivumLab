module Vlab
  class CI < SubCommandBase
    desc "build", "ci build for VivumLab, configures it first if needed"
    option :force, :type => :boolean, :desc => "Forces a rebuild of the docker image"
    option :build, :type => :boolean, :desc => "Forces a *local* build of the docker image"
    option :debug, :desc => "Debugs Ansible-playbook commands", :enum => ["none", "warn", "debug", "trace"], :default => :none
    option :config_dir, :type => :string, :desc => "Config dir to use", :default => "settings"
    option :cache, :type => :boolean, :desc => "Allows the build to use the Cache"
    def build()
      invoke_subtask "Core", "logo"
      invoke_subtask "Core", "build", options
      invoke_subtask "Core", "local", options
      File.write("tasks/ansible_bash.vars", "PASSWORDLESS_SSHKEY=''") unless File.exist? "tasks/ansible_bash.vars"
      run_playbook("playbook.ci_config.yml", options)

      invoke_subtask "Core", "encrypt"

      run_playbook("playbook.ci.yml", options)
    end

  end
end
