---
id: mayan
title: Mayan
hide_title: true
hide_table_of_contents: false
sidebar_label: Mayan
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Mayan

[Mayan EDMS](https://mayan-edms.com/) Mayan EDMS is a document management system.

![amd64](https://img.shields.io/badge/{% if not mayan.amd64 %}untested{% else %}{{ mayan.amd64 }}{% endif %}-amd64-{% if not mayan.amd64 %}inactive{% elif mayan.amd64 == "verified" %}success{% elif mayan.amd64 == "supported" %}informational{% elif mayan.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mayan.arm64 %}untested{% else %}{{ mayan.arm64 }}{% endif %}-arm64-{% if not mayan.arm64 %}inactive{% elif mayan.arm64 == "verified" %}success{% elif mayan.arm64 == "supported" %}informational{% elif mayan.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mayan.armv7 %}untested{% else %}{{ mayan.armv7 }}{% endif %}-armv7-{% if not mayan.armv7 %}inactive{% elif mayan.armv7 == "verified" %}success{% elif mayan.armv7 == "supported" %}informational{% elif mayan.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mayan.version }}

## SETUP

### Enabling mayan

#### Command:

**`vlab set mayan.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mayan`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### Setting up Watched and Staged folders
1. Change the owner of the watch and staged directories to `www-data`
    > You may or may not need to do this.
    ```
    [client]$ sudo chown www-data path/to/your/watch/dir
    [client]$ sudo chown www-data path/to/your/staged/dir
    ```

2) Go to the Mayan web interface.
    - Go to `System -> settings -> sources`.
    - Click on `actions -> add new watch folder`
    - Fill out the options, for `Folder Path` type "/watched_files"
    - By default, it will scan for new files every 600 seconds (10 minutes), change that to a lower number if you'd like.
    - Save

    - Click on `actions -> add new stagging folder`
    - fill out the options, for `Folder Path` type "/staged_files"
    - Save

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

3. run **`vlab update_one service=mayan`** to complete the changes


## ACCESS

mayan (HTTPS) link: [https://{% if mayan.domain %}{{ mayan.domain }}{% else %}{{ mayan.subdomain + "." + domain }}{% endif %}/](https://{% if mayan.domain %}{{ mayan.domain }}{% else %}{{ mayan.subdomain + "." + domain }}{% endif %}/)
mayan (HTTP) link: [http://{% if mayan.domain %}{{ mayan.domain }}{% else %}{{ mayan.subdomain + "." + domain }}{% endif %}/](http://{% if mayan.domain %}{{ mayan.domain }}{% else %}{{ mayan.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ mayan.subdomain + "." + tor_domain }}/](http://{{ mayan.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mayan.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mayan`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mayan.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mayan`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mayan.domain mayan.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  domain: mayan.com
```

##### Finalising changes:

run: **`vlab update_one service=mayan`**

### SUBDOMAIN
*Default: mayan* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mayan.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mayan`**

### VERSION
*Default: {{  mayan.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mayan.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mayan
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mayan`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
