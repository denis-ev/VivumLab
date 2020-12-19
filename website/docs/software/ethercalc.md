---
id: ethercalc
title: EtherCalc
hide_title: true
hide_table_of_contents: false
sidebar_label: EtherCalc
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# EtherCalc

[EtherCalc](https://ethercalc.net) EtherCalc is a web spreadsheet

![amd64](https://img.shields.io/badge/{% if not ethercalc.amd64 %}untested{% else %}{{ ethercalc.amd64 }}{% endif %}-amd64-{% if not ethercalc.amd64 %}inactive{% elif ethercalc.amd64 == "verified" %}success{% elif ethercalc.amd64 == "supported" %}informational{% elif ethercalc.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not ethercalc.arm64 %}untested{% else %}{{ ethercalc.arm64 }}{% endif %}-arm64-{% if not ethercalc.arm64 %}inactive{% elif ethercalc.arm64 == "verified" %}success{% elif ethercalc.arm64 == "supported" %}informational{% elif ethercalc.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not ethercalc.armv7 %}untested{% else %}{{ ethercalc.armv7 }}{% endif %}-armv7-{% if not ethercalc.armv7 %}inactive{% elif ethercalc.armv7 == "verified" %}success{% elif ethercalc.armv7 == "supported" %}informational{% elif ethercalc.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ ethercalc.version }}

## SETUP

### Enabling ethercalc

#### Command:

**`vlab set ethercalc.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ethercalc`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ ethercalc.domain }}/admin*

Create an account with your desired username; as this is the first user, ethercalc makes this account the administrator.

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

3. run **`vlab update_one service=ethercalc`** to complete the changes


## ACCESS

ethercalc (HTTPS) link: [https://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/](https://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/)
ethercalc (HTTP) link: [http://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/](http://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ethercalc.subdomain + "." + tor_domain }}/](http://{{ ethercalc.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ethercalc.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ethercalc`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set ethercalc.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ethercalc`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ethercalc.domain ethercalc.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  domain: ethercalc.com
```

##### Finalising changes:

run: **`vlab update_one service=ethercalc`**

### SUBDOMAIN
*Default: ethercalc* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ethercalc.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ethercalc`**

### VERSION
*Default: {{  ethercalc.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ethercalc.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ethercalc
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ethercalc`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
