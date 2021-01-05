---
id: piwigo
title: Piwigo
hide_title: true
hide_table_of_contents: false
sidebar_label: Piwigo
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Piwigo

[Piwigo](https://piwigo.org/) is a home inventory managament system.

![amd64](https://img.shields.io/badge/{% if not piwigo.amd64 %}untested{% else %}{{ piwigo.amd64 }}{% endif %}-amd64-{% if not piwigo.amd64 %}inactive{% elif piwigo.amd64 == "verified" %}success{% elif piwigo.amd64 == "supported" %}informational{% elif piwigo.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not piwigo.arm64 %}untested{% else %}{{ piwigo.arm64 }}{% endif %}-arm64-{% if not piwigo.arm64 %}inactive{% elif piwigo.arm64 == "verified" %}success{% elif piwigo.arm64 == "supported" %}informational{% elif piwigo.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not piwigo.armv7 %}untested{% else %}{{ piwigo.armv7 }}{% endif %}-armv7-{% if not piwigo.armv7 %}inactive{% elif piwigo.armv7 == "verified" %}success{% elif piwigo.armv7 == "supported" %}informational{% elif piwigo.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ piwigo.version }}

## SETUP

### Enabling piwigo

#### Command:

**`vlab set piwigo.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=piwigo`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ piwigo.domain }}/admin*

Create an account with your desired username; as this is the first user, piwigo makes this account the administrator.

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

3. run **`vlab update_one service=piwigo`** to complete the changes


## ACCESS

piwigo (HTTPS) link: [https://{% if piwigo.domain %}{{ piwigo.domain }}{% else %}{{ piwigo.subdomain + "." + domain }}{% endif %}/](https://{% if piwigo.domain %}{{ piwigo.domain }}{% else %}{{ piwigo.subdomain + "." + domain }}{% endif %}/)
piwigo (HTTP) link: [http://{% if piwigo.domain %}{{ piwigo.domain }}{% else %}{{ piwigo.subdomain + "." + domain }}{% endif %}/](http://{% if piwigo.domain %}{{ piwigo.domain }}{% else %}{{ piwigo.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ piwigo.subdomain + "." + tor_domain }}/](http://{{ piwigo.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set piwigo.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=piwigo`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set piwigo.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=piwigo`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set piwigo.domain piwigo.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  domain: piwigo.com
```

##### Finalising changes:

run: **`vlab update_one service=piwigo`**

### SUBDOMAIN
*Default: piwigo* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set piwigo.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=piwigo`**

### VERSION
*Default: {{  piwigo.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set piwigo.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
piwigo
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=piwigo`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
