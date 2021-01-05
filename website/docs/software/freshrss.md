---
id: freshrss
title: FreshRSS
hide_title: true
hide_table_of_contents: false
sidebar_label: FreshRSS
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# FreshRSS

[FreshRSS](https://freshrss.org) is a free, self-hostable aggregator.

![amd64](https://img.shields.io/badge/{% if not freshrss.amd64 %}untested{% else %}{{ freshrss.amd64 }}{% endif %}-amd64-{% if not freshrss.amd64 %}inactive{% elif freshrss.amd64 == "verified" %}success{% elif freshrss.amd64 == "supported" %}informational{% elif freshrss.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not freshrss.arm64 %}untested{% else %}{{ freshrss.arm64 }}{% endif %}-arm64-{% if not freshrss.arm64 %}inactive{% elif freshrss.arm64 == "verified" %}success{% elif freshrss.arm64 == "supported" %}informational{% elif freshrss.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not freshrss.armv7 %}untested{% else %}{{ freshrss.armv7 }}{% endif %}-armv7-{% if not freshrss.armv7 %}inactive{% elif freshrss.armv7 == "verified" %}success{% elif freshrss.armv7 == "supported" %}informational{% elif freshrss.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ freshrss.version }}

## SETUP

### Enabling freshrss

#### Command:

**`vlab set freshrss.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=freshrss`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ freshrss.domain }}/admin*

Create an account with your desired username; as this is the first user, freshrss makes this account the administrator.

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

3. run **`vlab update_one service=freshrss`** to complete the changes


## ACCESS

freshrss (HTTPS) link: [https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/)
freshrss (HTTP) link: [http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ freshrss.subdomain + "." + tor_domain }}/](http://{{ freshrss.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set freshrss.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=freshrss`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set freshrss.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=freshrss`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set freshrss.domain freshrss.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  domain: freshrss.com
```

##### Finalising changes:

run: **`vlab update_one service=freshrss`**

### SUBDOMAIN
*Default: freshrss* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set freshrss.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=freshrss`**

### VERSION
*Default: {{  freshrss.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set freshrss.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
freshrss
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=freshrss`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
