---
id: sickchill
title: SickChill
hide_title: true
hide_table_of_contents: false
sidebar_label: SickChill
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# SickChill

[SickChill](https://sickchill.github.io/) SickChill is an automatic Video Library Manager for TV Shows.

![amd64](https://img.shields.io/badge/{% if not sickchill.amd64 %}untested{% else %}{{ sickchill.amd64 }}{% endif %}-amd64-{% if not sickchill.amd64 %}inactive{% elif sickchill.amd64 == "verified" %}success{% elif sickchill.amd64 == "supported" %}informational{% elif sickchill.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not sickchill.arm64 %}untested{% else %}{{ sickchill.arm64 }}{% endif %}-arm64-{% if not sickchill.arm64 %}inactive{% elif sickchill.arm64 == "verified" %}success{% elif sickchill.arm64 == "supported" %}informational{% elif sickchill.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not sickchill.armv7 %}untested{% else %}{{ sickchill.armv7 }}{% endif %}-armv7-{% if not sickchill.armv7 %}inactive{% elif sickchill.armv7 == "verified" %}success{% elif sickchill.armv7 == "supported" %}informational{% elif sickchill.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ sickchill.version }}

## SETUP

### Enabling sickchill

#### Command:

**`vlab set sickchill.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=sickchill`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ sickchill.domain }}/admin*

Create an account with your desired username; as this is the first user, sickchill makes this account the administrator.

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

3. run **`vlab update_one service=sickchill`** to complete the changes


## ACCESS

sickchill (HTTPS) link: [https://{% if sickchill.domain %}{{ sickchill.domain }}{% else %}{{ sickchill.subdomain + "." + domain }}{% endif %}/](https://{% if sickchill.domain %}{{ sickchill.domain }}{% else %}{{ sickchill.subdomain + "." + domain }}{% endif %}/)
sickchill (HTTP) link: [http://{% if sickchill.domain %}{{ sickchill.domain }}{% else %}{{ sickchill.subdomain + "." + domain }}{% endif %}/](http://{% if sickchill.domain %}{{ sickchill.domain }}{% else %}{{ sickchill.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ sickchill.subdomain + "." + tor_domain }}/](http://{{ sickchill.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sickchill.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=sickchill`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sickchill.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=sickchill`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set sickchill.domain sickchill.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  domain: sickchill.com
```

##### Finalising changes:

run: **`vlab update_one service=sickchill`**

### SUBDOMAIN
*Default: sickchill* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set sickchill.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=sickchill`**

### VERSION
*Default: {{  sickchill.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set sickchill.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sickchill
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=sickchill`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
