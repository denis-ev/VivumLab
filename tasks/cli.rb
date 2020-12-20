class CLI < Thor
  include Utils

  desc "debug_cli", "Launches Pry within the context of the CLI. Used to debug the CLI"
  def debug_cli
    binding.pry
  end

end
