---
id: guacamole
title: Guacamole
hide_title: true
hide_table_of_contents: false
sidebar_label: Guacamole
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Guacamole

[Guacamole](https://guacamole.apache.org) is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.

![amd64](https://img.shields.io/badge/{% if not guacamole.amd64 %}untested{% else %}{{ guacamole.amd64 }}{% endif %}-amd64-{% if not guacamole.amd64 %}inactive{% elif guacamole.amd64 == "verified" %}success{% elif guacamole.amd64 == "supported" %}informational{% elif guacamole.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not guacamole.arm64 %}untested{% else %}{{ guacamole.arm64 }}{% endif %}-arm64-{% if not guacamole.arm64 %}inactive{% elif guacamole.arm64 == "verified" %}success{% elif guacamole.arm64 == "supported" %}informational{% elif guacamole.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not guacamole.armv7 %}untested{% else %}{{ guacamole.armv7 }}{% endif %}-armv7-{% if not guacamole.armv7 %}inactive{% elif guacamole.armv7 == "verified" %}success{% elif guacamole.armv7 == "supported" %}informational{% elif guacamole.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ guacamole.version }}

## SETUP

### Enabling guacamole

#### Command:

**`vlab set guacamole.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=guacamole`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Default login is user admin with password admin, please change the password immediately (see user menu).

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

3. run **`vlab update_one service=guacamole`** to complete the changes


## ACCESS

guacamole (HTTPS) link: [https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/](https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/)
guacamole (HTTP) link: [http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/](http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ guacamole.subdomain + "." + tor_domain }}/](http://{{ guacamole.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set guacamole.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set guacamole.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set guacamole.domain guacamole.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  domain: guacamole.com
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### SUBDOMAIN
*Default: guacamole* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set guacamole.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### VERSION
*Default: {{  guacamole.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set guacamole.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
