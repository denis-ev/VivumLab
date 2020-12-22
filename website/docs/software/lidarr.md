---
id: lidarr
title: Lidarr
hide_title: true
hide_table_of_contents: false
sidebar_label: Lidarr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Lidarr

[Lidarr](https://lidarr.audio/) Sonarr but for Music.

![amd64](https://img.shields.io/badge/{% if not lidarr.amd64 %}untested{% else %}{{ lidarr.amd64 }}{% endif %}-amd64-{% if not lidarr.amd64 %}inactive{% elif lidarr.amd64 == "verified" %}success{% elif lidarr.amd64 == "supported" %}informational{% elif lidarr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not lidarr.arm64 %}untested{% else %}{{ lidarr.arm64 }}{% endif %}-arm64-{% if not lidarr.arm64 %}inactive{% elif lidarr.arm64 == "verified" %}success{% elif lidarr.arm64 == "supported" %}informational{% elif lidarr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not lidarr.armv7 %}untested{% else %}{{ lidarr.armv7 }}{% endif %}-armv7-{% if not lidarr.armv7 %}inactive{% elif lidarr.armv7 == "verified" %}success{% elif lidarr.armv7 == "supported" %}informational{% elif lidarr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ lidarr.version }}

## SETUP

### Enabling lidarr

#### Command:

**`vlab set lidarr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lidarr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ lidarr.domain }}/admin*

Create an account with your desired username; as this is the first user, lidarr makes this account the administrator.

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

3. run **`vlab update_one service=lidarr`** to complete the changes


## ACCESS

lidarr (HTTPS) link: [https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/)
lidarr (HTTP) link: [http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lidarr.subdomain + "." + tor_domain }}/](http://{{ lidarr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lidarr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lidarr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lidarr.domain lidarr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  domain: lidarr.com
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### SUBDOMAIN
*Default: lidarr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lidarr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### VERSION
*Default: {{  lidarr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lidarr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
