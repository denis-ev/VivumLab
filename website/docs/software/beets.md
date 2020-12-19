---
id: beets
title: Beets
hide_title: true
hide_table_of_contents: false
sidebar_label: Beets
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Beets

[Beets](https://beets.io) Beets is the media library management system for obsessive-compulsive music geeks.

![amd64](https://img.shields.io/badge/{% if not beets.amd64 %}untested{% else %}{{ beets.amd64 }}{% endif %}-amd64-{% if not beets.amd64 %}inactive{% elif beets.amd64 == "verified" %}success{% elif beets.amd64 == "supported" %}informational{% elif beets.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not beets.arm64 %}untested{% else %}{{ beets.arm64 }}{% endif %}-arm64-{% if not beets.arm64 %}inactive{% elif beets.arm64 == "verified" %}success{% elif beets.arm64 == "supported" %}informational{% elif beets.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not beets.armv7 %}untested{% else %}{{ beets.armv7 }}{% endif %}-armv7-{% if not beets.armv7 %}inactive{% elif beets.armv7 == "verified" %}success{% elif beets.armv7 == "supported" %}informational{% elif beets.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ beets.version }}

## SETUP

### Enabling beets

#### Command:

**`vlab set beets.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=beets`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ beets.domain }}/admin*

Create an account with your desired username; as this is the first user, beets makes this account the administrator.

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

3. run **`vlab update_one service=beets`** to complete the changes


## ACCESS

Beets (HTTPS) link: [https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)
Beets (HTTP) link: [http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ beets.subdomain + "." + tor_domain }}/](http://{{ beets.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set beets.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set beets.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set beets.domain beets.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  domain: beets.com
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### SUBDOMAIN
*Default: beets* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set beets.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### VERSION
*Default: {{  beets.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set beets.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
