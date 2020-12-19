---
id: emby
title: Emby
hide_title: true
hide_table_of_contents: false
sidebar_label: Emby
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Emby

[Emby](https://emby.media/) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![amd64](https://img.shields.io/badge/{% if not emby.amd64 %}untested{% else %}{{ emby.amd64 }}{% endif %}-amd64-{% if not emby.amd64 %}inactive{% elif emby.amd64 == "verified" %}success{% elif emby.amd64 == "supported" %}informational{% elif emby.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not emby.arm64 %}untested{% else %}{{ emby.arm64 }}{% endif %}-arm64-{% if not emby.arm64 %}inactive{% elif emby.arm64 == "verified" %}success{% elif emby.arm64 == "supported" %}informational{% elif emby.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not emby.armv7 %}untested{% else %}{{ emby.armv7 }}{% endif %}-armv7-{% if not emby.armv7 %}inactive{% elif emby.armv7 == "verified" %}success{% elif emby.armv7 == "supported" %}informational{% elif emby.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ emby.version }}

## SETUP

### Enabling emby

#### Command:

**`vlab set emby.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=emby`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ emby.domain }}/admin*

Create an account with your desired username; as this is the first user, emby makes this account the administrator.

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

3. run **`vlab update_one service=emby`** to complete the changes


## ACCESS

emby (HTTPS) link: [https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/)
emby (HTTP) link: [http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ emby.subdomain + "." + tor_domain }}/](http://{{ emby.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set emby.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set emby.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set emby.domain emby.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  domain: emby.com
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### SUBDOMAIN
*Default: emby* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set emby.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### VERSION
*Default: {{  emby.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set emby.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
