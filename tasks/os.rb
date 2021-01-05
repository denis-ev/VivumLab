# frozen_string_literal: true

# responsible for handling OS detection
module OS
  require 'English'
  def self.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def self.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def self.unix?
    !windows?
  end

  def self.linux?
    unix? and !mac?
  end

  def self.systemctl?
    `which systemctl`
    linux? and $CHILD_STATUS.success?
  end

  def self.service?
    `which service`
    linux? and $CHILD_STATUS.success? and !systemctl?
  end
end
