---
id: homebridge
title: HomeBridge
hide_title: true
hide_table_of_contents: false
sidebar_label: HomeBridge
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# HomeBridge

[HomeBridge](https://homebridge.io/) HomeKit support for the impatient

![amd64](https://img.shields.io/badge/{% if not homebridge.amd64 %}untested{% else %}{{ homebridge.amd64 }}{% endif %}-amd64-{% if not homebridge.amd64 %}inactive{% elif homebridge.amd64 == "verified" %}success{% elif homebridge.amd64 == "supported" %}informational{% elif homebridge.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not homebridge.arm64 %}untested{% else %}{{ homebridge.arm64 }}{% endif %}-arm64-{% if not homebridge.arm64 %}inactive{% elif homebridge.arm64 == "verified" %}success{% elif homebridge.arm64 == "supported" %}informational{% elif homebridge.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not homebridge.armv7 %}untested{% else %}{{ homebridge.armv7 }}{% endif %}-armv7-{% if not homebridge.armv7 %}inactive{% elif homebridge.armv7 == "verified" %}success{% elif homebridge.armv7 == "supported" %}informational{% elif homebridge.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ homebridge.version }}

## SETUP

### Enabling homebridge

#### Command:

**`vlab set homebridge.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homebridge`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homebridge.domain }}/admin*

Create an account with your desired username; as this is the first user, homebridge makes this account the administrator.

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

3. run **`vlab update_one service=homebridge`** to complete the changes


## ACCESS

homebridge (HTTPS) link: [https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/)
homebridge (HTTP) link: [http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homebridge.subdomain + "." + tor_domain }}/](http://{{ homebridge.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homebridge.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homebridge.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homebridge.domain homebridge.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  domain: homebridge.com
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### SUBDOMAIN
*Default: homebridge* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homebridge.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### VERSION
*Default: {{  homebridge.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homebridge.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
