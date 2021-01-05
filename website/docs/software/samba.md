---
id: samba
title: Samba
hide_title: true
hide_table_of_contents: false
sidebar_label: Samba
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Samba

[Samba](https://download.samba.org/pub/samba/stable/) Export your VLAB storage_dirs as CIFS/SMB file shares - Uses the dperson/samba image.

![amd64](https://img.shields.io/badge/{% if not samba.amd64 %}untested{% else %}{{ samba.amd64 }}{% endif %}-amd64-{% if not samba.amd64 %}inactive{% elif samba.amd64 == "verified" %}success{% elif samba.amd64 == "supported" %}informational{% elif samba.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not samba.arm64 %}untested{% else %}{{ samba.arm64 }}{% endif %}-arm64-{% if not samba.arm64 %}inactive{% elif samba.arm64 == "verified" %}success{% elif samba.arm64 == "supported" %}informational{% elif samba.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not samba.armv7 %}untested{% else %}{{ samba.armv7 }}{% endif %}-armv7-{% if not samba.armv7 %}inactive{% elif samba.armv7 == "verified" %}success{% elif samba.armv7 == "supported" %}informational{% elif samba.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ samba.version }}

## SETUP

### Enabling samba

#### Command:

**`vlab set samba.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=samba`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Create an account with your desired username; as this is the first user, samba makes this account the administrator.

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

3. run **`vlab update_one service=samba`** to complete the changes


## Access

This container exposes your {{storage_dir}}/\* folders as a SMB/CIFS (Windows file sharing) network share.

You can connect to it using windows, linux and mac via

```
smb://{{default_username}}@{{vlab_ip}}/VivumLab
```

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set samba.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=samba`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set samba.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=samba`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set samba.domain samba.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  domain: samba.com
```

##### Finalising changes:

run: **`vlab update_one service=samba`**

### SUBDOMAIN
*Default: samba* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set samba.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=samba`**

### VERSION
*Default: {{  samba.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set samba.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
samba
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=samba`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
