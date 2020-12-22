---
id: readarr
title: Readarr
hide_title: true
hide_table_of_contents: false
sidebar_label: Readarr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Readarr

[Readarr](https://readarr.com/) Readarr is a ebook collection manager for Usenet and BitTorrent users.

![amd64](https://img.shields.io/badge/{% if not readarr.amd64 %}untested{% else %}{{ readarr.amd64 }}{% endif %}-amd64-{% if not readarr.amd64 %}inactive{% elif readarr.amd64 == "verified" %}success{% elif readarr.amd64 == "supported" %}informational{% elif readarr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not readarr.arm64 %}untested{% else %}{{ readarr.arm64 }}{% endif %}-arm64-{% if not readarr.arm64 %}inactive{% elif readarr.arm64 == "verified" %}success{% elif readarr.arm64 == "supported" %}informational{% elif readarr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not readarr.armv7 %}untested{% else %}{{ readarr.armv7 }}{% endif %}-armv7-{% if not readarr.armv7 %}inactive{% elif readarr.armv7 == "verified" %}success{% elif readarr.armv7 == "supported" %}informational{% elif readarr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ readarr.version }}

## SETUP

### Enabling readarr

#### Command:

**`vlab set readarr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=readarr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ readarr.domain }}/admin*

Create an account with your desired username; as this is the first user, readarr makes this account the administrator.

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

3. run **`vlab update_one service=readarr`** to complete the changes


## ACCESS

readarr (HTTPS) link: [https://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/](https://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/)
readarr (HTTP) link: [http://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/](http://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ readarr.subdomain + "." + tor_domain }}/](http://{{ readarr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set readarr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=readarr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set readarr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=readarr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set readarr.domain readarr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  domain: readarr.com
```

##### Finalising changes:

run: **`vlab update_one service=readarr`**

### SUBDOMAIN
*Default: readarr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set readarr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=readarr`**

### VERSION
*Default: {{  readarr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set readarr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=readarr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
