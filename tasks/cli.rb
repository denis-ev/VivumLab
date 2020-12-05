module Vlab
 class CLI < Thor
    # Tasks defined here are *not* namespaced and will therefore show up
    # as direct tasks.
    desc "foo", "foobar"
    def foo()
      puts "foo"
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
      puts "bar"
    end
  end
end
