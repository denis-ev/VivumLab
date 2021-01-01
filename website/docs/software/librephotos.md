---
id: librephotos
title: LibrePhotos
hide_title: true
hide_table_of_contents: false
sidebar_label: LibrePhotos
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# LibrePhotos

[LibrePhotos](https://github.com/LibrePhotos/librephotos) Self hosted Google Photos clone.

![amd64](https://img.shields.io/badge/{% if not librephotos.amd64 %}untested{% else %}{{ librephotos.amd64 }}{% endif %}-amd64-{% if not librephotos.amd64 %}inactive{% elif librephotos.amd64 == "verified" %}success{% elif librephotos.amd64 == "supported" %}informational{% elif librephotos.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not librephotos.arm64 %}untested{% else %}{{ librephotos.arm64 }}{% endif %}-arm64-{% if not librephotos.arm64 %}inactive{% elif librephotos.arm64 == "verified" %}success{% elif librephotos.arm64 == "supported" %}informational{% elif librephotos.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not librephotos.armv7 %}untested{% else %}{{ librephotos.armv7 }}{% endif %}-armv7-{% if not librephotos.armv7 %}inactive{% elif librephotos.armv7 == "verified" %}success{% elif librephotos.armv7 == "supported" %}informational{% elif librephotos.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ librephotos.version }}

## SETUP

### Enabling librephotos

#### Command:

**`vlab set librephotos.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=librephotos`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ librephotos.domain }}/admin*

Create an account with your desired username; as this is the first user, librephotos makes this account the administrator.

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

3. run **`vlab update_one service=librephotos`** to complete the changes


## ACCESS

librephotos (HTTPS) link: [https://{% if librephotos.domain %}{{ librephotos.domain }}{% else %}{{ librephotos.subdomain + "." + domain }}{% endif %}/](https://{% if librephotos.domain %}{{ librephotos.domain }}{% else %}{{ librephotos.subdomain + "." + domain }}{% endif %}/)
librephotos (HTTP) link: [http://{% if librephotos.domain %}{{ librephotos.domain }}{% else %}{{ librephotos.subdomain + "." + domain }}{% endif %}/](http://{% if librephotos.domain %}{{ librephotos.domain }}{% else %}{{ librephotos.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ librephotos.subdomain + "." + tor_domain }}/](http://{{ librephotos.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set librephotos.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=librephotos`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set librephotos.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=librephotos`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set librephotos.domain librephotos.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  domain: librephotos.com
```

##### Finalising changes:

run: **`vlab update_one service=librephotos`**

### SUBDOMAIN
*Default: librephotos* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set librephotos.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=librephotos`**

### VERSION
*Default: {{  librephotos.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set librephotos.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
librephotos
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=librephotos`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
