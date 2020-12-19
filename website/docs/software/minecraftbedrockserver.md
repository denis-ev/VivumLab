---
id: minecraftbedrockserver
title: Minecraft Bedrock Server
hide_title: true
hide_table_of_contents: false
sidebar_label: Minecraft Bedrock Server
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Minecraft Bedrock Server

[MinecraftBedrockServer](https://www.minecraft.net/en-us/download/server/bedrock/) Minecraft Bedrock Server

![amd64](https://img.shields.io/badge/{% if not minecraftbedrockserver.amd64 %}untested{% else %}{{ minecraftbedrockserver.amd64 }}{% endif %}-amd64-{% if not minecraftbedrockserver.amd64 %}inactive{% elif minecraftbedrockserver.amd64 == "verified" %}success{% elif minecraftbedrockserver.amd64 == "supported" %}informational{% elif minecraftbedrockserver.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not minecraftbedrockserver.arm64 %}untested{% else %}{{ minecraftbedrockserver.arm64 }}{% endif %}-arm64-{% if not minecraftbedrockserver.arm64 %}inactive{% elif minecraftbedrockserver.arm64 == "verified" %}success{% elif minecraftbedrockserver.arm64 == "supported" %}informational{% elif minecraftbedrockserver.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not minecraftbedrockserver.armv7 %}untested{% else %}{{ minecraftbedrockserver.armv7 }}{% endif %}-armv7-{% if not minecraftbedrockserver.armv7 %}inactive{% elif minecraftbedrockserver.armv7 == "verified" %}success{% elif minecraftbedrockserver.armv7 == "supported" %}informational{% elif minecraftbedrockserver.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ minecraftbedrockserver.version }}

## SETUP

### Enabling minecraftbedrockserver

#### Command:

**`vlab set minecraftbedrockserver.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ minecraftbedrockserver.domain }}/admin*

Create an account with your desired username; as this is the first user, minecraftbedrockserver makes this account the administrator.

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

3. run **`vlab update_one service=minecraftbedrockserver`** to complete the changes


## ACCESS

minecraftbedrockserver (HTTPS) link: [https://{% if minecraftbedrockserver.domain %}{{ minecraftbedrockserver.domain }}{% else %}{{ minecraftbedrockserver.subdomain + "." + domain }}{% endif %}/](https://{% if minecraftbedrockserver.domain %}{{ minecraftbedrockserver.domain }}{% else %}{{ minecraftbedrockserver.subdomain + "." + domain }}{% endif %}/)
minecraftbedrockserver (HTTP) link: [http://{% if minecraftbedrockserver.domain %}{{ minecraftbedrockserver.domain }}{% else %}{{ minecraftbedrockserver.subdomain + "." + domain }}{% endif %}/](http://{% if minecraftbedrockserver.domain %}{{ minecraftbedrockserver.domain }}{% else %}{{ minecraftbedrockserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ minecraftbedrockserver.subdomain + "." + tor_domain }}/](http://{{ minecraftbedrockserver.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minecraftbedrockserver.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minecraftbedrockserver.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set minecraftbedrockserver.domain minecraftbedrockserver.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  domain: minecraftbedrockserver.com
```

##### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

### SUBDOMAIN
*Default: minecraftbedrockserver* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set minecraftbedrockserver.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

### VERSION
*Default: {{  minecraftbedrockserver.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set minecraftbedrockserver.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minecraftbedrockserver
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=minecraftbedrockserver`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
