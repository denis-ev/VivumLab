---
id: mashio
title: Mashio
hide_title: true
hide_table_of_contents: false
sidebar_label: Mashio
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Mashio

[Mashio](https://gitlab.com/NickBusey/mashio) is a home brewery management software.

![amd64](https://img.shields.io/badge/{% if not mashio.amd64 %}untested{% else %}{{ mashio.amd64 }}{% endif %}-amd64-{% if not mashio.amd64 %}inactive{% elif mashio.amd64 == "verified" %}success{% elif mashio.amd64 == "supported" %}informational{% elif mashio.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mashio.arm64 %}untested{% else %}{{ mashio.arm64 }}{% endif %}-arm64-{% if not mashio.arm64 %}inactive{% elif mashio.arm64 == "verified" %}success{% elif mashio.arm64 == "supported" %}informational{% elif mashio.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mashio.armv7 %}untested{% else %}{{ mashio.armv7 }}{% endif %}-armv7-{% if not mashio.armv7 %}inactive{% elif mashio.armv7 == "verified" %}success{% elif mashio.armv7 == "supported" %}informational{% elif mashio.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mashio.version }}

## SETUP

### Enabling mashio

#### Command:

**`vlab set mashio.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mashio`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mashio.domain }}/admin*

Create an account with your desired username; as this is the first user, mashio makes this account the administrator.

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

3. run **`vlab update_one service=mashio`** to complete the changes


## ACCESS

mashio (HTTPS) link: [https://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/](https://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/)
mashio (HTTP) link: [http://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/](http://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ mashio.subdomain + "." + tor_domain }}/](http://{{ mashio.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mashio.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mashio`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mashio.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mashio`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mashio.domain mashio.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  domain: mashio.com
```

##### Finalising changes:

run: **`vlab update_one service=mashio`**

### SUBDOMAIN
*Default: mashio* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mashio.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mashio`**

### VERSION
*Default: {{  mashio.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mashio.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mashio
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mashio`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
