---
id: wekan
title: Wekan
hide_title: true
hide_table_of_contents: false
sidebar_label: Wekan
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Wekan

[Wekan](https://wekan.github.io/) Open source Kanban board with MIT license

![amd64](https://img.shields.io/badge/{% if not wekan.amd64 %}untested{% else %}{{ wekan.amd64 }}{% endif %}-amd64-{% if not wekan.amd64 %}inactive{% elif wekan.amd64 == "verified" %}success{% elif wekan.amd64 == "supported" %}informational{% elif wekan.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not wekan.arm64 %}untested{% else %}{{ wekan.arm64 }}{% endif %}-arm64-{% if not wekan.arm64 %}inactive{% elif wekan.arm64 == "verified" %}success{% elif wekan.arm64 == "supported" %}informational{% elif wekan.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not wekan.armv7 %}untested{% else %}{{ wekan.armv7 }}{% endif %}-armv7-{% if not wekan.armv7 %}inactive{% elif wekan.armv7 == "verified" %}success{% elif wekan.armv7 == "supported" %}informational{% elif wekan.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ wekan.version }}

## SETUP

### Enabling wekan

#### Command:

**`vlab set wekan.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=wekan`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ wekan.domain }}/admin*

Create an account with your desired username; as this is the first user, wekan makes this account the administrator.

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

3. run **`vlab update_one service=wekan`** to complete the changes


## ACCESS

wekan (HTTPS) link: [https://{% if wekan.domain %}{{ wekan.domain }}{% else %}{{ wekan.subdomain + "." + domain }}{% endif %}/](https://{% if wekan.domain %}{{ wekan.domain }}{% else %}{{ wekan.subdomain + "." + domain }}{% endif %}/)
wekan (HTTP) link: [http://{% if wekan.domain %}{{ wekan.domain }}{% else %}{{ wekan.subdomain + "." + domain }}{% endif %}/](http://{% if wekan.domain %}{{ wekan.domain }}{% else %}{{ wekan.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ wekan.subdomain + "." + tor_domain }}/](http://{{ wekan.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set wekan.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=wekan`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set wekan.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=wekan`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set wekan.domain wekan.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  domain: wekan.com
```

##### Finalising changes:

run: **`vlab update_one service=wekan`**

### SUBDOMAIN
*Default: wekan* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set wekan.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=wekan`**

### VERSION
*Default: {{  wekan.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set wekan.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wekan
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=wekan`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
