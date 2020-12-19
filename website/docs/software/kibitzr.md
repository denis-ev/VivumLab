---
id: kibitzr
title: Kibitzr
hide_title: true
hide_table_of_contents: false
sidebar_label: Kibitzr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Kibitzr

[Kibitzr](https://kibitzr.github.io/) acts as a replacement for IFTTT.

![amd64](https://img.shields.io/badge/{% if not kibitzr.amd64 %}untested{% else %}{{ kibitzr.amd64 }}{% endif %}-amd64-{% if not kibitzr.amd64 %}inactive{% elif kibitzr.amd64 == "verified" %}success{% elif kibitzr.amd64 == "supported" %}informational{% elif kibitzr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not kibitzr.arm64 %}untested{% else %}{{ kibitzr.arm64 }}{% endif %}-arm64-{% if not kibitzr.arm64 %}inactive{% elif kibitzr.arm64 == "verified" %}success{% elif kibitzr.arm64 == "supported" %}informational{% elif kibitzr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not kibitzr.armv7 %}untested{% else %}{{ kibitzr.armv7 }}{% endif %}-armv7-{% if not kibitzr.armv7 %}inactive{% elif kibitzr.armv7 == "verified" %}success{% elif kibitzr.armv7 == "supported" %}informational{% elif kibitzr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ kibitzr.version }}

## SETUP

### Enabling kibitzr

#### Command:

**`vlab set kibitzr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=kibitzr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Create your `kibitzr.yml` and `kibitzr-creds.yml` in `roles/vivumlab/files/`.
You can find examples on the [Kibitzr website](https://kibitzr.github.io/).

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

3. run **`vlab update_one service=kibitzr`** to complete the changes


## ACCESS

kibitzr (HTTPS) link: [https://{% if kibitzr.domain %}{{ kibitzr.domain }}{% else %}{{ kibitzr.subdomain + "." + domain }}{% endif %}/](https://{% if kibitzr.domain %}{{ kibitzr.domain }}{% else %}{{ kibitzr.subdomain + "." + domain }}{% endif %}/)
kibitzr (HTTP) link: [http://{% if kibitzr.domain %}{{ kibitzr.domain }}{% else %}{{ kibitzr.subdomain + "." + domain }}{% endif %}/](http://{% if kibitzr.domain %}{{ kibitzr.domain }}{% else %}{{ kibitzr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ kibitzr.subdomain + "." + tor_domain }}/](http://{{ kibitzr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set kibitzr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=kibitzr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set kibitzr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=kibitzr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set kibitzr.domain kibitzr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  domain: kibitzr.com
```

##### Finalising changes:

run: **`vlab update_one service=kibitzr`**

### SUBDOMAIN
*Default: kibitzr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set kibitzr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=kibitzr`**

### VERSION
*Default: {{  kibitzr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set kibitzr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kibitzr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=kibitzr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
