---
id: pihole
title: Pi-hole
hide_title: true
hide_table_of_contents: false
sidebar_label: Pi-hole
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Pi-hole

[Pi-hole](http://pi-hole.net/) provides network-wide ad blocking via your own Linux hardware.

![amd64](https://img.shields.io/badge/{% if not pihole.amd64 %}untested{% else %}{{ pihole.amd64 }}{% endif %}-amd64-{% if not pihole.amd64 %}inactive{% elif pihole.amd64 == "verified" %}success{% elif pihole.amd64 == "supported" %}informational{% elif pihole.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not pihole.arm64 %}untested{% else %}{{ pihole.arm64 }}{% endif %}-arm64-{% if not pihole.arm64 %}inactive{% elif pihole.arm64 == "verified" %}success{% elif pihole.arm64 == "supported" %}informational{% elif pihole.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not pihole.armv7 %}untested{% else %}{{ pihole.armv7 }}{% endif %}-armv7-{% if not pihole.armv7 %}inactive{% elif pihole.armv7 == "verified" %}success{% elif pihole.armv7 == "supported" %}informational{% elif pihole.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ pihole.version }}

## SETUP

### Enabling pihole

#### Command:

**`vlab set pihole.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=pihole`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Login with the default password you set.

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

3. run **`vlab update_one service=pihole`** to complete the changes


## ACCESS

pihole (HTTPS) link: [https://{% if pihole.domain %}{{ pihole.domain }}{% else %}{{ pihole.subdomain + "." + domain }}{% endif %}/](https://{% if pihole.domain %}{{ pihole.domain }}{% else %}{{ pihole.subdomain + "." + domain }}{% endif %}/)
pihole (HTTP) link: [http://{% if pihole.domain %}{{ pihole.domain }}{% else %}{{ pihole.subdomain + "." + domain }}{% endif %}/](http://{% if pihole.domain %}{{ pihole.domain }}{% else %}{{ pihole.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ pihole.subdomain + "." + tor_domain }}/](http://{{ pihole.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pihole.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=pihole`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pihole.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=pihole`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set pihole.domain pihole.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  domain: pihole.com
```

##### Finalising changes:

run: **`vlab update_one service=pihole`**

### SUBDOMAIN
*Default: pihole* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set pihole.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=pihole`**

### VERSION
*Default: {{  pihole.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set pihole.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pihole
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=pihole`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
