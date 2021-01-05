---
id: shinobi
title: Shinobi
hide_title: true
hide_table_of_contents: false
sidebar_label: Shinobi
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Shinobi

[Shinobi](https://gitlab.com/Shinobi-Systems/Shinobi) The Next Generation in Open-Source Video Management Software with support for over 6000 IP and USB Cameras

![amd64](https://img.shields.io/badge/{% if not shinobi.amd64 %}untested{% else %}{{ shinobi.amd64 }}{% endif %}-amd64-{% if not shinobi.amd64 %}inactive{% elif shinobi.amd64 == "verified" %}success{% elif shinobi.amd64 == "supported" %}informational{% elif shinobi.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not shinobi.arm64 %}untested{% else %}{{ shinobi.arm64 }}{% endif %}-arm64-{% if not shinobi.arm64 %}inactive{% elif shinobi.arm64 == "verified" %}success{% elif shinobi.arm64 == "supported" %}informational{% elif shinobi.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not shinobi.armv7 %}untested{% else %}{{ shinobi.armv7 }}{% endif %}-armv7-{% if not shinobi.armv7 %}inactive{% elif shinobi.armv7 == "verified" %}success{% elif shinobi.armv7 == "supported" %}informational{% elif shinobi.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ shinobi.version }}

## SETUP

### Enabling shinobi

#### Command:

**`vlab set shinobi.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=shinobi`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

The login credentials are the default username and password you created for services during the initial config.

Follow the [Shinobi documentiton](https://shinobi.video/docs/start#content-account-management) for the rest of the setup and configuration.

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

3. run **`vlab update_one service=shinobi`** to complete the changes


## ACCESS

shinobi (HTTPS) link: [https://{% if shinobi.domain %}{{ shinobi.domain }}{% else %}{{ shinobi.subdomain + "." + domain }}{% endif %}/](https://{% if shinobi.domain %}{{ shinobi.domain }}{% else %}{{ shinobi.subdomain + "." + domain }}{% endif %}/)
shinobi (HTTP) link: [http://{% if shinobi.domain %}{{ shinobi.domain }}{% else %}{{ shinobi.subdomain + "." + domain }}{% endif %}/](http://{% if shinobi.domain %}{{ shinobi.domain }}{% else %}{{ shinobi.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ shinobi.subdomain + "." + tor_domain }}/](http://{{ shinobi.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set shinobi.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=shinobi`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set shinobi.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=shinobi`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set shinobi.domain shinobi.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  domain: shinobi.com
```

##### Finalising changes:

run: **`vlab update_one service=shinobi`**

### SUBDOMAIN
*Default: shinobi* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set shinobi.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=shinobi`**

### VERSION
*Default: {{  shinobi.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set shinobi.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
shinobi
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=shinobi`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
