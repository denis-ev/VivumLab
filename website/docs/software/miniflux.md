---
id: miniflux
title: Miniflux
hide_title: true
hide_table_of_contents: false
sidebar_label: Miniflux
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Miniflux

[Miniflux](https://miniflux.app/) is a minimalist and opinionated feed reader.

![amd64](https://img.shields.io/badge/{% if not miniflux.amd64 %}untested{% else %}{{ miniflux.amd64 }}{% endif %}-amd64-{% if not miniflux.amd64 %}inactive{% elif miniflux.amd64 == "verified" %}success{% elif miniflux.amd64 == "supported" %}informational{% elif miniflux.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not miniflux.arm64 %}untested{% else %}{{ miniflux.arm64 }}{% endif %}-arm64-{% if not miniflux.arm64 %}inactive{% elif miniflux.arm64 == "verified" %}success{% elif miniflux.arm64 == "supported" %}informational{% elif miniflux.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not miniflux.armv7 %}untested{% else %}{{ miniflux.armv7 }}{% endif %}-armv7-{% if not miniflux.armv7 %}inactive{% elif miniflux.armv7 == "verified" %}success{% elif miniflux.armv7 == "supported" %}informational{% elif miniflux.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ miniflux.version }}

## SETUP

### Enabling miniflux

#### Command:

**`vlab set miniflux.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=miniflux`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ miniflux.domain }}/admin*

Create an account with your desired username; as this is the first user, miniflux makes this account the administrator.

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

3. run **`vlab update_one service=miniflux`** to complete the changes


## ACCESS

miniflux (HTTPS) link: [https://{% if miniflux.domain %}{{ miniflux.domain }}{% else %}{{ miniflux.subdomain + "." + domain }}{% endif %}/](https://{% if miniflux.domain %}{{ miniflux.domain }}{% else %}{{ miniflux.subdomain + "." + domain }}{% endif %}/)
miniflux (HTTP) link: [http://{% if miniflux.domain %}{{ miniflux.domain }}{% else %}{{ miniflux.subdomain + "." + domain }}{% endif %}/](http://{% if miniflux.domain %}{{ miniflux.domain }}{% else %}{{ miniflux.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ miniflux.subdomain + "." + tor_domain }}/](http://{{ miniflux.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set miniflux.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=miniflux`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set miniflux.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=miniflux`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set miniflux.domain miniflux.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  domain: miniflux.com
```

##### Finalising changes:

run: **`vlab update_one service=miniflux`**

### SUBDOMAIN
*Default: miniflux* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set miniflux.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=miniflux`**

### VERSION
*Default: {{  miniflux.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set miniflux.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
miniflux
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=miniflux`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
