module Vlab
 class CLI < Thor
    include Utils
    # Tasks defined here are *not* namespaced and will therefore show up
    # as direct tasks.

    desc "find_help", "Shows the user how to contact the VivumLab community"
    def find_help
      say TTY::Markdown.parse_file("docs/Contact-us.md")
    end

    desc "debug_cli", "Launches Pry within the context of the CLI. Used to debug the CLI"
    def debug_cli
      binding.pry
    end

  end
end
