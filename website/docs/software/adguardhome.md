---
id: adguardhome
title: AdGuard Home
hide_title: true
hide_table_of_contents: false
sidebar_label: AdGuard Home
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# AdGuard Home

[AdGuard Home](https://adguard.com/en/adguard-home/overview.html) Network-wide software for blocking ads and tracking.

![amd64](https://img.shields.io/badge/{% if not adguardhome.amd64 %}untested{% else %}{{ adguardhome.amd64 }}{% endif %}-amd64-{% if not adguardhome.amd64 %}inactive{% elif adguardhome.amd64 == "verified" %}success{% elif adguardhome.amd64 == "supported" %}informational{% elif adguardhome.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not adguardhome.arm64 %}untested{% else %}{{ adguardhome.arm64 }}{% endif %}-arm64-{% if not adguardhome.arm64 %}inactive{% elif adguardhome.arm64 == "verified" %}success{% elif adguardhome.arm64 == "supported" %}informational{% elif adguardhome.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not adguardhome.armv7 %}untested{% else %}{{ adguardhome.armv7 }}{% endif %}-armv7-{% if not adguardhome.armv7 %}inactive{% elif adguardhome.armv7 == "verified" %}success{% elif adguardhome.armv7 == "supported" %}informational{% elif adguardhome.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ adguardhome.version }}

## SETUP

### Enabling adguardhome

#### Command:

**`vlab set adguardhome.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=adguardhome`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ adguardhome.domain }}/admin*

Create an account with your desired username; as this is the first user, adguardhome makes this account the administrator.

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

3. run **`vlab update_one service=adguardhome`** to complete the changes

## ACCESS

AdGuard Home (HTTPS) link: [https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)
AdGuard Home (HTTP) link: [http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ adguardhome.subdomain + "." + tor_domain }}/](http://{{ adguardhome.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set adguardhome.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set adguardhome.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set adguardhome.domain adguardhome.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  domain: adguardhome.com
```

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### SUBDOMAIN
*Default: adguardhome*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{ domain }}'*

#### Command:

**`vlab set adguardhome.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### VERSION
*Default: {{ adguardhome.version }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set adguardhome.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
adguardhome
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
