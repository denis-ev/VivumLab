---
id: minecraft
title: Minecraft
hide_title: true
hide_table_of_contents: false
sidebar_label: Minecraft
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Minecraft

[Minecraft](https://hub.docker.com/r/itzg/minecraft-server) Minecraft server with select-able version

![amd64](https://img.shields.io/badge/{% if not minecraft.amd64 %}untested{% else %}{{ minecraft.amd64 }}{% endif %}-amd64-{% if not minecraft.amd64 %}inactive{% elif minecraft.amd64 == "verified" %}success{% elif minecraft.amd64 == "supported" %}informational{% elif minecraft.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not minecraft.arm64 %}untested{% else %}{{ minecraft.arm64 }}{% endif %}-arm64-{% if not minecraft.arm64 %}inactive{% elif minecraft.arm64 == "verified" %}success{% elif minecraft.arm64 == "supported" %}informational{% elif minecraft.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not minecraft.armv7 %}untested{% else %}{{ minecraft.armv7 }}{% endif %}-armv7-{% if not minecraft.armv7 %}inactive{% elif minecraft.armv7 == "verified" %}success{% elif minecraft.armv7 == "supported" %}informational{% elif minecraft.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ minecraft.version }}

## SETUP

### Enabling minecraft

#### Command:

**`vlab set minecraft.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=minecraft`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ minecraft.domain }}/admin*

Create an account with your desired username; as this is the first user, minecraft makes this account the administrator.

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

3. run **`vlab update_one service=minecraft`** to complete the changes


## Access

It is available at {% if minecraft.domain %}{{ minecraft.domain }}{% else %}{{ minecraft.subdomain + "." + domain }}{% endif %}:25565

{% if enable_tor %}
It is also available via Tor at {{ minecraft.subdomain + "." + tor_domain }}:25565
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minecraft.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=minecraft`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minecraft.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=minecraft`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set minecraft.domain minecraft.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  domain: minecraft.com
```

##### Finalising changes:

run: **`vlab update_one service=minecraft`**

### SUBDOMAIN
*Default: minecraft* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set minecraft.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=minecraft`**

### VERSION
*Default: {{  minecraft.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set minecraft.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraft
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=minecraft`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
