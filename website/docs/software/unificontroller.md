---
id: unificontroller
title: Unifi Controller
hide_title: true
hide_table_of_contents: false
sidebar_label: Unifi Controller
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Unifi Controller

[Unifi Controller](https://www.ui.com/) The Unifi-controller Controller software is a powerful, enterprise wireless software engine ideal for high-density client deployments requiring low latency and high uptime performance.

![amd64](https://img.shields.io/badge/{% if not unificontroller.amd64 %}untested{% else %}{{ unificontroller.amd64 }}{% endif %}-amd64-{% if not unificontroller.amd64 %}inactive{% elif unificontroller.amd64 == "verified" %}success{% elif unificontroller.amd64 == "supported" %}informational{% elif unificontroller.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not unificontroller.arm64 %}untested{% else %}{{ unificontroller.arm64 }}{% endif %}-arm64-{% if not unificontroller.arm64 %}inactive{% elif unificontroller.arm64 == "verified" %}success{% elif unificontroller.arm64 == "supported" %}informational{% elif unificontroller.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not unificontroller.armv7 %}untested{% else %}{{ unificontroller.armv7 }}{% endif %}-armv7-{% if not unificontroller.armv7 %}inactive{% elif unificontroller.armv7 == "verified" %}success{% elif unificontroller.armv7 == "supported" %}informational{% elif unificontroller.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ unificontroller.version }}

## SETUP

### Enabling unificontroller

#### Command:

**`vlab set unificontroller.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=unificontroller`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ unificontroller.domain }}/admin*

Create an account with your desired username; as this is the first user, unificontroller makes this account the administrator.

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

3. run **`vlab update_one service=unificontroller`** to complete the changes


## ACCESS

unificontroller (HTTPS) link: [https://{% if unificontroller.domain %}{{ unificontroller.domain }}{% else %}{{ unificontroller.subdomain + "." + domain }}{% endif %}/](https://{% if unificontroller.domain %}{{ unificontroller.domain }}{% else %}{{ unificontroller.subdomain + "." + domain }}{% endif %}/)
unificontroller (HTTP) link: [http://{% if unificontroller.domain %}{{ unificontroller.domain }}{% else %}{{ unificontroller.subdomain + "." + domain }}{% endif %}/](http://{% if unificontroller.domain %}{{ unificontroller.domain }}{% else %}{{ unificontroller.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ unificontroller.subdomain + "." + tor_domain }}/](http://{{ unificontroller.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set unificontroller.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=unificontroller`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set unificontroller.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=unificontroller`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set unificontroller.domain unificontroller.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  domain: unificontroller.com
```

##### Finalising changes:

run: **`vlab update_one service=unificontroller`**

### SUBDOMAIN
*Default: unificontroller* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set unificontroller.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=unificontroller`**

### VERSION
*Default: {{  unificontroller.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set unificontroller.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
unificontroller
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=unificontroller`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
