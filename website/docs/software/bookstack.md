---
id: bookstack
title: Bookstack
hide_title: true
hide_table_of_contents: false
sidebar_label: Bookstack
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Bookstack

[Bookstack](https://www.bookstackapp.com/) Simple & Free Wiki Software

![amd64](https://img.shields.io/badge/{% if not bookstack.amd64 %}untested{% else %}{{ bookstack.amd64 }}{% endif %}-amd64-{% if not bookstack.amd64 %}inactive{% elif bookstack.amd64 == "verified" %}success{% elif bookstack.amd64 == "supported" %}informational{% elif bookstack.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not bookstack.arm64 %}untested{% else %}{{ bookstack.arm64 }}{% endif %}-arm64-{% if not bookstack.arm64 %}inactive{% elif bookstack.arm64 == "verified" %}success{% elif bookstack.arm64 == "supported" %}informational{% elif bookstack.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not bookstack.armv7 %}untested{% else %}{{ bookstack.armv7 }}{% endif %}-armv7-{% if not bookstack.armv7 %}inactive{% elif bookstack.armv7 == "verified" %}success{% elif bookstack.armv7 == "supported" %}informational{% elif bookstack.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ bookstack.version }}

## SETUP

### Enabling bookstack

#### Command:

**`vlab set bookstack.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bookstack`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bookstack.domain }}/admin*

Create an account with your desired username; as this is the first user, bookstack makes this account the administrator.

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

3. run **`vlab update_one service=bookstack`** to complete the changes


## ACCESS

Bookstack (HTTPS) link: [https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)
Bookstack (HTTP) link: [http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bookstack.subdomain + "." + tor_domain }}/](http://{{ bookstack.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bookstack.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bookstack.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bookstack.domain bookstack.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  domain: bookstack.com
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### SUBDOMAIN
*Default: bookstack* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bookstack.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### VERSION
*Default: {{  bookstack.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bookstack.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
