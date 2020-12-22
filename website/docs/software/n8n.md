---
id: n8n
title: n8n
hide_title: true
hide_table_of_contents: false
sidebar_label: n8n
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# n8n

[n8n](https://n8n.io) n8n is a free and open node based Workflow Automation Tool.

![amd64](https://img.shields.io/badge/{% if not n8n.amd64 %}untested{% else %}{{ n8n.amd64 }}{% endif %}-amd64-{% if not n8n.amd64 %}inactive{% elif n8n.amd64 == "verified" %}success{% elif n8n.amd64 == "supported" %}informational{% elif n8n.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not n8n.arm64 %}untested{% else %}{{ n8n.arm64 }}{% endif %}-arm64-{% if not n8n.arm64 %}inactive{% elif n8n.arm64 == "verified" %}success{% elif n8n.arm64 == "supported" %}informational{% elif n8n.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not n8n.armv7 %}untested{% else %}{{ n8n.armv7 }}{% endif %}-armv7-{% if not n8n.armv7 %}inactive{% elif n8n.armv7 == "verified" %}success{% elif n8n.armv7 == "supported" %}informational{% elif n8n.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ n8n.version }}

## SETUP

### Enabling n8n

#### Command:

**`vlab set n8n.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=n8n`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ n8n.domain }}/admin*

Create an account with your desired username; as this is the first user, n8n makes this account the administrator.

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

3. run **`vlab update_one service=n8n`** to complete the changes


## ACCESS

n8n (HTTPS) link: [https://{% if n8n.domain %}{{ n8n.domain }}{% else %}{{ n8n.subdomain + "." + domain }}{% endif %}/](https://{% if n8n.domain %}{{ n8n.domain }}{% else %}{{ n8n.subdomain + "." + domain }}{% endif %}/)
n8n (HTTP) link: [http://{% if n8n.domain %}{{ n8n.domain }}{% else %}{{ n8n.subdomain + "." + domain }}{% endif %}/](http://{% if n8n.domain %}{{ n8n.domain }}{% else %}{{ n8n.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ n8n.subdomain + "." + tor_domain }}/](http://{{ n8n.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set n8n.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=n8n`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set n8n.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=n8n`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set n8n.domain n8n.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  domain: n8n.com
```

##### Finalising changes:

run: **`vlab update_one service=n8n`**

### SUBDOMAIN
*Default: n8n* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set n8n.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=n8n`**

### VERSION
*Default: {{  n8n.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set n8n.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
n8n
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=n8n`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
