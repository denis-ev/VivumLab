---
id: digikam
title: Digikam
hide_title: true
hide_table_of_contents: false
sidebar_label: Digikam
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Digikam

[Digikam](https://www.digikam.org/) Professional Photo Management with the Power of Open Source

![amd64](https://img.shields.io/badge/{% if not digikam.amd64 %}untested{% else %}{{ digikam.amd64 }}{% endif %}-amd64-{% if not digikam.amd64 %}inactive{% elif digikam.amd64 == "verified" %}success{% elif digikam.amd64 == "supported" %}informational{% elif digikam.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not digikam.arm64 %}untested{% else %}{{ digikam.arm64 }}{% endif %}-arm64-{% if not digikam.arm64 %}inactive{% elif digikam.arm64 == "verified" %}success{% elif digikam.arm64 == "supported" %}informational{% elif digikam.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not digikam.armv7 %}untested{% else %}{{ digikam.armv7 }}{% endif %}-armv7-{% if not digikam.armv7 %}inactive{% elif digikam.armv7 == "verified" %}success{% elif digikam.armv7 == "supported" %}informational{% elif digikam.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ digikam.version }}

## SETUP

### Enabling digikam

#### Command:

**`vlab set digikam.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=digikam`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### ADMINISTRATOR SETUP

Navigate to *[https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/admin](https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/admin)*

Create an account with your desired username; as this is the first user, digikam makes this account the administrator.

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

3. run **`vlab update_one service=digikam`** to complete the changes


## ACCESS

digikam (HTTPS) link: [https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)
digikam (HTTP) link: [http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ digikam.subdomain + "." + tor_domain }}/](http://{{ digikam.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set digikam.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set digikam.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set digikam.domain digikam.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  domain: digikam.com
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### SUBDOMAIN
*Default: digikam* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set digikam.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### VERSION
*Default: {{  digikam.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set digikam.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
