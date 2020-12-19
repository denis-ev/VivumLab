---
id: organizr
title: Organizr
hide_title: true
hide_table_of_contents: false
sidebar_label: Organizr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Organizr

[Organizr](https://lamarios.github.io/organizr2/) is a simple dashboard that allows to monitor and interact with many different services.

![amd64](https://img.shields.io/badge/{% if not organizr.amd64 %}untested{% else %}{{ organizr.amd64 }}{% endif %}-amd64-{% if not organizr.amd64 %}inactive{% elif organizr.amd64 == "verified" %}success{% elif organizr.amd64 == "supported" %}informational{% elif organizr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not organizr.arm64 %}untested{% else %}{{ organizr.arm64 }}{% endif %}-arm64-{% if not organizr.arm64 %}inactive{% elif organizr.arm64 == "verified" %}success{% elif organizr.arm64 == "supported" %}informational{% elif organizr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not organizr.armv7 %}untested{% else %}{{ organizr.armv7 }}{% endif %}-armv7-{% if not organizr.armv7 %}inactive{% elif organizr.armv7 == "verified" %}success{% elif organizr.armv7 == "supported" %}informational{% elif organizr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ organizr.version }}

## SETUP

### Enabling organizr

#### Command:

**`vlab set organizr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=organizr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ organizr.domain }}/admin*

Create an account with your desired username; as this is the first user, organizr makes this account the administrator.

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

3. run **`vlab update_one service=organizr`** to complete the changes


## ACCESS

organizr (HTTPS) link: [https://{% if organizr.domain %}{{ organizr.domain }}{% else %}{{ organizr.subdomain + "." + domain }}{% endif %}/](https://{% if organizr.domain %}{{ organizr.domain }}{% else %}{{ organizr.subdomain + "." + domain }}{% endif %}/)
organizr (HTTP) link: [http://{% if organizr.domain %}{{ organizr.domain }}{% else %}{{ organizr.subdomain + "." + domain }}{% endif %}/](http://{% if organizr.domain %}{{ organizr.domain }}{% else %}{{ organizr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ organizr.subdomain + "." + tor_domain }}/](http://{{ organizr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set organizr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=organizr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set organizr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=organizr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set organizr.domain organizr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  domain: organizr.com
```

##### Finalising changes:

run: **`vlab update_one service=organizr`**

### SUBDOMAIN
*Default: organizr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set organizr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=organizr`**

### VERSION
*Default: {{  organizr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set organizr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
organizr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=organizr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
