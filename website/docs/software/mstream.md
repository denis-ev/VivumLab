---
id: mstream
title: MStream
hide_title: true
hide_table_of_contents: false
sidebar_label: MStream
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# MStream

[MStream](https://www.mstream.io) All your music, everywhere you go.

![amd64](https://img.shields.io/badge/{% if not mstream.amd64 %}untested{% else %}{{ mstream.amd64 }}{% endif %}-amd64-{% if not mstream.amd64 %}inactive{% elif mstream.amd64 == "verified" %}success{% elif mstream.amd64 == "supported" %}informational{% elif mstream.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mstream.arm64 %}untested{% else %}{{ mstream.arm64 }}{% endif %}-arm64-{% if not mstream.arm64 %}inactive{% elif mstream.arm64 == "verified" %}success{% elif mstream.arm64 == "supported" %}informational{% elif mstream.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mstream.armv7 %}untested{% else %}{{ mstream.armv7 }}{% endif %}-armv7-{% if not mstream.armv7 %}inactive{% elif mstream.armv7 == "verified" %}success{% elif mstream.armv7 == "supported" %}informational{% elif mstream.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mstream.version }}

## SETUP

### Enabling mstream

#### Command:

**`vlab set mstream.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mstream`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mstream.domain }}/admin*

Create an account with your desired username; as this is the first user, mstream makes this account the administrator.

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

3. run **`vlab update_one service=mstream`** to complete the changes


## ACCESS

mstream (HTTPS) link: [https://{% if mstream.domain %}{{ mstream.domain }}{% else %}{{ mstream.subdomain + "." + domain }}{% endif %}/](https://{% if mstream.domain %}{{ mstream.domain }}{% else %}{{ mstream.subdomain + "." + domain }}{% endif %}/)
mstream (HTTP) link: [http://{% if mstream.domain %}{{ mstream.domain }}{% else %}{{ mstream.subdomain + "." + domain }}{% endif %}/](http://{% if mstream.domain %}{{ mstream.domain }}{% else %}{{ mstream.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ mstream.subdomain + "." + tor_domain }}/](http://{{ mstream.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mstream.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mstream`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mstream.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mstream`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mstream.domain mstream.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  domain: mstream.com
```

##### Finalising changes:

run: **`vlab update_one service=mstream`**

### SUBDOMAIN
*Default: mstream* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mstream.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mstream`**

### VERSION
*Default: {{  mstream.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mstream.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mstream
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mstream`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
