module App
  class SanityChecks < SubCommandBase
    desc "SanityCheck", "Executes all sanity checks"
    def sanitycheck()
      puts "success".green
    end
  end
end
# module Vlab
#   class Cli < Thor
#     puts "yes"


#     desc "testing 123", "demo two parameter"
#     def test(param1, param2)
#       # Comments in ruby start with a # There is no multiline comment construct
#       puts "param1 #{param1}".blue # the .blue colorizes this output to be blue
#       puts "param2 #{param2}".red # makes it red
#     end

#   end
# end
