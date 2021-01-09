---
id: calibre
title: Calibre
hide_title: true
hide_table_of_contents: false
sidebar_label: Calibre
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Calibre

[Calibre](https://calibre-ebook.com) Ebook management system.

[Calibre Web](https://github.com/janeczku/calibre-web) Web app for accessing ebook library

![amd64](https://img.shields.io/badge/{% if not calibre.amd64 %}untested{% else %}{{ calibre.amd64 }}{% endif %}-amd64-{% if not calibre.amd64 %}inactive{% elif calibre.amd64 == "verified" %}success{% elif calibre.amd64 == "supported" %}informational{% elif calibre.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not calibre.arm64 %}untested{% else %}{{ calibre.arm64 }}{% endif %}-arm64-{% if not calibre.arm64 %}inactive{% elif calibre.arm64 == "verified" %}success{% elif calibre.arm64 == "supported" %}informational{% elif calibre.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not calibre.armv7 %}untested{% else %}{{ calibre.armv7 }}{% endif %}-armv7-{% if not calibre.armv7 %}inactive{% elif calibre.armv7 == "verified" %}success{% elif calibre.armv7 == "supported" %}informational{% elif calibre.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image Calibre Server:** lmorel3/calibre-alpine <br />
**Docker Image Calibre Web:** technosoft2000/calibre-web <br />
**Current Image Calibre Server Version:** {{ calibre.server_version }} <br />
**Current Image Calibre Web Version:** {{ calibre.version }}

## SETUP

### Enabling and customizing calibre

#### Command:

**`vlab service setup -s calibre`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
calibre
  enable: {{ calibre.version }}
  hsts: {{ calibre.hsts }}
  auth: {{ calibre.auth }}
  domain: {{ calibre.domain }}
  subdomain: {{ calibre.subdomain }}
  version: {{ calibre.version }}
```

#### Finalising changes:

run: **`vlab update -s calibre`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ calibre.domain }}/admin*

Create an account with your desired username; as this is the first user, calibre makes this account the administrator.

## ACCESS

AdGuard Home (HTTPS) link: [https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)
AdGuard Home (HTTP) link: [http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ calibre.subdomain + "." + tor_domain }}/](http://{{ calibre.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
