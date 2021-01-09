---
id: airsonic
title: Airsonic
hide_title: true
hide_table_of_contents: false
sidebar_label: Airsonic
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Airsonic

[Airsonic](https://airsonic.github.io/) is a free, web-based media streamer, providing ubiquitous access to your music.

![amd64](https://img.shields.io/badge/{% if not airsonic.amd64 %}untested{% else %}{{ airsonic.amd64 }}{% endif %}-amd64-{% if not airsonic.amd64 %}inactive{% elif airsonic.amd64 == "verified" %}success{% elif airsonic.amd64 == "supported" %}informational{% elif airsonic.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not airsonic.arm64 %}untested{% else %}{{ airsonic.arm64 }}{% endif %}-arm64-{% if not airsonic.arm64 %}inactive{% elif airsonic.arm64 == "verified" %}success{% elif airsonic.arm64 == "supported" %}informational{% elif airsonic.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not airsonic.armv7 %}untested{% else %}{{ airsonic.armv7 }}{% endif %}-armv7-{% if not airsonic.armv7 %}inactive{% elif airsonic.armv7 == "verified" %}success{% elif airsonic.armv7 == "supported" %}informational{% elif airsonic.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** linuxserver/airsonic <br />
**Current Image Version:** {{ airsonic.version }}

## SETUP

### Enabling and customizing airsonic

#### Command:

**`vlab service setup -s airsonic`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
airsonic
  enable: {{ airsonic.version }}
  hsts: {{ airsonic.hsts }}
  auth: {{ airsonic.auth }}
  domain: {{ airsonic.domain }}
  subdomain: {{ airsonic.subdomain }}
  version: {{ airsonic.version }}
```

#### Finalising changes:

run: **`vlab update -s airsonic`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ airsonic.domain }}/admin*

Create an account with your desired username; as this is the first user, airsonic makes this account the administrator.

## ACCESS

Airsonic (HTTPS) link: [https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)
Airsonic (HTTP) link: [http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ airsonic.subdomain + "." + tor_domain }}/](http://{{ airsonic.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
