---
id: inventario
title: Inventario
hide_title: true
hide_table_of_contents: false
sidebar_label: Inventario
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Inventario

[Inventario](https://gitlab.com/NickBusey/inventario) is a home inventory managament system.

![amd64](https://img.shields.io/badge/{% if not inventario.amd64 %}untested{% else %}{{ inventario.amd64 }}{% endif %}-amd64-{% if not inventario.amd64 %}inactive{% elif inventario.amd64 == "verified" %}success{% elif inventario.amd64 == "supported" %}informational{% elif inventario.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not inventario.arm64 %}untested{% else %}{{ inventario.arm64 }}{% endif %}-arm64-{% if not inventario.arm64 %}inactive{% elif inventario.arm64 == "verified" %}success{% elif inventario.arm64 == "supported" %}informational{% elif inventario.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not inventario.armv7 %}untested{% else %}{{ inventario.armv7 }}{% endif %}-armv7-{% if not inventario.armv7 %}inactive{% elif inventario.armv7 == "verified" %}success{% elif inventario.armv7 == "supported" %}informational{% elif inventario.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ inventario.version }}

## SETUP

### Enabling inventario

#### Command:

**`vlab set inventario.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=inventario`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ inventario.domain }}/admin*

Create an account with your desired username; as this is the first user, inventario makes this account the administrator.

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

3. run **`vlab update_one service=inventario`** to complete the changes


## ACCESS

inventario (HTTPS) link: [https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/)
inventario (HTTP) link: [http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ inventario.subdomain + "." + tor_domain }}/](http://{{ inventario.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set inventario.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set inventario.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set inventario.domain inventario.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  domain: inventario.com
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### SUBDOMAIN
*Default: inventario* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set inventario.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### VERSION
*Default: {{  inventario.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set inventario.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
