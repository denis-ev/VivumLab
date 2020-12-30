---
id: searx
title: Searx
hide_title: true
hide_table_of_contents: false
sidebar_label: Searx
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Searx

[Searx](https://github.com/asciimoo/searx/) A privacy-respecting, hackable metasearch engine.

![amd64](https://img.shields.io/badge/{% if not searx.amd64 %}untested{% else %}{{ searx.amd64 }}{% endif %}-amd64-{% if not searx.amd64 %}inactive{% elif searx.amd64 == "verified" %}success{% elif searx.amd64 == "supported" %}informational{% elif searx.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not searx.arm64 %}untested{% else %}{{ searx.arm64 }}{% endif %}-arm64-{% if not searx.arm64 %}inactive{% elif searx.arm64 == "verified" %}success{% elif searx.arm64 == "supported" %}informational{% elif searx.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not searx.armv7 %}untested{% else %}{{ searx.armv7 }}{% endif %}-armv7-{% if not searx.armv7 %}inactive{% elif searx.armv7 == "verified" %}success{% elif searx.armv7 == "supported" %}informational{% elif searx.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ searx.version }}

## SETUP

### Enabling searx

#### Command:

**`vlab set searx.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=searx`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ searx.domain }}/admin*

Create an account with your desired username; as this is the first user, searx makes this account the administrator.

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

3. run **`vlab update_one service=searx`** to complete the changes


## ACCESS

searx (HTTPS) link: [https://{% if searx.domain %}{{ searx.domain }}{% else %}{{ searx.subdomain + "." + domain }}{% endif %}/](https://{% if searx.domain %}{{ searx.domain }}{% else %}{{ searx.subdomain + "." + domain }}{% endif %}/)
searx (HTTP) link: [http://{% if searx.domain %}{{ searx.domain }}{% else %}{{ searx.subdomain + "." + domain }}{% endif %}/](http://{% if searx.domain %}{{ searx.domain }}{% else %}{{ searx.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ searx.subdomain + "." + tor_domain }}/](http://{{ searx.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set searx.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=searx`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set searx.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=searx`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set searx.domain searx.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  domain: searx.com
```

##### Finalising changes:

run: **`vlab update_one service=searx`**

### SUBDOMAIN
*Default: searx* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set searx.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=searx`**

### VERSION
*Default: {{  searx.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set searx.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
searx
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=searx`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
