# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'sync', 'Syncs your settings git repo'
  def sync
    if Dir.exist? "#{options[:config_dir]}/.git"
      I18n.t(:s_git_settingssyncing).yellow
      FileUtils.mkdir_p "#{options[:config_dir]}/.git/hooks"
      FileUtils.cp 'git_sync_pre_commit', "#{options[:config_dir]}/.git/hooks/pre-commit"
      FileUtils.chmod '+x', "#{options[:config_dir]}/.git/hooks/pre-commit"

      execute_in_shell("cd #{options[:config_dir]}/ && git pull && git add . > /dev/null")
      execute_in_shell("cd #{options[:config_dir]}/ && git commit -a -m 'Settings update' || true")
      execute_in_shell("cd #{options[:config_dir]}/ && git push > /dev/null")
      I18n.t(:s_git_settingssynced).green
    else
      I18n.t(:s_git_notsetup).red
    end
  end

  desc 'track', 'Allows you to switch between different branches or tags of Vlab'
  option :branch, required: true, type: :string, desc: 'The name of the branch, or tag you\'d like to use'
  def track
    execute_in_shell("git checkout #{options[:branch]}")
    I18n.t(:s_git_trackbranch).green
  end
end
