# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc 'sync', 'Syncs your settings git repo'
  def sync
    if Dir.exist? "./#{options[:config_dir]}/.git"
      say I18n.t('git.s_settingssyncing').yellow
      ensure_precommit
      execute_git_sync
      say I18n.t('git.s_settingssynced').green
    else
      say I18n.t('git.s_notsetup').red
    end
  end

  desc 'track', 'Allows you to switch between different branches or tags of Vlab'
  option :branch, required: true, type: :string, desc: 'The name of the branch, or tag you\'d like to use'
  def track
    execute_in_shell("git checkout #{options[:branch]}")
    say I18n.t('git.s_trackbranch', branch: options[:branch]).green
  end

  no_commands do
    def ensure_precommit
      FileUtils.mkdir_p "#{options[:config_dir]}/.git/hooks"
      FileUtils.cp 'git_sync_pre_commit', "#{options[:config_dir]}/.git/hooks/pre-commit"
      FileUtils.chmod '+x', "#{options[:config_dir]}/.git/hooks/pre-commit"
    end

    def execute_git_sync
      execute_in_shell("cd #{options[:config_dir]}/ && git pull && git add . > /dev/null")
      execute_in_shell("cd #{options[:config_dir]}/ && git commit -a -m 'Settings update' || true")
      execute_in_shell("cd #{options[:config_dir]}/ && git push > /dev/null")
    end
  end
end
