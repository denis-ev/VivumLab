---
id: airsonic
title: Airsonic
hide_title: true
hide_table_of_contents: false
sidebar_label: Airsonic
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Airsonic

[Airsonic](https://airsonic.github.io/) is a free, web-based media streamer, providing ubiquitous access to your music.

![amd64](https://img.shields.io/badge/{% if not airsonic.amd64 %}untested{% else %}{{ airsonic.amd64 }}{% endif %}-amd64-{% if not airsonic.amd64 %}inactive{% elif airsonic.amd64 == "verified" %}success{% elif airsonic.amd64 == "supported" %}informational{% elif airsonic.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not airsonic.arm64 %}untested{% else %}{{ airsonic.arm64 }}{% endif %}-arm64-{% if not airsonic.arm64 %}inactive{% elif airsonic.arm64 == "verified" %}success{% elif airsonic.arm64 == "supported" %}informational{% elif airsonic.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not airsonic.armv7 %}untested{% else %}{{ airsonic.armv7 }}{% endif %}-armv7-{% if not airsonic.armv7 %}inactive{% elif airsonic.armv7 == "verified" %}success{% elif airsonic.armv7 == "supported" %}informational{% elif airsonic.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** https://hub.docker.com/r/linuxserver/airsonic  
**Current Image Version:** {{ airsonic.version }}

## SETUP

### Enabling Airsonic

#### Command:

**`vlab set airsonic.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=airsonic`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ airsonic.domain }}/admin*

Create an account with your desired username; as this is the first user, Airsonic makes this account the administrator.

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

3. run **`vlab update_one service=airsonic`** to complete the changes

## ACCESS

Airsonic (HTTPS) link: [https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)
Airsonic (HTTP) link: [http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ airsonic.subdomain + "." + tor_domain }}/](http://{{ airsonic.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set airsonic.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set airsonic.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set airsonic.domain airsonic.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  domain: airsonic.com
```

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### SUBDOMAIN
*Default: airsonic* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set airsonic.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### VERSION
*Default: {{  airsonic.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set airsonic.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
airsonic
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
