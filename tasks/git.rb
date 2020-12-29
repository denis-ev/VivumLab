# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('git.sync.name'), I18n.t('git.sync.desc')
  option :disable_push, required: false, type: :boolean, desc: 'Disable pushing git to remote', default: false
  def sync
    if Dir.exist? "./#{options[:config_dir]}/.git"
      say I18n.t('git.sync.out.settingssyncing').yellow
      ensure_precommit
      execute_git_sync options[:config_dir], options[:disable_push]
      say I18n.t('git.sync.out.settingssynced').green
    else
      say I18n.t('git.sync.out.notsetup').red
    end
  end

  desc I18n.t('git.track.name'), I18n.t('git.track.desc')
  option :branch, required: true, type: :string, desc: 'The name of the branch, or tag you\'d like to use'
  def track
    execute_in_shell("git checkout #{options[:branch]}")
    say I18n.t('git.track.out.trackbranch', branch: options[:branch]).green
  end

  no_commands do
    def ensure_precommit
      FileUtils.mkdir_p "#{options[:config_dir]}/.git/hooks"
      FileUtils.cp 'git_sync_pre_commit', "#{options[:config_dir]}/.git/hooks/pre-commit"
      FileUtils.chmod '+x', "#{options[:config_dir]}/.git/hooks/pre-commit"
    end

    def execute_git_sync(config_dir, disable_push)
      execute_in_shell("git config --global user.email \"#{decrypted_config_file['admin_email']}\"")
      execute_in_shell("git config --global user.name \"#{decrypted_config_file['default_username']}\"")
      execute_in_shell('git pull', config_dir)
      execute_in_shell('git add *', config_dir)
      execute_in_shell('git commit -a -m "updating settings"', config_dir, true )
      execute_in_shell('git push', config_dir) unless disable_push
    rescue Subprocess::NonZeroExit => e
      say 'Failed to execute some portion of the git sync.'.red
      say e
    end
  end
end
