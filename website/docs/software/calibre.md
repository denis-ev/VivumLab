---
id: calibre
title: Calibre
hide_title: true
hide_table_of_contents: false
sidebar_label: Calibre
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Calibre

[Calibre](https://calibre-ebook.com) Ebook management system.

[Calibre Web](https://github.com/janeczku/calibre-web) Web app for accessing ebook library

![amd64](https://img.shields.io/badge/{% if not calibre.amd64 %}untested{% else %}{{ calibre.amd64 }}{% endif %}-amd64-{% if not calibre.amd64 %}inactive{% elif calibre.amd64 == "verified" %}success{% elif calibre.amd64 == "supported" %}informational{% elif calibre.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not calibre.arm64 %}untested{% else %}{{ calibre.arm64 }}{% endif %}-arm64-{% if not calibre.arm64 %}inactive{% elif calibre.arm64 == "verified" %}success{% elif calibre.arm64 == "supported" %}informational{% elif calibre.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not calibre.armv7 %}untested{% else %}{{ calibre.armv7 }}{% endif %}-armv7-{% if not calibre.armv7 %}inactive{% elif calibre.armv7 == "verified" %}success{% elif calibre.armv7 == "supported" %}informational{% elif calibre.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ calibre.version }}

## SETUP

### Enabling calibre

#### Command:

**`vlab set calibre.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=calibre`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ calibre.domain }}/admin*

Create an account with your desired username; as this is the first user, calibre makes this account the administrator.

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

3. run **`vlab update_one service=calibre`** to complete the changes


## ACCESS

Calibre (HTTPS) link: [https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)
Calibre (HTTP) link: [http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ calibre.subdomain + "." + tor_domain }}/](http://{{ calibre.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set calibre.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set calibre.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set calibre.domain calibre.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  domain: calibre.com
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### SUBDOMAIN
*Default: calibre* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set calibre.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### VERSION
*Default: {{  calibre.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set calibre.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
