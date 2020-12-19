---
id: minio
title: Minio
hide_title: true
hide_table_of_contents: false
sidebar_label: Minio
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Minio

Minio is an S3 storage utility.

![amd64](https://img.shields.io/badge/{% if not minio.amd64 %}untested{% else %}{{ minio.amd64 }}{% endif %}-amd64-{% if not minio.amd64 %}inactive{% elif minio.amd64 == "verified" %}success{% elif minio.amd64 == "supported" %}informational{% elif minio.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not minio.arm64 %}untested{% else %}{{ minio.arm64 }}{% endif %}-arm64-{% if not minio.arm64 %}inactive{% elif minio.arm64 == "verified" %}success{% elif minio.arm64 == "supported" %}informational{% elif minio.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not minio.armv7 %}untested{% else %}{{ minio.armv7 }}{% endif %}-armv7-{% if not minio.armv7 %}inactive{% elif minio.armv7 == "verified" %}success{% elif minio.armv7 == "supported" %}informational{% elif minio.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ minio.version }}

## SETUP

### Enabling minio

#### Command:

**`vlab set minio.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=minio`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Refer to the [Backup Guide](../core/Backup.md) for configuration details.

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

3. run **`vlab update_one service=minio`** to complete the changes


## ACCESS

minio (HTTPS) link: [https://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/](https://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/)
minio (HTTP) link: [http://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/](http://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ minio.subdomain + "." + tor_domain }}/](http://{{ minio.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minio.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=minio`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set minio.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=minio`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set minio.domain minio.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  domain: minio.com
```

##### Finalising changes:

run: **`vlab update_one service=minio`**

### SUBDOMAIN
*Default: minio* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set minio.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=minio`**

### VERSION
*Default: {{  minio.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set minio.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
minio
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=minio`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
