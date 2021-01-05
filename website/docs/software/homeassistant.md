---
id: homeassistant
title: Home Assistant
hide_title: true
hide_table_of_contents: false
sidebar_label: Home Assistant
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Home Assistant

[Home Assistant](https://www.home-assistant.io/) can automate just about any part of your home.

![amd64](https://img.shields.io/badge/{% if not homeassistant.amd64 %}untested{% else %}{{ homeassistant.amd64 }}{% endif %}-amd64-{% if not homeassistant.amd64 %}inactive{% elif homeassistant.amd64 == "verified" %}success{% elif homeassistant.amd64 == "supported" %}informational{% elif homeassistant.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not homeassistant.arm64 %}untested{% else %}{{ homeassistant.arm64 }}{% endif %}-arm64-{% if not homeassistant.arm64 %}inactive{% elif homeassistant.arm64 == "verified" %}success{% elif homeassistant.arm64 == "supported" %}informational{% elif homeassistant.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not homeassistant.armv7 %}untested{% else %}{{ homeassistant.armv7 }}{% endif %}-armv7-{% if not homeassistant.armv7 %}inactive{% elif homeassistant.armv7 == "verified" %}success{% elif homeassistant.armv7 == "supported" %}informational{% elif homeassistant.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ homeassistant.version }}

## SETUP

### Enabling homeassistant

#### Command:

**`vlab set homeassistant.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homeassistant`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homeassistant.domain }}/admin*

Create an account with your desired username; as this is the first user, homeassistant makes this account the administrator.

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

3. run **`vlab update_one service=homeassistant`** to complete the changes


## ACCESS

homeassistant (HTTPS) link: [https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)
homeassistant (HTTP) link: [http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homeassistant.subdomain + "." + tor_domain }}/](http://{{ homeassistant.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homeassistant.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homeassistant.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homeassistant.domain homeassistant.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  domain: homeassistant.com
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### SUBDOMAIN
*Default: homeassistant* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homeassistant.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### VERSION
*Default: {{  homeassistant.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homeassistant.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
