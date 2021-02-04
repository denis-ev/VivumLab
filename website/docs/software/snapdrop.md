---
id: snapdrop
title: AdGuard Home
hide_title: true
hide_table_of_contents: false
sidebar_label: AdGuard Home
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# SnapDrop

[SnapDrop](https://snapdrop.net) Snapdrop: local file sharing in your browser. Inspired by Apple's Airdrop.

![amd64](https://img.shields.io/badge/{% if not snapdrop.amd64 %}untested{% else %}{{ snapdrop.amd64 }}{% endif %}-amd64-{% if not snapdrop.amd64 %}inactive{% elif snapdrop.amd64 == "verified" %}success{% elif snapdrop.amd64 == "supported" %}informational{% elif snapdrop.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not snapdrop.arm64 %}untested{% else %}{{ snapdrop.arm64 }}{% endif %}-arm64-{% if not snapdrop.arm64 %}inactive{% elif snapdrop.arm64 == "verified" %}success{% elif snapdrop.arm64 == "supported" %}informational{% elif snapdrop.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not snapdrop.armv7 %}untested{% else %}{{ snapdrop.armv7 }}{% endif %}-armv7-{% if not snapdrop.armv7 %}inactive{% elif snapdrop.armv7 == "verified" %}success{% elif snapdrop.armv7 == "supported" %}informational{% elif snapdrop.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ snapdrop.version }}

## SETUP

### Enabling and customizing snapdrop

#### Command:

**`vlab service setup -s snapdrop`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
snapdrop
  enable: {{ snapdrop.version }}
  hsts: {{ snapdrop.hsts }}
  auth: {{ snapdrop.auth }}
  domain: {{ snapdrop.domain }}
  subdomain: {{ snapdrop.subdomain }}
  version: {{ snapdrop.version }}
```

#### Finalising changes:

run: **`vlab update -s snapdrop`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ snapdrop.domain }}/admin*

Create an account with your desired username; as this is the first user, snapdrop makes this account the administrator.

## ACCESS

AdGuard Home (HTTPS) link: [https://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/](https://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/)
AdGuard Home (HTTP) link: [http://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/](http://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ snapdrop.subdomain + "." + tor_domain }}/](http://{{ snapdrop.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
