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

# First step
Opens a shell in the VivumLab deploy container.
    example: **`./launch`**
    example dev: **`./launch dev`**
    example build: **`./launch local`**, after first build **`./launch local start`** (to skip the build)
NOTE: If you exit out of the docker container you will not be able to run any of the following commands.

# Vivumlab Commands
**`vlab`** will list all available commands.
**`vlab help COMMAND`** will show help info for the specified command, eg. **`vlab help service`**

## Core Commands:
These commands will check or make changes to the core of VivumLab.
For service specific commands, scroll down or click [here](#service-commands)

#### deploy
deploys Vivumlab, useful when a server refresh is needed.
    example: **`vlab deploy`**

#### service restart
Restart all enabled services.
    example: **`vlab service restart`**

#### service stop
Restart all enabled services
    example: **`vlab service stop`**

#### terraform
Spin up a cloud server with Terraform.
    example: **`vlab terraform create`**

#### terraform destroy
Destroys servers created by terraform.
    example: **`vlab terraform destroy`**

#### update
Updates all services on the Vivumlab Server.
    example: **`vlab update`**

### Developer tools

#### encrypt
Encrypts the vault.
    example: **`vlab config encrypt --dev`**

#### decrypt
Decrypts the vault
    example: **`vlab config decrypt --dev`**

#### edit_raw
Decrypts, and opens the config file in nano. Encrypts on save.
    example: **`vlab config edit_raw`**

#### restore
Restore a server from backups. Assuming backups were running
    example: **`vlab restore`**

#### launch
Opens a shell on the remote server.
    example: **`vlab ssh launch`**

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
    (branch): **`vlab git track --branch=master`**
    (tag): **`vlab git track --branch=v0.0.1`**

#### reboot
Allows the user to reboot the server.
Options: none
    example: **`vlab server restart`**

#### shutdown
Allows the user to shutdown the server.
Options: none
    example: **`vlab server shutdown`**

#### find_help
Tells the user where to find help/ contact the VivumLab Community.
Options: none
    example: **`vlab find_help`**

## Service Commands
These are specific to the service declared in the command. These commands should not affect any other service; unless the running of the service depends on another, eg. Authelia.

#### show
Presents the specified services documentation, in the terminal.
Options: service
    example (showing Jellyfin): **`vlab service show -s jellyfin`**

#### restart_one
Restarts the specified service
Options: debug, service
    example (restarting Jellyfin): **`vlab service restart -s jellyfin`**

#### update_one
Updates the specified service on the Vivumlab server.
Options: build, debug, force, service
    example (updating jellyfin): **`vlab service update -s jellyfin`**

#### stop_one
Restarts the specified service.
Options: build, debug, force, service
    example (stopping Jellyfin): **`vlab service stop -s jellyfin`**

#### remove_one
Removes the specified service on the Vivumlab server.
Options: build, debug, force, service
    example (removing Jellyfin): **`vlab service remove -s jellyfin`**

#### reset_one
Resets the specified service' files on the Vivumlab server.
Options: build, debug, force, service
    example (resetting Jellyfin): **`vlab service reset -s jellyfin`**
