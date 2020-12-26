# frozen_string_literal: true

# Contains memoized methods for constants
module VlabConstants
  def current_version
    @current_version ||= File.read('VERSION').chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end

  def python3_installed?
    @python3_installed ||= system('which python3')
  end
end
