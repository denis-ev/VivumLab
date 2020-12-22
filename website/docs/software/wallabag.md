---
id: wallabag
title: Wallabag
hide_title: true
hide_table_of_contents: false
sidebar_label: Wallabag
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Wallabag

[Wallabag](https://wallabag.org/en/) Save and classify articles. Read them later. Freely.

![amd64](https://img.shields.io/badge/{% if not wallabag.amd64 %}untested{% else %}{{ wallabag.amd64 }}{% endif %}-amd64-{% if not wallabag.amd64 %}inactive{% elif wallabag.amd64 == "verified" %}success{% elif wallabag.amd64 == "supported" %}informational{% elif wallabag.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not wallabag.arm64 %}untested{% else %}{{ wallabag.arm64 }}{% endif %}-arm64-{% if not wallabag.arm64 %}inactive{% elif wallabag.arm64 == "verified" %}success{% elif wallabag.arm64 == "supported" %}informational{% elif wallabag.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not wallabag.armv7 %}untested{% else %}{{ wallabag.armv7 }}{% endif %}-armv7-{% if not wallabag.armv7 %}inactive{% elif wallabag.armv7 == "verified" %}success{% elif wallabag.armv7 == "supported" %}informational{% elif wallabag.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ wallabag.version }}

## SETUP

### Enabling wallabag

#### Command:

**`vlab set wallabag.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=wallabag`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

> Note. Until VivumLab has outbound mail capabilities, you'll need to rely on the default superadmin user
> User: wallabag
> Pass: wallabag

> **_You should change that password._**

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

3. run **`vlab update_one service=wallabag`** to complete the changes


## ACCESS

wallabag (HTTPS) link: [https://{% if wallabag.domain %}{{ wallabag.domain }}{% else %}{{ wallabag.subdomain + "." + domain }}{% endif %}/](https://{% if wallabag.domain %}{{ wallabag.domain }}{% else %}{{ wallabag.subdomain + "." + domain }}{% endif %}/)
wallabag (HTTP) link: [http://{% if wallabag.domain %}{{ wallabag.domain }}{% else %}{{ wallabag.subdomain + "." + domain }}{% endif %}/](http://{% if wallabag.domain %}{{ wallabag.domain }}{% else %}{{ wallabag.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ wallabag.subdomain + "." + tor_domain }}/](http://{{ wallabag.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set wallabag.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=wallabag`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set wallabag.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=wallabag`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set wallabag.domain wallabag.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  domain: wallabag.com
```

##### Finalising changes:

run: **`vlab update_one service=wallabag`**

### SUBDOMAIN
*Default: wallabag* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set wallabag.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=wallabag`**

### VERSION
*Default: {{  wallabag.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set wallabag.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wallabag
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=wallabag`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
