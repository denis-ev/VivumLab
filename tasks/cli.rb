class CLI < Thor
  include Utils
  include VlabI18n

  desc 'debug_cli', 'Launches Pry within the context of the CLI. Used to debug the CLI'
  def debug_cli
    # this method exists to drop a developer into a running CLI environment, and the
    # binding.pry command, despite being against style guide rules, is here
    # intentionally.
    # rubocop:disable Lint/Debugger
    binding.pry
    # rubocop:enable Lint/Debugger
  end

end
