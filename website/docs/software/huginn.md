---
id: huginn
title: Huginn
hide_title: true
hide_table_of_contents: false
sidebar_label: Huginn
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Huginn

[Huginn](https://github.com/huginn/huginn) Create agents that monitor and act on your behalf. Your agents are standing by!

![amd64](https://img.shields.io/badge/{% if not huginn.amd64 %}untested{% else %}{{ huginn.amd64 }}{% endif %}-amd64-{% if not huginn.amd64 %}inactive{% elif huginn.amd64 == "verified" %}success{% elif huginn.amd64 == "supported" %}informational{% elif huginn.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not huginn.arm64 %}untested{% else %}{{ huginn.arm64 }}{% endif %}-arm64-{% if not huginn.arm64 %}inactive{% elif huginn.arm64 == "verified" %}success{% elif huginn.arm64 == "supported" %}informational{% elif huginn.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not huginn.armv7 %}untested{% else %}{{ huginn.armv7 }}{% endif %}-armv7-{% if not huginn.armv7 %}inactive{% elif huginn.armv7 == "verified" %}success{% elif huginn.armv7 == "supported" %}informational{% elif huginn.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ huginn.version }}

## SETUP

### Enabling huginn

#### Command:

**`vlab set huginn.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=huginn`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ huginn.domain }}/admin*

Create an account with your desired username; as this is the first user, huginn makes this account the administrator.

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

3. run **`vlab update_one service=huginn`** to complete the changes


## ACCESS

huginn (HTTPS) link: [https://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/](https://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/)
huginn (HTTP) link: [http://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/](http://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ huginn.subdomain + "." + tor_domain }}/](http://{{ huginn.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set huginn.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set huginn.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set huginn.domain huginn.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  domain: huginn.com
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### SUBDOMAIN
*Default: huginn* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set huginn.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### VERSION
*Default: {{  huginn.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set huginn.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
