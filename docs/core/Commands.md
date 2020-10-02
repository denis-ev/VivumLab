# Vivumlab Commands
**`vlab -t`** will list all available commands.
**`vlab -h COMMAND`** will show help info for the specified command, eg. **`vlab -h config`**

## Core Commands:
These commands will check or make changes to the core of VivumLab.
For service specific commands, scroll down or click [here](#service-commands)

#### create_base
Installs necessary dependencies on the remote server.
    example: **`vlab create_base`**
NOTE: Only run this if the server itself is not set up.
    eg. Python, Git, and other necessary programs aren't installed
NOTE: Availability TBA

#### config
Creates or Updates the config file as necessary
    example: **`vlab config`**

#### config_reset
Resets the Configuration
    example: **`vlab config_reset`**

#### show_config
Shows the configuration settings for the specified service
    example (jellyfin): **`vlab show_config service=jellyfin`**

#### set
Set a configuration variable
    examples:
    (enabling Jellyfin): **`vlab set jellyfin.enable=true`**
    (setup Vivumlab for an Arm Arcitecture) **`vlab set arm=true`**
    (change the default_password): **`vlab set vault.default_password=S0m3C00lP@s$word`**
    (changing the CloudFlare API email) **`vlab set vault.traefik.additional_env_vars.CF_API_EMAIL=your@email.com`**

#### deploy
deploys Vivumlab, useful when a server refresh is needed
    example: **`vlab deploy`**

#### restart
Restart all enabled services
    example: **`vlab restart`**

#### stop
Restart all enabled services
    example: **`vlab stop`**

#### terraform
Spin up a cloud server with Terraform
    example: **`vlab terraform`**

#### terraform_destroy
Destroys servers created by terraform
    example: **`vlab terraform_destroy`**

#### update
Updates all services on the Vivumlab Server
    example: **`vlab update`**

#### build
Builds the Docker Image used to deploy
    example: **`vlab build`**

#### git_sync
Manually forces a settings sync via git
    example: **``**

#### encrypt
Encrypts the vault
    example: **`vlab encrypt`**

#### decrypt
Decrypts the vault
    example: **`vlab decrypt`**

#### uninstall
Uninstalls Vivumlab
    example: **`vlab uninstall`**

#### restore
Restore a server from backups. Assuming backups were running
    example: **``**

#### shell
Opens a shell on the remote server
    example: **`vlab shell`**

#### docker_shell
Opens a shell in the VivumLab deploy container
    example: **`vlab docker_shell`**
NOTE: You will not be able to exit out of the docker container.
NOTE: If you wanted to access outside the container, use the shell command

#### track
Switches you to the specified branch or tag.
    examples
    (branch): **`vlab track branch=master`**
    (tag): **`vlab track tag=0.0.1`**

#### check_version
Checks the current version
    example: **`vlab version`**

#### install_cli
Links the vlab cli into /usr/local/bin so you can call vlab without the ./
    example: **`./vlab install_cli`**

## Service Commands
These are specific to the service declared in the command. These commands should not affect any other service; unless the running of the service depends on another, eg. Authelia.

#### restart_one
Restarts the specified service
    example (restarting Jellyfin): **`vlab restart_one service=jellyfin`**

#### update_one
Updates the specified service on the Vivumlab server
    example (updating jellyfin): **`vlab update_one service=jellyfin`**

#### stop_one
Restarts the specified service
    example (stopping Jellyfin): **`vlab stop_one service=jellyfin`**

#### remove_one
Removes the specified service on the Vivumlab server
    example (removing Jellyfin): **`vlab remove_one service=jellyfin`**

#### reset_one
Resets the specified service' files on the Vivumlab server
    example (resetting Jellyfin): **`vlab reset_one service=jellyfin`**

#### service_edit
Allows the user to make changes to the way a specified service is deployed, without making changes to the core/provided files. See [Next Steps](Next-Step.md) for more information.
    example (editing Jellyfin): **`vlab service_edit service=jellyfin`**
NOTE: Availability TBA
