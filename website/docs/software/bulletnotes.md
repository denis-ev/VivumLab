---
id: bulletnotes
title: BulletNotes
hide_title: true
hide_table_of_contents: false
sidebar_label: BulletNotes
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# BulletNotes

[BulletNotes](https://github.com/Vivumlab/BulletNotes/) is an open source note taking app.

![amd64](https://img.shields.io/badge/{% if not bulletnotes.amd64 %}untested{% else %}{{ bulletnotes.amd64 }}{% endif %}-amd64-{% if not bulletnotes.amd64 %}inactive{% elif bulletnotes.amd64 == "verified" %}success{% elif bulletnotes.amd64 == "supported" %}informational{% elif bulletnotes.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not bulletnotes.arm64 %}untested{% else %}{{ bulletnotes.arm64 }}{% endif %}-arm64-{% if not bulletnotes.arm64 %}inactive{% elif bulletnotes.arm64 == "verified" %}success{% elif bulletnotes.arm64 == "supported" %}informational{% elif bulletnotes.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not bulletnotes.armv7 %}untested{% else %}{{ bulletnotes.armv7 }}{% endif %}-armv7-{% if not bulletnotes.armv7 %}inactive{% elif bulletnotes.armv7 == "verified" %}success{% elif bulletnotes.armv7 == "supported" %}informational{% elif bulletnotes.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ bulletnotes.version }}

## SETUP

### Enabling bulletnotes

#### Command:

**`vlab set bulletnotes.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bulletnotes.domain }}/admin*

Create an account with your desired username; as this is the first user, bulletnotes makes this account the administrator.

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

3. run **`vlab update_one service=bulletnotes`** to complete the changes


## ACCESS

Bulletnotes (HTTPS) link: [https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)
Bulletnotes (HTTP) link: [http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bulletnotes.subdomain + "." + tor_domain }}/](http://{{ bulletnotes.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bulletnotes.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bulletnotes.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bulletnotes.domain bulletnotes.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  domain: bulletnotes.com
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### SUBDOMAIN
*Default: bulletnotes* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bulletnotes.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### VERSION
*Default: {{  bulletnotes.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bulletnotes.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
