---
id: ubooquity
title: Ubooquity
hide_title: true
hide_table_of_contents: false
sidebar_label: Ubooquity
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Ubooquity

[Ubooquity](https://vaemendis.net/ubooquity/) Ubooquity is a free home server for your comics and ebooks library

![amd64](https://img.shields.io/badge/{% if not ubooquity.amd64 %}untested{% else %}{{ ubooquity.amd64 }}{% endif %}-amd64-{% if not ubooquity.amd64 %}inactive{% elif ubooquity.amd64 == "verified" %}success{% elif ubooquity.amd64 == "supported" %}informational{% elif ubooquity.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not ubooquity.arm64 %}untested{% else %}{{ ubooquity.arm64 }}{% endif %}-arm64-{% if not ubooquity.arm64 %}inactive{% elif ubooquity.arm64 == "verified" %}success{% elif ubooquity.arm64 == "supported" %}informational{% elif ubooquity.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not ubooquity.armv7 %}untested{% else %}{{ ubooquity.armv7 }}{% endif %}-armv7-{% if not ubooquity.armv7 %}inactive{% elif ubooquity.armv7 == "verified" %}success{% elif ubooquity.armv7 == "supported" %}informational{% elif ubooquity.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ ubooquity.version }}

## SETUP

### Enabling ubooquity

#### Command:

**`vlab set ubooquity.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ubooquity`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ ubooquity.domain }}/admin*

Create an account with your desired username; as this is the first user, ubooquity makes this account the administrator.

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

3. run **`vlab update_one service=ubooquity`** to complete the changes


## ACCESS

ubooquity (HTTPS) link: [https://{% if ubooquity.domain %}{{ ubooquity.domain }}{% else %}{{ ubooquity.subdomain + "." + domain }}{% endif %}/](https://{% if ubooquity.domain %}{{ ubooquity.domain }}{% else %}{{ ubooquity.subdomain + "." + domain }}{% endif %}/)
ubooquity (HTTP) link: [http://{% if ubooquity.domain %}{{ ubooquity.domain }}{% else %}{{ ubooquity.subdomain + "." + domain }}{% endif %}/](http://{% if ubooquity.domain %}{{ ubooquity.domain }}{% else %}{{ ubooquity.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ubooquity.subdomain + "." + tor_domain }}/](http://{{ ubooquity.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ubooquity.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ubooquity`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ubooquity.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ubooquity`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ubooquity.domain ubooquity.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  domain: ubooquity.com
```

##### Finalising changes:

run: **`vlab update_one service=ubooquity`**

### SUBDOMAIN
*Default: ubooquity* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ubooquity.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ubooquity`**

### VERSION
*Default: {{  ubooquity.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ubooquity.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ubooquity
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ubooquity`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
