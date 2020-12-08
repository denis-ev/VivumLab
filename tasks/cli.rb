module Vlab
 class CLI < Thor
    include Utils
    # Tasks defined here are *not* namespaced and will therefore show up
    # as direct tasks.
    desc "foo", "foobar"
    def foo()
      say "foo"
      # if you want to invoke a task from within another
      # task in the same namespace, just call the method directly.
      bar()
      # if you want to invoke a task from *another namespace*
      # first construct an instance of it's namespace class using
      # `ClassName.new` then append the method, and any parameters
      # you want to pass. This calls the Testing task from the DemoTasks
      # namespace/class
      DemoTasks.new.testing("foo", "bar")
    end

    desc "bar", "foobar"
    def bar()
      say "bar"
    end

    desc "debug", "Launches Pry"
    def debug()
      ::Vlab::SanityChecks.new.check_ssh_with_keys()
    end

    desc "docker_run", "runs a command inside the Vlab docker container"
    def docker_run(*params)
      say run_docker params
    end

  end
end
