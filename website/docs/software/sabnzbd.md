---
id: sabnzbd
title: Sabnzbd
hide_title: true
hide_table_of_contents: false
sidebar_label: Sabnzbd
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Sabnzbd

[Sabnzbd](https://sabnzbd.org/) Free and easy binary newsreader

![amd64](https://img.shields.io/badge/{% if not sabnzbd.amd64 %}untested{% else %}{{ sabnzbd.amd64 }}{% endif %}-amd64-{% if not sabnzbd.amd64 %}inactive{% elif sabnzbd.amd64 == "verified" %}success{% elif sabnzbd.amd64 == "supported" %}informational{% elif sabnzbd.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not sabnzbd.arm64 %}untested{% else %}{{ sabnzbd.arm64 }}{% endif %}-arm64-{% if not sabnzbd.arm64 %}inactive{% elif sabnzbd.arm64 == "verified" %}success{% elif sabnzbd.arm64 == "supported" %}informational{% elif sabnzbd.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not sabnzbd.armv7 %}untested{% else %}{{ sabnzbd.armv7 }}{% endif %}-armv7-{% if not sabnzbd.armv7 %}inactive{% elif sabnzbd.armv7 == "verified" %}success{% elif sabnzbd.armv7 == "supported" %}informational{% elif sabnzbd.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ sabnzbd.version }}

## SETUP

### Enabling sabnzbd

#### Command:

**`vlab set sabnzbd.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ sabnzbd.domain }}/admin*

Create an account with your desired username; as this is the first user, sabnzbd makes this account the administrator.

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

3. run **`vlab update_one service=sabnzbd`** to complete the changes


## ACCESS

sabnzbd (HTTPS) link: [https://{% if sabnzbd.domain %}{{ sabnzbd.domain }}{% else %}{{ sabnzbd.subdomain + "." + domain }}{% endif %}/](https://{% if sabnzbd.domain %}{{ sabnzbd.domain }}{% else %}{{ sabnzbd.subdomain + "." + domain }}{% endif %}/)
sabnzbd (HTTP) link: [http://{% if sabnzbd.domain %}{{ sabnzbd.domain }}{% else %}{{ sabnzbd.subdomain + "." + domain }}{% endif %}/](http://{% if sabnzbd.domain %}{{ sabnzbd.domain }}{% else %}{{ sabnzbd.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ sabnzbd.subdomain + "." + tor_domain }}/](http://{{ sabnzbd.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sabnzbd.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sabnzbd.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set sabnzbd.domain sabnzbd.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  domain: sabnzbd.com
```

##### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

### SUBDOMAIN
*Default: sabnzbd* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set sabnzbd.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

### VERSION
*Default: {{  sabnzbd.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set sabnzbd.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sabnzbd
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=sabnzbd`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
