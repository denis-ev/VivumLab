module Vlab

  # These Tasks exist not for any real useful work, but to illustrate
  # how Thor, the CLI framework handles options, and what builtin
  # features it offers
  class DemoTasks < SubCommandBase

    # The desc method accepts two parameters. The first is the Title of the task
    # this is what the user will type: i.e. vlab testing. The second is a short
    # description of what the command does.
    # desc is *required* for user-facing tasks
    desc "testing", "demo two parameter"
    # Often, we may want to provide a *longer* description and that can be done
    # using the long_desc method. Note the long_desc method uses ruby's
    # HEREDOC syntax, meaning everything between <<-LONGDESC and LONGDESC is treated
    # as one big multi-line string
    long_desc <<-LONGDESC
    `vlab testing` will print out a message with the two parameters you provide

    This demo requires *both* paramaters. Other examples will show more advanced

    > $ vlab testing inBlue inRed
  LONGDESC
    def testing(param1, param2)
      puts "param1 #{param1}".blue # the .blue colorizes this output to be blue
      puts "param2 #{param2}".red # makes it red
    end

    # This task accepts options, which are different from params
    # these are specified on the command line by --NAME i.e.
    # --from bob.
    # Options can have types, like boolean
    option :from
    option :yell, :type => :boolean
    desc "hello NAME", "say hello to NAME"
    def hello(name)
      output = []
      output << "from: #{options[:from]}" if options[:from]
      output << "Hello #{name}"
      output = output.join("\n")
      puts options[:yell] ? output.upcase : output
    end

    # This task accepts options, one of which is required
    # these are specified on the command line by --NAME i.e.
    # --from bob.
    # Options can have types, like boolean
    option :requiredParam, required:true
    option :yell, :type => :boolean
    desc "helloRequired NAME", "say hello to NAME"
    def helloRequired(name)
      output = []
      output << "from: #{options[:requiredParam]}"
      output << "Hello #{name}"
      output = output.join("\n")
      puts options[:yell] ? output.upcase : output
    end

    desc "fireShell", "Use this to fire and forget a shell command"
    long_desc <<-FIRESHELL
      There are multiple ways of executing shell commands in ruby. This method does not capture any output from the command that's run. So this method `fork{exec("command")}` is great for firing things off that you don't care about.
    FIRESHELL
    def fireShell()
      fork{exec("cat MOTD")}
    end

    desc "Demonstrate Optional PARAMs", "Demonstrates how to have optional parameters"
    def optional_demo(name, optional=nil)
      puts "name #{name}".blue # the .blue colorizes this output to be blue
      puts "optional #{optional}".red # makes it red
    end
  end
end
