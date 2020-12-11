module Vlab
  class Docker < SubCommandBase

    desc "docker_run", "runs an arbitrary command inside the Vlab docker container"
    def docker_run(*params)
      run_docker params
    end

    desc "run_container_shell", "opens a shell in the VivumLab docker container"
    def run_container_shell
      exec_docker "/bin/bash"
    end

    default_task :run_container_shell
  end
end
