---
id: backup
title: VivumLab Backup
hide_title: true
hide_table_of_contents: false
sidebar_label: Backup
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# VivumLab Backups

VivumLab is capable of automatically backing itself up in a smart, incremental, encrypted way to any S3 compatible storage provider, using [Restic](https://restic.net/) and [Minio](https://minio.io/).

This is in addition to and separate from the Backup service included within VivumLab, which backs up your personal computers to the VivumLab servers.

## Get access to an S3 Bucket

Ideally you want your backups to be offsite, so really the best case scenario would be to find a friend also running VivumLab, and trade S3 access with them.

Alternatively, you could pay Amazon and use their S3 service.

## Use your own S3

Backing up to your own infrastructure does not protect your data, especially in the case of server failure or data corruption. However it is still possible to use your own S3 bucket; this may be useful due to Restic's snapshotting. So while this won't give you an offsite backup, it will still provide timed snapshots to access old versions of files.

View your logs for the Minio service (eg. vivumlab_minio_1) and copy the `AccessKey` and `SecretKey` out of the logs.
Run **`vlab decrypt`** to decrypt the vault, and put the keys into under the `s3_access_key` and `s3_secret_key` variables in the decrypted`settings/vault.yml` file.
Now login to your Minio with the same access and secret key values and create a bucket called `restic-backups`.
Finally run **`vlab update`** to copy your new settings up to your VivumLab server.

!!! Note: When self hosting your own S3, its good practice to keep good backups of the S3 data files as well.

## Configure the Backup Service

To configure the backup service, 4 parameters are required; they are:
`s3_path`
`s3_access_key`
`s3_secret_key`
`s3_backup_password` (please generate a strong password)

You can set all these parameters as follows:
**`vlab set s3_path <S3 path>`**
**`vlab set s3_access_key <S3 access key>`**
**`vlab set s3_secret_key <S3 secret key>`**
**`vlab set s3_backup_password <your S3 password>`**

You can also manually set the required S3 parameters in `settings/vault.yml` and `settings/config.yml`
Run **`vlab decrypt`** to decrypt the vault before editing it, and set the respective parameters. Finalize any changes with **`vlab deploy`**

Once these are set, VivumLab will back up all it's core data every night at 4 AM.

## Restoring Backups

To restore your most recent backup, simply run **`vlab restore`**; then proceed with the normal install step of running **`vlab deploy`**.

This should result in a fully working VivumLab setup with the backed up data.

Alternatively you can work directly with the Restic backups through its own 'docker shell' (see below).

Accessing the restic shell, enables you to run commands like `restic snapshots` to list all your snapshots.
To restore (for example) just your NextCloud data, you can run `docker exec restic_restic_1 restic restore latest --include /data/nextcloud --target /data/nextcloud`.

VivumLab strongly suggests that you read the [Restic](https://restic.readthedocs.io/en/latest/) documentation, prior to backing up any files, especially important and irreplacable files.
