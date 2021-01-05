---
id: simply-shorten
title: Simply-Shorten
hide_title: true
hide_table_of_contents: false
sidebar_label: Simply-Shorten
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Simply-Shorten

[Simply-Shorten](https://github.com/draganczukp/simply-shorten) A simple selfhosted URL shortener with no name because naming is hard

![amd64](https://img.shields.io/badge/{% if not simply_shorten.amd64 %}untested{% else %}{{ simply_shorten.amd64 }}{% endif %}-amd64-{% if not simply_shorten.amd64 %}inactive{% elif simply_shorten.amd64 == "verified" %}success{% elif simply_shorten.amd64 == "supported" %}informational{% elif simply_shorten.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not simply_shorten.arm64 %}untested{% else %}{{ simply_shorten.arm64 }}{% endif %}-arm64-{% if not simply_shorten.arm64 %}inactive{% elif simply_shorten.arm64 == "verified" %}success{% elif simply_shorten.arm64 == "supported" %}informational{% elif simply_shorten.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not simply_shorten.armv7 %}untested{% else %}{{ simply_shorten.armv7 }}{% endif %}-armv7-{% if not simply_shorten.armv7 %}inactive{% elif simply_shorten.armv7 == "verified" %}success{% elif simply_shorten.armv7 == "supported" %}informational{% elif simply_shorten.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ simply_shorten.version }}

## SETUP

### Enabling simply_shorten

#### Command:

**`vlab set simply_shorten.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ simply_shorten.domain }}/admin*

Create an account with your desired username; as this is the first user, simply_shorten makes this account the administrator.

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

3. run **`vlab update_one service=simply_shorten`** to complete the changes


## ACCESS

simply_shorten (HTTPS) link: [https://{% if simply_shorten.domain %}{{ simply_shorten.domain }}{% else %}{{ simply_shorten.subdomain + "." + domain }}{% endif %}/](https://{% if simply_shorten.domain %}{{ simply_shorten.domain }}{% else %}{{ simply_shorten.subdomain + "." + domain }}{% endif %}/)
simply_shorten (HTTP) link: [http://{% if simply_shorten.domain %}{{ simply_shorten.domain }}{% else %}{{ simply_shorten.subdomain + "." + domain }}{% endif %}/](http://{% if simply_shorten.domain %}{{ simply_shorten.domain }}{% else %}{{ simply_shorten.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ simply_shorten.subdomain + "." + tor_domain }}/](http://{{ simply_shorten.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set simply_shorten.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set simply_shorten.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set simply_shorten.domain simply_shorten.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  domain: simply_shorten.com
```

##### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

### SUBDOMAIN
*Default: simply_shorten* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set simply_shorten.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

### VERSION
*Default: {{  simply_shorten.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set simply_shorten.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
simply_shorten
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=simply_shorten`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
