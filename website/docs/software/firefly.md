---
id: firefly
title: Firefly III
hide_title: true
hide_table_of_contents: false
sidebar_label: Firefly III
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Firefly III

[Firefly III](https://firefly-iii.org/) is a money management app.

![amd64](https://img.shields.io/badge/{% if not firefly_iii.amd64 %}untested{% else %}{{ firefly_iii.amd64 }}{% endif %}-amd64-{% if not firefly_iii.amd64 %}inactive{% elif firefly_iii.amd64 == "verified" %}success{% elif firefly_iii.amd64 == "supported" %}informational{% elif firefly_iii.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not firefly_iii.arm64 %}untested{% else %}{{ firefly_iii.arm64 }}{% endif %}-arm64-{% if not firefly_iii.arm64 %}inactive{% elif firefly_iii.arm64 == "verified" %}success{% elif firefly_iii.arm64 == "supported" %}informational{% elif firefly_iii.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not firefly_iii.armv7 %}untested{% else %}{{ firefly_iii.armv7 }}{% endif %}-armv7-{% if not firefly_iii.armv7 %}inactive{% elif firefly_iii.armv7 == "verified" %}success{% elif firefly_iii.armv7 == "supported" %}informational{% elif firefly_iii.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ firefly_iii.version }}

## SETUP

### Enabling firefly_iii

#### Command:

**`vlab set firefly_iii.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ firefly_iii.domain }}/admin*

Create an account with your desired username; as this is the first user, firefly_iii makes this account the administrator.

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

3. run **`vlab update_one service=firefly_iii`** to complete the changes


## ACCESS

firefly_iii (HTTPS) link: [https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)
firefly_iii (HTTP) link: [http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ firefly_iii.subdomain + "." + tor_domain }}/](http://{{ firefly_iii.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set firefly_iii.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set firefly_iii.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set firefly_iii.domain firefly_iii.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  domain: firefly_iii.com
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### SUBDOMAIN
*Default: firefly_iii* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set firefly_iii.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### VERSION
*Default: {{  firefly_iii.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set firefly_iii.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
