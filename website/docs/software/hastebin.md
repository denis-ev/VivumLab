---
id: hastebin
title: Hastebin
hide_title: true
hide_table_of_contents: false
sidebar_label: Hastebin
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Hastebin

[Hastebin](https://hastebin.com/about.md) Sharing code is a good thing, and it should be _really_ easy to do it.

![amd64](https://img.shields.io/badge/{% if not hastebin.amd64 %}untested{% else %}{{ hastebin.amd64 }}{% endif %}-amd64-{% if not hastebin.amd64 %}inactive{% elif hastebin.amd64 == "verified" %}success{% elif hastebin.amd64 == "supported" %}informational{% elif hastebin.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not hastebin.arm64 %}untested{% else %}{{ hastebin.arm64 }}{% endif %}-arm64-{% if not hastebin.arm64 %}inactive{% elif hastebin.arm64 == "verified" %}success{% elif hastebin.arm64 == "supported" %}informational{% elif hastebin.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not hastebin.armv7 %}untested{% else %}{{ hastebin.armv7 }}{% endif %}-armv7-{% if not hastebin.armv7 %}inactive{% elif hastebin.armv7 == "verified" %}success{% elif hastebin.armv7 == "supported" %}informational{% elif hastebin.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** [Github](https://github.com/seejohnrun/haste-server)  
**Current Image Version:** {{ hastebin.server_version }}

## SETUP

### Enabling Hastebin

#### Command:

**`vlab set hastebin.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hastebin
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=hastebin`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ hastebin.domain }}/admin*

Create an account with your desired username; as this is the first user, hastebin makes this account the administrator.

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

3. run **`vlab update_one service=hastebin`** to complete the changes


## ACCESS

hastebin (HTTPS) link: [https://{% if hastebin.domain %}{{ hastebin.domain }}{% else %}{{ hastebin.subdomain + "." + domain }}{% endif %}/](https://{% if hastebin.domain %}{{ hastebin.domain }}{% else %}{{ hastebin.subdomain + "." + domain }}{% endif %}/)
hastebin (HTTP) link: [http://{% if hastebin.domain %}{{ hastebin.domain }}{% else %}{{ hastebin.subdomain + "." + domain }}{% endif %}/](http://{% if hastebin.domain %}{{ hastebin.domain }}{% else %}{{ hastebin.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ hastebin.subdomain + "." + tor_domain }}/](http://{{ hastebin.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set hastebin.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/prod-config.yml` to true

eg.
```
hastebin
  https_only: True
```

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set hastebin.auth True`**

#### File alteration:

set the appropriate service settings in `settings/prod-config.yml` to true

eg.
```
hastebin
  auth: True
```

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set hastebin.domain hastebin.com`**

#### File alteration:

set the appropriate service settings in `settings/prod-config.yml` to true

eg.
```
hastebin
  domain: hastebin.com
```

### SUBDOMAIN
*Default: hastebin* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set hastebin.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/prod-config.yml` to true

eg.
```
hastebin
  subdomain: media
```

### VERSION
*Default: {{  hastebin.server_version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set hastebin.server_version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/prod-config.yml` to true

eg.
```
hastebin
  version: 2.7
```

### Finalising changes:

run: **`vlab update_one service=hastebin`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
