---
id: transmission
title: Transmission
hide_title: true
hide_table_of_contents: false
sidebar_label: Transmission
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Transmission

[Transmission](https://transmissionbt.com/) is available for all your torrenting needs.

VivumLab uses [docker-transmission-openvpn](https://github.com/haugene/docker-transmission-openvpn) to only connect via a VPN. It includes Tinyproxy on port 8888 to provide proxy services over the OpenVPN client connection. To disable the OpenVPN functionality replace the line `image: haugene/transmission-openvpn` with `image: linuxserver/transmission` in `roles/transmission/templates/docker-compose.transmission.yml.j2` then run `vlab update_one service=transmission` from the root directory to update VivumLab with your new settings.

![amd64](https://img.shields.io/badge/{% if not transmission.amd64 %}untested{% else %}{{ transmission.amd64 }}{% endif %}-amd64-{% if not transmission.amd64 %}inactive{% elif transmission.amd64 == "verified" %}success{% elif transmission.amd64 == "supported" %}informational{% elif transmission.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not transmission.arm64 %}untested{% else %}{{ transmission.arm64 }}{% endif %}-arm64-{% if not transmission.arm64 %}inactive{% elif transmission.arm64 == "verified" %}success{% elif transmission.arm64 == "supported" %}informational{% elif transmission.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not transmission.armv7 %}untested{% else %}{{ transmission.armv7 }}{% endif %}-armv7-{% if not transmission.armv7 %}inactive{% elif transmission.armv7 == "verified" %}success{% elif transmission.armv7 == "supported" %}informational{% elif transmission.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ transmission.version }}

## SETUP

### Enabling transmission

#### Command:

**`vlab set transmission.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=transmission`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ transmission.domain }}/admin*

Create an account with your desired username; as this is the first user, transmission makes this account the administrator.

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

3. run **`vlab update_one service=transmission`** to complete the changes


## ACCESS

transmission (HTTPS) link: [https://{% if transmission.domain %}{{ transmission.domain }}{% else %}{{ transmission.subdomain + "." + domain }}{% endif %}/](https://{% if transmission.domain %}{{ transmission.domain }}{% else %}{{ transmission.subdomain + "." + domain }}{% endif %}/)
transmission (HTTP) link: [http://{% if transmission.domain %}{{ transmission.domain }}{% else %}{{ transmission.subdomain + "." + domain }}{% endif %}/](http://{% if transmission.domain %}{{ transmission.domain }}{% else %}{{ transmission.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ transmission.subdomain + "." + tor_domain }}/](http://{{ transmission.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set transmission.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=transmission`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set transmission.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=transmission`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set transmission.domain transmission.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  domain: transmission.com
```

##### Finalising changes:

run: **`vlab update_one service=transmission`**

### SUBDOMAIN
*Default: transmission* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set transmission.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=transmission`**

### VERSION
*Default: {{  transmission.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set transmission.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
transmission
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=transmission`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
