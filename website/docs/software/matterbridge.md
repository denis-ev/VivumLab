---
id: matterbridge
title: Matterbridge
hide_title: true
hide_table_of_contents: false
sidebar_label: Matterbridge
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Matterbridge

[matterbridge](https://github.com/42wim/matterbridge) A program that allows users to link multiple chat platforms.

![amd64](https://img.shields.io/badge/{% if not matterbridge.amd64 %}untested{% else %}{{ matterbridge.amd64 }}{% endif %}-amd64-{% if not matterbridge.amd64 %}inactive{% elif matterbridge.amd64 == "verified" %}success{% elif matterbridge.amd64 == "supported" %}informational{% elif matterbridge.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not matterbridge.arm64 %}untested{% else %}{{ matterbridge.arm64 }}{% endif %}-arm64-{% if not matterbridge.arm64 %}inactive{% elif matterbridge.arm64 == "verified" %}success{% elif matterbridge.arm64 == "supported" %}informational{% elif matterbridge.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not matterbridge.armv7 %}untested{% else %}{{ matterbridge.armv7 }}{% endif %}-armv7-{% if not matterbridge.armv7 %}inactive{% elif matterbridge.armv7 == "verified" %}success{% elif matterbridge.armv7 == "supported" %}informational{% elif matterbridge.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ matterbridge.version }}

## SETUP

### Enabling matterbridge

#### Command:

**`vlab set matterbridge.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matterbridge
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=matterbridge`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Create an account with your desired username; as this is the first user, matterbridge makes this account the administrator.

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

3. run **`vlab update_one service=matterbridge`** to complete the changes


## Access

Edit the matterbridge.toml file according to the instructions at:
[Matterbridge how-to](https://github.com/42wim/matterbridge/wiki/How-to-create-your-config)

## OPTIONS

### VERSION
*Default: {{ matterbridge.version   }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set matterbridge.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matterbridge
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=matterbridge`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
