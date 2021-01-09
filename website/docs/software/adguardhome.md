---
id: adguardhome
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

# AdGuard Home

[AdGuard Home](https://adguard.com/en/adguard-home/overview.html) Network-wide software for blocking ads and tracking.

![amd64](https://img.shields.io/badge/{% if not adguardhome.amd64 %}untested{% else %}{{ adguardhome.amd64 }}{% endif %}-amd64-{% if not adguardhome.amd64 %}inactive{% elif adguardhome.amd64 == "verified" %}success{% elif adguardhome.amd64 == "supported" %}informational{% elif adguardhome.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not adguardhome.arm64 %}untested{% else %}{{ adguardhome.arm64 }}{% endif %}-arm64-{% if not adguardhome.arm64 %}inactive{% elif adguardhome.arm64 == "verified" %}success{% elif adguardhome.arm64 == "supported" %}informational{% elif adguardhome.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not adguardhome.armv7 %}untested{% else %}{{ adguardhome.armv7 }}{% endif %}-armv7-{% if not adguardhome.armv7 %}inactive{% elif adguardhome.armv7 == "verified" %}success{% elif adguardhome.armv7 == "supported" %}informational{% elif adguardhome.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** [adguard/adguardhome](https://registry.hub.docker.com/r/adguard/adguardhome) <br />
**Current Image Version:** {{ adguardhome.version }}

## SETUP

### Enabling and customizing adguardhome

#### Command:

**`vlab service setup -s adguardhome`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
adguardhome
  enable: {{ adguardhome.version }}
  hsts: {{ adguardhome.hsts }}
  auth: {{ adguardhome.auth }}
  domain: {{ adguardhome.domain }}
  subdomain: {{ adguardhome.subdomain }}
  version: {{ adguardhome.version }}
```

#### Finalising changes:

run: **`vlab update -s adguardhome`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ adguardhome.domain }}/admin*

Create an account with your desired username; as this is the first user, adguardhome makes this account the administrator.

## ACCESS

AdGuard Home (HTTPS) link: [https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)
AdGuard Home (HTTP) link: [http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ adguardhome.subdomain + "." + tor_domain }}/](http://{{ adguardhome.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
