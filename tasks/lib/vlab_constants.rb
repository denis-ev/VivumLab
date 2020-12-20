module VlabConstants
  def current_version
    @current_version ||= File.read("VERSION").chomp
  end

  def latest_version
    @latest_version ||= HTTParty.get('https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION').chomp
  end
end
