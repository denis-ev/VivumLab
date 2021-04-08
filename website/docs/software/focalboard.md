---
id: focalboard
title: Focalboard
hide_title: true
hide_table_of_contents: false
sidebar_label: Focalboard
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Focalboard

[Focalboard](https://www.focalboard.com) Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana.

![amd64](https://img.shields.io/badge/{% if not focalboard.amd64 %}untested{% else %}{{ focalboard.amd64 }}{% endif %}-amd64-{% if not focalboard.amd64 %}inactive{% elif focalboard.amd64 == "verified" %}success{% elif focalboard.amd64 == "supported" %}informational{% elif focalboard.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not focalboard.arm64 %}untested{% else %}{{ focalboard.arm64 }}{% endif %}-arm64-{% if not focalboard.arm64 %}inactive{% elif focalboard.arm64 == "verified" %}success{% elif focalboard.arm64 == "supported" %}informational{% elif focalboard.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not focalboard.armv7 %}untested{% else %}{{ focalboard.armv7 }}{% endif %}-armv7-{% if not focalboard.armv7 %}inactive{% elif focalboard.armv7 == "verified" %}success{% elif focalboard.armv7 == "supported" %}informational{% elif focalboard.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** mattermost/focalboard <br />
**Current Image Version:** {{ focalboard.version }}

## SETUP

### Enabling and customizing focalboard

#### Command:

**`vlab service setup -s focalboard`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
focalboard
  enable: {{ focalboard.version }}
  hsts: {{ focalboard.hsts }}
  auth: {{ focalboard.auth }}
  domain: {{ focalboard.domain }}
  subdomain: {{ focalboard.subdomain }}
  version: {{ focalboard.version }}
```

#### Finalising changes:

run: **`vlab update -s focalboard`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ focalboard.domain }}/admin*

Create an account with your desired username; as this is the first user, focalboard makes this account the administrator.

## ACCESS

focalboard (HTTPS) link: [https://{% if focalboard.domain %}{{ focalboard.domain }}{% else %}{{ focalboard.subdomain + "." + domain }}{% endif %}/](https://{% if focalboard.domain %}{{ focalboard.domain }}{% else %}{{ focalboard.subdomain + "." + domain }}{% endif %}/)
focalboard (HTTP) link: [http://{% if focalboard.domain %}{{ focalboard.domain }}{% else %}{{ focalboard.subdomain + "." + domain }}{% endif %}/](http://{% if focalboard.domain %}{{ focalboard.domain }}{% else %}{{ focalboard.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ focalboard.subdomain + "." + tor_domain }}/](http://{{ focalboard.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
