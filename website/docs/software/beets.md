---
id: beets
title: Beets
hide_title: true
hide_table_of_contents: false
sidebar_label: Beets
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Beets

[Beets](https://beets.io) Beets is the media library management system for obsessive-compulsive music geeks.

![amd64](https://img.shields.io/badge/{% if not beets.amd64 %}untested{% else %}{{ beets.amd64 }}{% endif %}-amd64-{% if not beets.amd64 %}inactive{% elif beets.amd64 == "verified" %}success{% elif beets.amd64 == "supported" %}informational{% elif beets.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not beets.arm64 %}untested{% else %}{{ beets.arm64 }}{% endif %}-arm64-{% if not beets.arm64 %}inactive{% elif beets.arm64 == "verified" %}success{% elif beets.arm64 == "supported" %}informational{% elif beets.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not beets.armv7 %}untested{% else %}{{ beets.armv7 }}{% endif %}-armv7-{% if not beets.armv7 %}inactive{% elif beets.armv7 == "verified" %}success{% elif beets.armv7 == "supported" %}informational{% elif beets.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** linuxserver/beets <br />
**Current Image Version:** {{ beets.version }}

## SETUP

### Enabling and customizing beets

#### Command:

**`vlab service setup -s beets`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
beets
  enable: {{ beets.version }}
  hsts: {{ beets.hsts }}
  auth: {{ beets.auth }}
  domain: {{ beets.domain }}
  subdomain: {{ beets.subdomain }}
  version: {{ beets.version }}
```

#### Finalising changes:

run: **`vlab update -s beets`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ beets.domain }}/admin*

Create an account with your desired username; as this is the first user, beets makes this account the administrator.

## ACCESS

Beets (HTTPS) link: [https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)
Beets (HTTP) link: [http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ beets.subdomain + "." + tor_domain }}/](http://{{ beets.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
