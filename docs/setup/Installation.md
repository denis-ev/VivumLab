# Installation

!!! Warning "Beta Software Warning"

    This software has not reached version 1.0 and should therefore be considered unstable. If you like getting your hands dirty in early versions of software, this is for you; stability is not guaranteed.

    Using this software may render your data unusable; using this software is at your own discretion.

    To ensure the safety of your data, consider:
    - making regular backups
    - testing software without your own data

## Requirements

### Server

- A suitable OS:
    - Ubuntu Server 16 and above
    - Debian 9 and above
    - CentOS 6 and above
    - Raspbery Pi OS 2017-08-16 and above (in theory)
- `sudo` must be available
- [Passwordless SSH via SSH keys](https://linuxconfig.org/passwordless-ssh) working

!!! Warning
    If you are running on an ARM infrastructure such as Raspberry PI, ensure `arm`  is set to 'true' in the config.yml file, on the client computer.

### Client Computer

- Docker (installed and working)

!!! Note:
    The idea is that you deploy from your personal computer to the server. This way your settings are saved on your personal computer, and can be used to re-build the server and restore from backups if anything goes wrong.

### Domain Name

Configure your domains' `A` type DNS record to point at your server's IP address. This is applicable for subdomains as well, eg. `*.test.yourdomain.com` would work.

!!! Note:
    Configuring your domain is (in a sense) optional as:
    - you can use Tor to access your services without registering a domain
    - you can *fake* it by adding DNS overrides to your `/etc/hosts` file on *nix and MacOS if needed

!!! Note: Domains are preferred
    An actual domain is highly recommended, as:
    - service clients may not work through TOR
    - certain services may not work through TOR
    - private DNS services eventually cost more than getting your own domain
    - public DNS services are unreliable
    - public domains tend to be high maintenance

#### DNS Settings

You need to point your `domain` and your `*.domain` (wildcard) to the IP address your VivumLab install is accessible at. If you are using:
- a [bastion](Bastion.md) host; point at the bastion hosts' IP
- your home server; use your home [IP address](https://duckduckgo.com/?q=whats+my+ip)

!!! Note: You need to set up a wildcard DNS entry (*.domain) because all the services are served off of subdomains. i.e. The Plex service defaults to `plex.yourdomain`, and the

!!! Warning
    If you are not using a real domain, but using `/etc/hosts` entries to 'fake' it, wildcard entries will not work in `/etc/hosts`. Instead you will need to create an entry for each service enabled. The `vivumlab_hosts` file (located in the servers' VivumLab root folder), is available to you for this purpose.

#### Changing your domain

It is possible to change your domain:

Using the command line, run:

**`vlab set domain <your.new.domain>`e`**

then run **`vlab deploy`** to finalise the changes

alternatively, you can set the appropriate service settings in `settings/config.yml` to True, and then run **``vlab deploy``**

eg.
```
domain: <your.domain>
```

### Port Forwarding

Ports '80' and '443' will need to be forwarded for VivumLab to work.. This is typically only necessary with infrastructure that you have direct networking control of; the most common scenario here, would be a home server.

!!! Note
    you do not need to deal with port forwarding or firewalls, if you are using a [bastion](Bastion.md) server or [TOR] access(Tor.md)

### [Cloud Bastion Server](bastion.md)

Rather than pointing the domain at your home IP and having to manage DDNS, you can utilize a cloud server
to act as a bastion host via Tinc vpn and nginx.

### S3 Account

S3 is Amazon's Simple Storage Service which VivumLab can optionally use to back up to. You can use Amazon's service, or one of many other S3 compatible providers. You can also back up to another VivumLab instance if that other instance is running Minio, a self-hosted S3 service.

#### But isn't piping bash to curl insecure?

Not really. If you're using https (we are), then you can be sure you're getting the file you expect.

This is also the recommended installation method of:

* [Rust](https://www.rust-lang.org/tools/install)
* [homebrew](https://brew.sh/)
* [RVM](https://rvm.io/rvm/install).
* [Docker](https://get.docker.com/)
* [DockSTARTer](https://dockstarter.com/)

It's pretty standard practice at this point.

If you still don't trust it, great, you'll fit right in here. Proceed to the Manual Set-up step below.

### Manual Set-up

* Download the [latest version](https://github.com/denis-ev/VivumLab/-/releases) to your client computer and extract the folder. From inside the folder run `./vlab install_cli` now you can run `vlab` directly. Otherwise just append `./` to the `vlab` commands listed below.

!!! Note
    If you are using VivumLab to provision a [bastion](Bastion.md) server, run: `$ vlab terraform`

* From inside the VivumLab folder, set up the initial config: `vlab config`

!!! Note
    You will be prompted for the basic information to get started. The passwords entered here will be stored on the client computer and are used by ansible to configure your server. After you enter the information, VivumLab will configure your local docker images and build your initial `settings/` files.

* Once you have updated your settings simply deploy VivumLab with `vlab deploy`. You can run `vlab deploy` as many times as needed to get your settings correct.

You can check http://{{ vivumlab_ip }}:8181 in a browser to see the Traefik dashboard.

See a full list of commands in the [Getting Started Section](Getting-Started.md)

## Enabling Services

Run `vlab set SERVICENAME.enable true` where SERVICENAME is the name of the service you want to enable.

!!! example
    `vlab set miniflux.enable true`

Then run `vlab deploy` again. That's it. It will take a few minutes for your server to download and start the relevant images.


!!! warning
    Some services expose set up pages on start up. If you don't complete the set up step, there is a chance someone else could beat you to it. If they do just run `vlab reset_one SERVICENAME` then `vlab deploy` again and the service will reset to it's freshly installed state.

You can SSH into the server, and run `systemctl status SERVICENAME` where SERVICENAME is the name of the server you want to check  is running. It will show you status and/or errors of the service.

!!! example
    `systemctl status miniflux`

## Syncing Settings via Git

VivumLab will automatically keep the `settings/` folder in sync with a git repo if it has one.
So you can create a private repo on your Gitea instance for example, then clone that repo over the
settings folder. Now any changes you make to `settings/` files will be commited and pushed to that git
repo whenever you run `vlab deploy`, `vlab update` or `vlab config`.

## Backing up your Vault Password

!!! danger
    This bit is important.

If you installed with the Automatic/One-Liner install, your vault password exists at `~/.vlab_vault_pass` for the user you ran the script as. Make sure to back this password up somewhere safe, and ideally _not_ in your `settings/` folder. If someone gains access to your `settings/` folder and the vault password, bad things can happen. Store them separately.

## [Troubleshooting / FAQ](FAQ-Troubleshoot.md)

## Network Configuration

It is recommended to register an actual domain to point at your Vivumlab, but if you can't or would prefer not to, you can use VivumLab fully inside your network. Simply make up a domain that ends in `.local` and enter that as your domain in `host_vars/myserver`.

When VivumLab `vlab deploy` command completes, it creates a file on the server at `{{ volumes_root }}/vivumlab_hosts`. You can take the contents of this file and create local DNS overrides using it. All your requests should complete as expected.

## NAS Network Attached Storage Configuration

Different VivumLab services operate on libraries of media (Airsonic, Plex, and Piwigo as examples). Since these libraries can be large, it makes sense to keep them on another machine with lots of storage.

NAS shares are mounted on the VivumLab host under `{{ storage_dir }}`, which defaults to `/mnt/nas`. By default, NAS is disabled, and the services that can use it will instead use local folders under `{{ storage_dir }}`.

For example, [Emby](../software/emby.md) will map `{{ storage_dir }}/TV` and `{{ storage_dir }}/Movies` into its container, and [Paperless](../software/paperless.md) will mount `{{ storage_dir }}/Documents`. Check the `docker-compose` files for each service to see what directories are used.

To configure your NAS, edit the `# NAS Config` section of `settings/config.yml`.

1. Enable NAS by setting `nas_enable: True`
2. Set `nas_host` to the hostname, FQDN, or IP address of your NAS.
3. Choose your network share type (`nfs` or `smb`) and set `nas_share_type` to that value.
4. Set your `nas_share_path`, if applicable. SMB shares will probably not have a value for this, but NFS will.
5. If authenticating to access SMB shares, set your username and password in `nas_user` and `nas_path`.
6. Set your Windows domain in `nas_workgroup`, if applicable.

Re-run `vlab deploy` to configure and enable your NAS.

??? example "Example [unRAID](https://unraid.net) configuration"
    ```
    nas_enable: True
    nas_host: unraid.mydomain.com
    nas_mount_type: nfs
    nas_share_path: /mnt/user
    nas_user:
    nas_pass:
    nas_workgroup:
    ```

??? example "Example SMB configuration"
    ```
    nas_enable: True
    nas_host: 192.168.1.12
    nas_mount_type: smb
    nas_share_path: vivumlab
    nas_user: user
    nas_pass: 12345
    nas_workgroup: WORKGROUP
    ```
