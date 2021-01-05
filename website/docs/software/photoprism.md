---
id: photoprism
title: PhotoPrism
hide_title: true
hide_table_of_contents: false
sidebar_label: PhotoPrism
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# PhotoPrism

[PhotoPrism](https://photoprism.org) Personal Photo Management powered by Go and Google TensorFlow. Free and open-source.

![amd64](https://img.shields.io/badge/{% if not photoprism.amd64 %}untested{% else %}{{ photoprism.amd64 }}{% endif %}-amd64-{% if not photoprism.amd64 %}inactive{% elif photoprism.amd64 == "verified" %}success{% elif photoprism.amd64 == "supported" %}informational{% elif photoprism.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not photoprism.arm64 %}untested{% else %}{{ photoprism.arm64 }}{% endif %}-arm64-{% if not photoprism.arm64 %}inactive{% elif photoprism.arm64 == "verified" %}success{% elif photoprism.arm64 == "supported" %}informational{% elif photoprism.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not photoprism.armv7 %}untested{% else %}{{ photoprism.armv7 }}{% endif %}-armv7-{% if not photoprism.armv7 %}inactive{% elif photoprism.armv7 == "verified" %}success{% elif photoprism.armv7 == "supported" %}informational{% elif photoprism.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ photoprism.version }}

## SETUP

### Enabling photoprism

#### Command:

**`vlab set photoprism.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=photoprism`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ photoprism.domain }}/admin*

Create an account with your desired username; as this is the first user, photoprism makes this account the administrator.

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

3. run **`vlab update_one service=photoprism`** to complete the changes


## ACCESS

photoprism (HTTPS) link: [https://{% if photoprism.domain %}{{ photoprism.domain }}{% else %}{{ photoprism.subdomain + "." + domain }}{% endif %}/](https://{% if photoprism.domain %}{{ photoprism.domain }}{% else %}{{ photoprism.subdomain + "." + domain }}{% endif %}/)
photoprism (HTTP) link: [http://{% if photoprism.domain %}{{ photoprism.domain }}{% else %}{{ photoprism.subdomain + "." + domain }}{% endif %}/](http://{% if photoprism.domain %}{{ photoprism.domain }}{% else %}{{ photoprism.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ photoprism.subdomain + "." + tor_domain }}/](http://{{ photoprism.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set photoprism.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=photoprism`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set photoprism.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=photoprism`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set photoprism.domain photoprism.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  domain: photoprism.com
```

##### Finalising changes:

run: **`vlab update_one service=photoprism`**

### SUBDOMAIN
*Default: photoprism* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set photoprism.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=photoprism`**

### VERSION
*Default: {{  photoprism.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set photoprism.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
photoprism
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=photoprism`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
