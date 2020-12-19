---
id: nodered
title: NodeRED
hide_title: true
hide_table_of_contents: false
sidebar_label: NodeRED
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# NodeRED

[NodeRED](https://nodered.org/) Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting ways.

![amd64](https://img.shields.io/badge/{% if not nodered.amd64 %}untested{% else %}{{ nodered.amd64 }}{% endif %}-amd64-{% if not nodered.amd64 %}inactive{% elif nodered.amd64 == "verified" %}success{% elif nodered.amd64 == "supported" %}informational{% elif nodered.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not nodered.arm64 %}untested{% else %}{{ nodered.arm64 }}{% endif %}-arm64-{% if not nodered.arm64 %}inactive{% elif nodered.arm64 == "verified" %}success{% elif nodered.arm64 == "supported" %}informational{% elif nodered.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not nodered.armv7 %}untested{% else %}{{ nodered.armv7 }}{% endif %}-armv7-{% if not nodered.armv7 %}inactive{% elif nodered.armv7 == "verified" %}success{% elif nodered.armv7 == "supported" %}informational{% elif nodered.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ nodered.version }}

## SETUP

### Enabling nodered

#### Command:

**`vlab set nodered.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=nodered`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ nodered.domain }}/admin*

Create an account with your desired username; as this is the first user, nodered makes this account the administrator.

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

3. run **`vlab update_one service=nodered`** to complete the changes


## ACCESS

nodered (HTTPS) link: [https://{% if nodered.domain %}{{ nodered.domain }}{% else %}{{ nodered.subdomain + "." + domain }}{% endif %}/](https://{% if nodered.domain %}{{ nodered.domain }}{% else %}{{ nodered.subdomain + "." + domain }}{% endif %}/)
nodered (HTTP) link: [http://{% if nodered.domain %}{{ nodered.domain }}{% else %}{{ nodered.subdomain + "." + domain }}{% endif %}/](http://{% if nodered.domain %}{{ nodered.domain }}{% else %}{{ nodered.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ nodered.subdomain + "." + tor_domain }}/](http://{{ nodered.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set nodered.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=nodered`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set nodered.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=nodered`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set nodered.domain nodered.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  domain: nodered.com
```

##### Finalising changes:

run: **`vlab update_one service=nodered`**

### SUBDOMAIN
*Default: nodered* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set nodered.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=nodered`**

### VERSION
*Default: {{  nodered.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set nodered.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
nodered
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=nodered`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
