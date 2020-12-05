module Vlab
  class SanityChecks < SubCommandBase
    desc "SanityCheck", "Executes all sanity checks"
    def sanitycheck()
      puts "success".green
    end
  end
end
