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
Opens a shell in the VivumLab deploy container.  <br />
    example: **`./launch`**  <br />
    example dev: **`./launch dev`**  <br />
    example build: **`./launch local`**, after first build **`./launch local start`** (to skip the build)  <br />
NOTE: If you exit out of the docker container you will not be able to run any of the following commands.

# Vivumlab Commands
**`vlab`** will list all available commands.  <br />
**`vlab help COMMAND`** will show help info for the specified command, eg. **`vlab help service`**

## Core Commands:
These commands will check or make changes to the core of VivumLab.  <br />
For service specific commands, scroll down or click [here](#service-commands)

#### deploy
deploys Vivumlab, useful when a server refresh is needed.  <br />
    example: **`vlab deploy`**

#### setup
Set a service up, follow interactive workflow <br />
    examples: **`vlab setup -s jellyfin`** <br />

#### service restart
Restart all enabled services.  <br />
    example: **`vlab service restart`**

#### service stop
Restart all enabled services  <br />
    example: **`vlab service stop`**

#### terraform
Spin up a cloud server with Terraform.  <br />
    example: **`vlab terraform create`**

#### terraform destroy
Destroys servers created by terraform.  <br />
    example: **`vlab terraform destroy`**

#### update
Updates all services on the Vivumlab Server.  <br />
    example: **`vlab update`**

### Developer tools

#### encrypt
Encrypts the vault.  <br />
    example: **`vlab config encrypt --dev`**

#### decrypt
Decrypts the vault  <br />
    example: **`vlab config decrypt --dev`**

#### edit_raw
Decrypts, and opens the config file in nano. Encrypts on save.  <br />
    example: **`vlab config edit_raw`**

#### restore
Restore a server from backups. Assuming backups were running  <br />
    example: **`vlab restore`**

#### launch
Opens a shell on the remote server.  <br />
    example: **`vlab ssh launch`**

#### track
Switches you to the specified branch or tag.  <br />
    examples  <br />
    (branch): **`vlab git track --branch=master`**  <br />
    (tag): **`vlab git track --branch=v0.0.1`**

#### reboot
Allows the user to reboot the server.  <br />
    example: **`vlab server restart`**

#### shutdown
Allows the user to shutdown the server.  <br />
    example: **`vlab server shutdown`**

#### find_help
Tells the user where to find help/ contact the VivumLab Community.  <br />
    example: **`vlab find_help`**

## Service Commands
These are specific to the service declared in the command. These commands should not affect any other service; unless the running of the service depends on another, eg. Authelia.

#### show
Presents the specified services documentation, in the terminal.  <br />
    example (showing Jellyfin): **`vlab service show -s jellyfin`**

#### restart_one
Restarts the specified service  <br />
    example (restarting Jellyfin): **`vlab service restart -s jellyfin`**

#### update_one
Updates the specified service on the Vivumlab server.  <br />
    example (updating jellyfin): **`vlab service update -s jellyfin`**

#### stop_one
Restarts the specified service.  <br />
    example (stopping Jellyfin): **`vlab service stop -s jellyfin`**

#### remove_one
Removes the specified service on the Vivumlab server.  <br />
    example (removing Jellyfin): **`vlab service remove -s jellyfin`**

#### reset_one
Resets the specified service' files on the Vivumlab server.  <br />
    example (resetting Jellyfin): **`vlab service reset -s jellyfin`**
