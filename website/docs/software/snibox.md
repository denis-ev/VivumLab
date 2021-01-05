---
id: snibox
title: Snibox
hide_title: true
hide_table_of_contents: false
sidebar_label: Snibox
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Snibox

[Snibox](https://snibox.github.io/) Self-hosted snippet manager. Developed to collect and organize code snippets.

![amd64](https://img.shields.io/badge/{% if not snibox.amd64 %}untested{% else %}{{ snibox.amd64 }}{% endif %}-amd64-{% if not snibox.amd64 %}inactive{% elif snibox.amd64 == "verified" %}success{% elif snibox.amd64 == "supported" %}informational{% elif snibox.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not snibox.arm64 %}untested{% else %}{{ snibox.arm64 }}{% endif %}-arm64-{% if not snibox.arm64 %}inactive{% elif snibox.arm64 == "verified" %}success{% elif snibox.arm64 == "supported" %}informational{% elif snibox.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not snibox.armv7 %}untested{% else %}{{ snibox.armv7 }}{% endif %}-armv7-{% if not snibox.armv7 %}inactive{% elif snibox.armv7 == "verified" %}success{% elif snibox.armv7 == "supported" %}informational{% elif snibox.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ snibox.version }}

## SETUP

### Enabling snibox

#### Command:

**`vlab set snibox.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=snibox`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ snibox.domain }}/admin*

Create an account with your desired username; as this is the first user, snibox makes this account the administrator.

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

3. run **`vlab update_one service=snibox`** to complete the changes


## ACCESS

snibox (HTTPS) link: [https://{% if snibox.domain %}{{ snibox.domain }}{% else %}{{ snibox.subdomain + "." + domain }}{% endif %}/](https://{% if snibox.domain %}{{ snibox.domain }}{% else %}{{ snibox.subdomain + "." + domain }}{% endif %}/)
snibox (HTTP) link: [http://{% if snibox.domain %}{{ snibox.domain }}{% else %}{{ snibox.subdomain + "." + domain }}{% endif %}/](http://{% if snibox.domain %}{{ snibox.domain }}{% else %}{{ snibox.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ snibox.subdomain + "." + tor_domain }}/](http://{{ snibox.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set snibox.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=snibox`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set snibox.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=snibox`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set snibox.domain snibox.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  domain: snibox.com
```

##### Finalising changes:

run: **`vlab update_one service=snibox`**

### SUBDOMAIN
*Default: snibox* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set snibox.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=snibox`**

### VERSION
*Default: {{  snibox.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set snibox.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snibox
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=snibox`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
