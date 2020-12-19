class CI < Thor
  desc "build", "ci build for VivumLab, configures it first if needed"
  def build()
    invoke "core:logo"
    invoke "core:local", options
    File.write("tasks/ansible_bash.vars", "PASSWORDLESS_SSHKEY=''") unless File.exist? "tasks/ansible_bash.vars"
    run_playbook("playbook.ci_config.yml", options)

    invoke "core:encrypt"

    run_playbook("playbook.ci.yml", options)
  end

end
