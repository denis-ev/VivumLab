---
id: storage
title: How VivumLab uses Storage
hide_title: true
hide_table_of_contents: false
sidebar_label: Storage
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# How VivumLab uses Storage

## Understanding storage types and their uses

There are 3 kinds of storage related to Docker and Docker compose. And by extension, VivumLab.

- Ephemeral - This storage disappears when the container is shut down. It's used for things like temporary storage for a containers services.

- Volume - These are mounted by the container and 'map' a physical (host, ubuntu) directory, to a containers internal directory. Volumes are used for persistent storage. For instance, Mysql's DB storage directories are mapped to host folders so that even if the container restarts, the db's storage exists when it restarts. You'll see these referenced in docker-compose.yml files like this:

  ```yml
  volumes:
    - /var/vivumlab/serviceName:/MyFiles
  ```

  This mapping of a volume means that the container, and it's software can access the contents of `/var/vivumlab/serviceName` by accessing it's own `/MyFiles` directory.

- NAS - Network Attached Storage volume(s) - NAS Volumes - are volumes, but they're controlled, in part, by VivumLab. If you enable NAS storage in your config, and provide valid credentials to your NAS, VivumLab will take care of mounting your NAS for you.

## Understanding Collection Auto-Volumes

VivumLab provides a number of services designed to act on, or share, collections of data. For instance, Airsonic is designed to provide you a web interface to your music collection. But Airsonic isn't alone. Jellyfin, Plex and Funkwhale all provide that same access to your music collection. To enable these services to share access to a common collection of media (or documents, etc.) VivumLab creates, and maintains a series of collection folders that are auto-mapped by docker when the service is brought online. VivumLab uses the following Collection Auto-volumes

- Backups
- Books
- Documents
- Downloads
- Music
- Pictures
- temp
- Video

In general, if it makes sense for a VivumLab service to have access to a given collection, you'll find that it's automatically set up for you. For instance, out of the box, Airsonic has access to the Music volume, and Nextcloud has access to the Documents volume.

These folders are maintained by VivumLab inside the directory specified by the `storage_dir` configuration variable.

## Understanding the `storage_dir` config variable

Your settings/config.yml file contains a variable named `storage_dir` that defaults to the directory `/mnt/nas`.

> Despite the name, this folder _does not have to be a NAS Mount_.

If you're not using a NAS, because you've got an external hard drive attached, or an internal raid array you've already mounted that's fine. Just set the `storage_dir` config variable to the directory where you have mounted your storage.

Whenever you enable a service, VivumLab verifies that the storage_dir contains directories that match the collection auto-volumes mentioned above.

Setting up and mounting storage is a complex and potentially destructive task. As such, it is outside the scope of VivumLab to do this; this is the intention of the developers.
!!! Please research, and be careful.

### Migrating storage

At some point, you may need to change where your `storage_dir` points, either because you've run out of space, or moved to a NAS. The following are high-level instructions on _what_ you need to do to migrate your data from one storage asset to another.

1. Run `systemctl stop docker` _on your VivumLab server_ to disable all VivumLab services that might try to read or write to your existing storage directory
2. Mount your new storage somewhere other than `/mnt/nas`.. eg. `/media/newHd`
3. Copy or Move the contents of your `/mnt/nas` directory to the newly mounted directory.
4. Edit your. `settings/config.yml` and change `storage_dir` to point at the newly mounted directory.
5. Run `systemctl start docker` _on your VivumLab server_ to reenable docker
6. Run `vlab update` to re-deploy VivumLab with the new storage_dir set.

## Understanding NAS configuration for VivumLab

Different VivumLab services operate on libraries of media (Airsonic, Plex, and Piwigo as examples). Since these libraries can be large, it makes sense to keep them on another machine with lots of storage.

NAS shares are mounted on the Vivumlab host under `{{ storage_dir }}`, which defaults to `/mnt/nas`. By default, NAS is disabled, and the services that can use it will instead use local folders under `{{ storage_dir }}`.
For example, Emby will map `{{ storage_dir }}/Video/TV` and `{{ storage_dir }}/Video/Movies` into its container, and Paperless will mount `{{ storage_dir }}/Documents`. Check the `docker-compose` files for each service to see what directories are used.

VivumLab has a NAS section in the `settings/config.yml` file. This allows you to specify the connection details and credentials to access your NAS. These details are used _in conjunction with the `storage_dir` variable_ to create and maintain `/etc/fstab` entries.

!!! NOTE: VivumLab is configured to write `/etc/fstab` entries that mount your NAS folders within, _or on top of_ the `storage_dir` directory** Be careful not to mount your NAS folders _over_ existing files in your `storage_dir` or everyone will be very confused.

## NAS Configuration

To configure your NAS, edit the `# NAS Config` section of `settings/config.yml`.

Your NAS options are:

- `nas_enable` to `True` VivumLab will start maintaining the mounting of your NAS for you, if set to `True`, and after you run **`vlab update`**
- `nas_host`: this is the IP or hostname of your NAS server/device. ie: 192.168.1.130
- `nas_mount_type`: your options here are `nfs`, `cifs`, or `smb`. While Ubuntu can mount just about anything, VivumLab only knows how to maintain those three connection types.
- `nas_share_path`: this represents the path to the shared directory on your NAS.
- `nas_user`: username to authenticate with. \*defaults to the value of `default_username`
- `nas_pass`: password to authenticate with.
- `nas_workgroup`: Workgroup needed for some SMB/CIFS shares.

run **`vlab deploy`** when complete, to enable the updated NAS configuration.

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
