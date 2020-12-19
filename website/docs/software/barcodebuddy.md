---
id: barcodebuddy
title: Barcode Buddy
hide_title: true
hide_table_of_contents: false
sidebar_label: Barcode Buddy
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

![amd64](https://img.shields.io/badge/{% if not barcodebuddy.amd64 %}untested{% else %}{{ barcodebuddy.amd64 }}{% endif %}-amd64-{% if not barcodebuddy.amd64 %}inactive{% elif barcodebuddy.amd64 == "verified" %}success{% elif barcodebuddy.amd64 == "supported" %}informational{% elif barcodebuddy.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not barcodebuddy.arm64 %}untested{% else %}{{ barcodebuddy.arm64 }}{% endif %}-arm64-{% if not barcodebuddy.arm64 %}inactive{% elif barcodebuddy.arm64 == "verified" %}success{% elif barcodebuddy.arm64 == "supported" %}informational{% elif barcodebuddy.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not barcodebuddy.armv7 %}untested{% else %}{{ barcodebuddy.armv7 }}{% endif %}-armv7-{% if not barcodebuddy.armv7 %}inactive{% elif barcodebuddy.armv7 == "verified" %}success{% elif barcodebuddy.armv7 == "supported" %}informational{% elif barcodebuddy.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ barcodebuddy.version }}

## SETUP

### Enabling barcodebuddy

#### Command:

**`vlab set barcodebuddy.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ barcodebuddy.domain }}/admin*

Create an account with your desired username; as this is the first user, barcodebuddy makes this account the administrator.

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

3. run **`vlab update_one service=barcodebuddy`** to complete the changes


## ACCESS

Barcodebuddy (HTTPS) link: [https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)
Barcodebuddy (HTTP) link: [http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ barcodebuddy.subdomain + "." + tor_domain }}/](http://{{ barcodebuddy.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set barcodebuddy.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set barcodebuddy.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set barcodebuddy.domain barcodebuddy.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  domain: barcodebuddy.com
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### SUBDOMAIN
*Default: barcodebuddy* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set barcodebuddy.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### VERSION
*Default: {{  barcodebuddy.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set barcodebuddy.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
