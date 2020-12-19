class Git < Thor

  desc "sync", "Syncs your settings git repo"
  def sync
    cmd = TTY::Command.new(pty: true, uuid: false, printer: :progress)
    if Dir.exist? "#{options[:config_dir]}/.git"
      say "Synching settings via Git".green
      FileUtils.mkdir_p '#{options[:config_dir]}/.git/hooks'
      FileUtils.cp 'git_sync_pre_commit', '#{options[:config_dir]}/.git/hooks/pre-commit'
      FileUtils.chmod '+x', '#{options[:config_dir]}/.git/hooks/pre-commit'
      cmd.run!("git pull", chdir: "#{options[:config_dir]}/")
      cmd.run!("git add . > /dev/null", chdir: "#{options[:config_dir]}/")
      cmd.run!("git commit -a -m 'Settings update' || true", chdir: "#{options[:config_dir]}/")
      cmd.run!("git push > /dev/null", chdir: "#{options[:config_dir]}/")
    else
      say "Warning! Your settings directory is not setup as a Git Repository. Make sure to back them up using some other method. https://vivumlab.com/setup/installation/#syncing-settings-via-git ".light_red
    end
  end

  desc "track", "Allows you to switch between different branches or tags of Vlab"
  option :branch, :required => true, :type => :string, :desc => "The name of the branch, or tag you'd like to use"
  def track()
    execute_in_shell("git checkout #{options[:branch]}")
  end

end
