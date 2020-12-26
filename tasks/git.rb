# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'sync', 'Syncs your settings git repo'
  def sync
    if Dir.exist? "#{options[:config_dir]}/.git"
      say 'Synching settings via Git'.green
      FileUtils.mkdir_p "#{options[:config_dir]}/.git/hooks"
      FileUtils.cp 'git_sync_pre_commit', "#{options[:config_dir]}/.git/hooks/pre-commit"
      FileUtils.chmod '+x', "#{options[:config_dir]}/.git/hooks/pre-commit"

      execute_in_shell("cd #{options[:config_dir]}/ && git pull && git add . > /dev/null")
      execute_in_shell("cd #{options[:config_dir]}/ && git commit -a -m 'Settings update' || true")
      execute_in_shell("cd #{options[:config_dir]}/ && git push > /dev/null")
    else
      warning = <<-WARNING
      'Warning! Your settings directory is not setup as a Git Repository.
      Make sure to back them up using some other method.
      https://vivumlab.com/setup/installation/#syncing-settings-via-git'
      WARNING
      say warning.light_red
    end
  end

  desc 'track', 'Allows you to switch between different branches or tags of Vlab'
  option :branch, required: true, type: :string, desc: 'The name of the branch, or tag you\'d like to use'
  def track
    execute_in_shell("git checkout #{options[:branch]}")
  end
end
