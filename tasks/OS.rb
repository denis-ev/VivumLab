
module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end

  def OS.systemctl?
    `which systemctl`
    OS.linux? and $?.success?
  end

  def OS.service?
    `which serice`
    OS.linux? and $?.success? and not OS.systemctl?
  end

  def OS.jruby?
    RUBY_ENGINE == 'jruby'
  end
end
