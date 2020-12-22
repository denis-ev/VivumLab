---
id: ombi
title: Ombi
hide_title: true
hide_table_of_contents: false
sidebar_label: Ombi
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Ombi

[Ombi](https://ombi.io) Ombi is a self-hosted web application that automatically gives your shared Plex or Emby users the ability to request content by themselves!

![amd64](https://img.shields.io/badge/{% if not ombi.amd64 %}untested{% else %}{{ ombi.amd64 }}{% endif %}-amd64-{% if not ombi.amd64 %}inactive{% elif ombi.amd64 == "verified" %}success{% elif ombi.amd64 == "supported" %}informational{% elif ombi.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not ombi.arm64 %}untested{% else %}{{ ombi.arm64 }}{% endif %}-arm64-{% if not ombi.arm64 %}inactive{% elif ombi.arm64 == "verified" %}success{% elif ombi.arm64 == "supported" %}informational{% elif ombi.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not ombi.armv7 %}untested{% else %}{{ ombi.armv7 }}{% endif %}-armv7-{% if not ombi.armv7 %}inactive{% elif ombi.armv7 == "verified" %}success{% elif ombi.armv7 == "supported" %}informational{% elif ombi.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ ombi.version }}

## SETUP

### Enabling ombi

#### Command:

**`vlab set ombi.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ombi`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ ombi.domain }}/admin*

Create an account with your desired username; as this is the first user, ombi makes this account the administrator.

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

3. run **`vlab update_one service=ombi`** to complete the changes


## ACCESS

ombi (HTTPS) link: [https://{% if ombi.domain %}{{ ombi.domain }}{% else %}{{ ombi.subdomain + "." + domain }}{% endif %}/](https://{% if ombi.domain %}{{ ombi.domain }}{% else %}{{ ombi.subdomain + "." + domain }}{% endif %}/)
ombi (HTTP) link: [http://{% if ombi.domain %}{{ ombi.domain }}{% else %}{{ ombi.subdomain + "." + domain }}{% endif %}/](http://{% if ombi.domain %}{{ ombi.domain }}{% else %}{{ ombi.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ombi.subdomain + "." + tor_domain }}/](http://{{ ombi.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ombi.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ombi`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ombi.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ombi`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ombi.domain ombi.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  domain: ombi.com
```

##### Finalising changes:

run: **`vlab update_one service=ombi`**

### SUBDOMAIN
*Default: ombi* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ombi.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ombi`**

### VERSION
*Default: {{  ombi.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ombi.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ombi
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ombi`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
