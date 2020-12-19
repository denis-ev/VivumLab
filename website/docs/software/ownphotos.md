---
id: ownphotos
title: OwnPhotos
hide_title: true
hide_table_of_contents: false
sidebar_label: OwnPhotos
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# OwnPhotos

[OwnPhotos](https://github.com/hooram/ownphotos) Self hosted Google Photos clone.

![amd64](https://img.shields.io/badge/{% if not ownphotos.amd64 %}untested{% else %}{{ ownphotos.amd64 }}{% endif %}-amd64-{% if not ownphotos.amd64 %}inactive{% elif ownphotos.amd64 == "verified" %}success{% elif ownphotos.amd64 == "supported" %}informational{% elif ownphotos.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not ownphotos.arm64 %}untested{% else %}{{ ownphotos.arm64 }}{% endif %}-arm64-{% if not ownphotos.arm64 %}inactive{% elif ownphotos.arm64 == "verified" %}success{% elif ownphotos.arm64 == "supported" %}informational{% elif ownphotos.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not ownphotos.armv7 %}untested{% else %}{{ ownphotos.armv7 }}{% endif %}-armv7-{% if not ownphotos.armv7 %}inactive{% elif ownphotos.armv7 == "verified" %}success{% elif ownphotos.armv7 == "supported" %}informational{% elif ownphotos.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ ownphotos.version }}

## SETUP

### Enabling ownphotos

#### Command:

**`vlab set ownphotos.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ownphotos`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ ownphotos.domain }}/admin*

Create an account with your desired username; as this is the first user, ownphotos makes this account the administrator.

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

3. run **`vlab update_one service=ownphotos`** to complete the changes


## ACCESS

ownphotos (HTTPS) link: [https://{% if ownphotos.domain %}{{ ownphotos.domain }}{% else %}{{ ownphotos.subdomain + "." + domain }}{% endif %}/](https://{% if ownphotos.domain %}{{ ownphotos.domain }}{% else %}{{ ownphotos.subdomain + "." + domain }}{% endif %}/)
ownphotos (HTTP) link: [http://{% if ownphotos.domain %}{{ ownphotos.domain }}{% else %}{{ ownphotos.subdomain + "." + domain }}{% endif %}/](http://{% if ownphotos.domain %}{{ ownphotos.domain }}{% else %}{{ ownphotos.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ownphotos.subdomain + "." + tor_domain }}/](http://{{ ownphotos.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ownphotos.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ownphotos`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ownphotos.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ownphotos`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ownphotos.domain ownphotos.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  domain: ownphotos.com
```

##### Finalising changes:

run: **`vlab update_one service=ownphotos`**

### SUBDOMAIN
*Default: ownphotos* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ownphotos.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ownphotos`**

### VERSION
*Default: {{  ownphotos.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ownphotos.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ownphotos
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ownphotos`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
