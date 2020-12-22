---
id: commands
title: Vivumlab Commands
hide_title: true
hide_table_of_contents: false
sidebar_label: Commands
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Vivumlab Commands
**`vlab -t`** will list all available commands.
**`vlab -h COMMAND`** will show help info for the specified command, eg. **`vlab -h config`**

## Core Commands:
These commands will check or make changes to the core of VivumLab.
For service specific commands, scroll down or click [here](#service-commands)

#### create_base **UNDER CONSTRUCTION**
Installs necessary dependencies on the remote server.
    example: **`vlab create_base`**
NOTE: Only run this if the server itself is not set up.
    eg. Python, Git, and other necessary programs aren't installed

#### config
Creates or Updates the config file as necessary.
Options: build, debug, force
    example: **`vlab config`**

#### config_reset
Resets the Configuration
Options: build, force
    example: **`vlab config_reset`**

#### deploy
deploys Vivumlab, useful when a server refresh is needed.
Options: build, cache, debug, force
    example: **`vlab deploy`**

#### restart
Restart all enabled services.
Options: build, debug, force
    example: **`vlab restart`**

#### stop
Restart all enabled services
Options: build, debug, force
    example: **`vlab stop`**

#### terraform
Spin up a cloud server with Terraform.
Options: build, debug, force
    example: **`vlab terraform`**

#### terraform_destroy
Destroys servers created by terraform.
Options: none
    example: **`vlab terraform_destroy`**

#### update
Updates all services on the Vivumlab Server.
Options: build, debug, force
    example: **`vlab update`**

#### build
Builds the Docker Image used to deploy
Options: build, debug, force
    example: **`vlab build`**

#### git_sync **UNDER CONSTRUCTION**
Manually forces a settings sync via git.
Options: none
    example: **`vlab git_sync`**

#### encrypt
Encrypts the vault.
Options: none
    example: **`vlab encrypt`**

#### decrypt
Decrypts the vault
Options: none
    example: **`vlab decrypt`**

#### uninstall
Uninstalls Vivumlab.
Options: build, debug, force
    example: **`vlab uninstall`**

#### restore **UNDER CONSTRUCTION**
Restore a server from backups. Assuming backups were running
    example: **`vlab restore`**

#### shell
Opens a shell on the remote server.
Options: none
    example: **`vlab shell`**

#### docker_shell
Opens a shell in the VivumLab deploy container.
Options: none
    example: **`vlab docker_shell`**
NOTE: You will not be able to exit out of the docker container.
NOTE: If you wanted to access outside the container, use the shell command

#### create_sshkey
Creates an SSH Key, based on the name provided by the user when `vlab config` was run.
Options: build, debug, force
    example **`vlab create_sshkey`**
NOTE: Will ask for a password. Will still work, even if you do not provide one.

#### show_config
Shows the configuration settings for the specified service.
Options: none
    example (jellyfin): **`vlab show_config service=jellyfin`**

#### set
Set a configuration variable
Options: none
    examples:
    (enabling Jellyfin): **`vlab set jellyfin.enable=true`**
    (setup Vivumlab for an Arm Arcitecture) **`vlab set arm=true`**
    (change the default_password): **`vlab set vault.default_password=S0m3C00lP@s$word`**
    (changing the CloudFlare API email) **`vlab set vault.traefik.additional_env_vars.CF_API_EMAIL=your@email.com`**

#### track
Switches you to the specified branch or tag.
Options: branch
    examples
    (branch): **`vlab track branch=master`**
    (tag): **`vlab track tag=v0.0.1`**

#### check_version
Checks the current version.
Options: none
    example: **`vlab version`**

#### install_cli
Links the vlab cli into /usr/local/bin so you can call vlab without the ./
Options: none
    example: **`./vlab install_cli`**

#### service_edit
Allows the user to make changes to the way a specified service is deployed, without making changes to the core/provided files. See [Getting-Started](Getting-Started) for more information.
Options: debug, service
    example (editing Jellyfin): **`vlab service_edit service=jellyfin`**

#### reboot
Allows the user to reboot the server.
Options: none
    example: **`vlab reboot`**

#### shutdown
Allows the user to shutdown the server.
Options: none
    example: **`vlab shutdown`**

#### find_help
Tells the user where to find help/ contact the VivumLab Community.
Options: none
    example: **`vlab find_help`**

## Service Commands
These are specific to the service declared in the command. These commands should not affect any other service; unless the running of the service depends on another, eg. Authelia.

#### show
Presents the specified services documentation, in the terminal.
Options: service
    example (showing Jellyfin): **`vlab show service=jellyfin`**

#### restart_one
Restarts the specified service
Options: debug, service
    example (restarting Jellyfin): **`vlab restart_one service=jellyfin`**

#### update_one
Updates the specified service on the Vivumlab server.
Options: build, debug, force, service
    example (updating jellyfin): **`vlab update_one service=jellyfin`**

#### stop_one
Restarts the specified service.
Options: build, debug, force, service
    example (stopping Jellyfin): **`vlab stop_one service=jellyfin`**

#### remove_one
Removes the specified service on the Vivumlab server.
Options: build, debug, force, service
    example (removing Jellyfin): **`vlab remove_one service=jellyfin`**

#### reset_one
Resets the specified service' files on the Vivumlab server.
Options: build, debug, force, service
    example (resetting Jellyfin): **`vlab reset_one service=jellyfin`**

## Command Options
These options are available for most commands. See below for further explanations.
NOTE: Setting the option to false (eg. build=false) has the same effect as omitting the option entirely.

#### build
This option allows VivumLab to build the vivumlab docker image, instead of pulling the completed image from docker hub. This is useful if the user wants to make their own changes to the docker image or if the network has lost internet connectivity, temporarily.
    example: **`vlab deploy build=true`**

#### debug
This option allows VivumLab to provide debug output for any ansible commands used. This option has multiple options, depending on verbose the user desires the output to be. There are 3 options in total: super, high, and low. Super is the most verbose, and low is the least verbose; no one option may contain all the required information when debugging, so try all necessary levels.
    example: **`vlab deploy debug=super`**

#### force
This option forces VivumLab to delete, then repull or rebuild (if used with build=true) the vivumlab docker image; force will still work if the image does not exist previously.
    example: **`vlab deploy force=true`**

#### cache
This option allows VivumLab to use any existing cached images/files when building the vivumlab docker image. The cache option will be ignored if the build option is not used.
    example: **`vlab deploy build=true cache=true`**
