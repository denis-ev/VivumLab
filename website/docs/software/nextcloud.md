---
id: nextcloud
title: NextCloud
hide_title: true
hide_table_of_contents: false
sidebar_label: NextCloud
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# NextCloud

[NextCloud](https://nextcloud.com/) is your Dropbox / Google Calendar replacement.

![amd64](https://img.shields.io/badge/{% if not nextcloud.amd64 %}untested{% else %}{{ nextcloud.amd64 }}{% endif %}-amd64-{% if not nextcloud.amd64 %}inactive{% elif nextcloud.amd64 == "verified" %}success{% elif nextcloud.amd64 == "supported" %}informational{% elif nextcloud.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not nextcloud.arm64 %}untested{% else %}{{ nextcloud.arm64 }}{% endif %}-arm64-{% if not nextcloud.arm64 %}inactive{% elif nextcloud.arm64 == "verified" %}success{% elif nextcloud.arm64 == "supported" %}informational{% elif nextcloud.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not nextcloud.armv7 %}untested{% else %}{{ nextcloud.armv7 }}{% endif %}-armv7-{% if not nextcloud.armv7 %}inactive{% elif nextcloud.armv7 == "verified" %}success{% elif nextcloud.armv7 == "supported" %}informational{% elif nextcloud.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ nextcloud.version }}

## SETUP

### Enabling nextcloud

#### Command:

**`vlab set nextcloud.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=nextcloud`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### About

Nextcloud can be a beast to setup. Therefore, VivumLab does as much as it can to provide intelligent defaults, and common configuration settings out of the box.

Specifically, VivumLab configures Nextcloud in the following ways:
* Postgres as the default database server
* Redis for caching
* Nextcloud 18, served by Apache
* Docker is set to run the main Nextcloud container as the same Uid/Gid that mounts your NAS. (or your non-root server-user's UID/GID)
* 'App Store' Access is enabled
* Default Username is pulled from your config/vault yaml file
* Default Password is pulled from your config/vault yaml file
* Mounts/Volumes - these are all configured to persist across container restarts.
  - {{ volumes_root }}/nextcloud/apps - host accessible volume containing self-installed apps.
  - {{ volumes_root }}/nextcloud/config - host accessible volume containing configuration.
    - when necessary, users can directly edit the config.php file - for instance, to fix the login-loop bug with mobile apps.
  - {{ volumes_root }}/nextcloud/themes - host accessible volume containing custom theme files.
  - {{ volumes_root }}/nextcloud/webroot - host accessible volume containing the actuall nextcloud php files, and user-data root folders.
  - {{ storage_dir }}/ - mounted internally as /mnt/vivumlab

### Configuration Notes

!!! Warning "Use https_only"
    After you enable Nextcloud, it is recommended to set force https_only on the Nextcloud service to true. However, if you're using the http provisioning system for LetsEncrypt, you'll need to wait to enable https_only until the cert has been generated.

!!! Note "Auto installation takes a few minutes"
    Once make has finished running, it will take a few minutes - depending on your servers' hardware capabilities - to finish setting up Nextcloud. VivumLab pre-configures:
    * Database
    * Default User & Password - check your config and vault files for details on what these are set to.

### Post Installation Configuration

Nextcloud, as an application, is *designed* to silo users' data apart from one-another. (this is a good thing). However, this causes issues when you want to allow users to access a common data store - like a NAS. To facilitate this, VivumLab mounts your hosts' {{storage_dir}} in the container as the /mnt/vivumlab folder. Once you've installed and configured Nextcloud, you'll need to take the following steps to make your {{storage_dir}} available to users:

1. Launch settings, and select Apps.
2. Select 'disabled' apps
3. Click the enable button next to 'External Storage Support'
4. _*Logout*_ - Do not skip this step.
5. *Login* and navigate to Settings -> External Storage (*Under Administration*)
6. Add a new External Storage with the following configuration
  - Folder Name: VivumLab
  - External Storage: Local
  - Authentication: None
  - Configuration: /mnt/vivumlab
7. Click the check icon.
8. Profit!

After completing these steps, your Users will see a VivumLab folder under files. More advanced users can probably re-map the default file locations for pictures etc. to be under the VivumLab folder.

### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file
2. make some changes


#### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=nextcloud`** to complete the changes


## ACCESS

nextcloud (HTTPS) link: [https://{% if nextcloud.domain %}{{ nextcloud.domain }}{% else %}{{ nextcloud.subdomain + "." + domain }}{% endif %}/](https://{% if nextcloud.domain %}{{ nextcloud.domain }}{% else %}{{ nextcloud.subdomain + "." + domain }}{% endif %}/)
nextcloud (HTTP) link: [http://{% if nextcloud.domain %}{{ nextcloud.domain }}{% else %}{{ nextcloud.subdomain + "." + domain }}{% endif %}/](http://{% if nextcloud.domain %}{{ nextcloud.domain }}{% else %}{{ nextcloud.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ nextcloud.subdomain + "." + tor_domain }}/](http://{{ nextcloud.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set nextcloud.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=nextcloud`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set nextcloud.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=nextcloud`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set nextcloud.domain nextcloud.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  domain: nextcloud.com
```

##### Finalising changes:

run: **`vlab update_one service=nextcloud`**

### SUBDOMAIN
*Default: nextcloud* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set nextcloud.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=nextcloud`**

### VERSION
*Default: {{  nextcloud.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set nextcloud.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nextcloud
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=nextcloud`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
