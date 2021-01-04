# frozen_string_literal: true

# Class is reponsible for handling the git sync (optional) of the config directories
class Git < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('git.sync.usage'), I18n.t('git.sync.desc')
  option :disable_push, required: false, type: :boolean, desc: I18n.t('options.disablegitsync'), default: false
  def sync
    unless Dir.exist? "settings/#{options[:config_dir]}/.git"
      execute_in_shell('git init', "settings/#{options[:config_dir]}")
    end

    say I18n.t('git.sync.out.settingssyncing').yellow
    execute_git_sync(options[:config_dir], options[:disable_push])
  end

  desc I18n.t('git.track.usage'), I18n.t('git.track.desc')
  option :branch, required: true, type: :string, desc: I18n.t('options.branchtrack')
  def track
    execute_in_shell("git checkout #{options[:branch]}")
    say I18n.t('git.track.out.trackbranch', branch: options[:branch]).green
  end

  no_commands do
    def execute_git_sync(config_dir, disable_push)
      execute_in_shell("git config --global user.email \"#{decrypted_config_file['admin_email']}\"")
      execute_in_shell("git config --global user.usage \"#{decrypted_config_file['default_username']}\"")
      execute_in_shell('git pull', "settings/#{config_dir}", true) unless disable_push
      execute_in_shell('git add .', "settings/#{config_dir}")
      execute_in_shell('git commit -a -m "updating settings"', "settings/#{config_dir}", true)
      execute_in_shell('git push', "settings/#{config_dir}") unless disable_push
      say I18n.t('git.sync.out.settingssynced').green
    rescue Subprocess::NonZeroExit => e
      say 'Failed to execute some portion of the git sync.'.red
      say e
    end
  end
end
