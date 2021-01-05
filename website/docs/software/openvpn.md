---
id: openvpn
title: OpenVPN
hide_title: true
hide_table_of_contents: false
sidebar_label: OpenVPN
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# OpenVPN

[Openvpn](https://openvpn.net/) A Business VPN to Access Network Resources Securely

![amd64](https://img.shields.io/badge/{% if not openvpn.amd64 %}untested{% else %}{{ openvpn.amd64 }}{% endif %}-amd64-{% if not openvpn.amd64 %}inactive{% elif openvpn.amd64 == "verified" %}success{% elif openvpn.amd64 == "supported" %}informational{% elif openvpn.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not openvpn.arm64 %}untested{% else %}{{ openvpn.arm64 }}{% endif %}-arm64-{% if not openvpn.arm64 %}inactive{% elif openvpn.arm64 == "verified" %}success{% elif openvpn.arm64 == "supported" %}informational{% elif openvpn.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not openvpn.armv7 %}untested{% else %}{{ openvpn.armv7 }}{% endif %}-armv7-{% if not openvpn.armv7 %}inactive{% elif openvpn.armv7 == "verified" %}success{% elif openvpn.armv7 == "supported" %}informational{% elif openvpn.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ openvpn.version }}

## SETUP

### Enabling openvpn

#### Command:

**`vlab set openvpn.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=openvpn`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ openvpn.domain }}/admin*

Create an account with your desired username; as this is the first user, openvpn makes this account the administrator.

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

3. run **`vlab update_one service=openvpn`** to complete the changes


## ACCESS

openvpn (HTTPS) link: [https://{% if openvpn.domain %}{{ openvpn.domain }}{% else %}{{ openvpn.subdomain + "." + domain }}{% endif %}/](https://{% if openvpn.domain %}{{ openvpn.domain }}{% else %}{{ openvpn.subdomain + "." + domain }}{% endif %}/)
openvpn (HTTP) link: [http://{% if openvpn.domain %}{{ openvpn.domain }}{% else %}{{ openvpn.subdomain + "." + domain }}{% endif %}/](http://{% if openvpn.domain %}{{ openvpn.domain }}{% else %}{{ openvpn.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ openvpn.subdomain + "." + tor_domain }}/](http://{{ openvpn.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set openvpn.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=openvpn`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set openvpn.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=openvpn`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set openvpn.domain openvpn.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  domain: openvpn.com
```

##### Finalising changes:

run: **`vlab update_one service=openvpn`**

### SUBDOMAIN
*Default: openvpn* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set openvpn.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=openvpn`**

### VERSION
*Default: {{  openvpn.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set openvpn.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openvpn
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=openvpn`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
