---
id: barcodebuddy
title: Barcode Buddy
hide_title: true
hide_table_of_contents: false
sidebar_label: Barcode Buddy
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

![amd64](https://img.shields.io/badge/{% if not barcodebuddy.amd64 %}untested{% else %}{{ barcodebuddy.amd64 }}{% endif %}-amd64-{% if not barcodebuddy.amd64 %}inactive{% elif barcodebuddy.amd64 == "verified" %}success{% elif barcodebuddy.amd64 == "supported" %}informational{% elif barcodebuddy.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not barcodebuddy.arm64 %}untested{% else %}{{ barcodebuddy.arm64 }}{% endif %}-arm64-{% if not barcodebuddy.arm64 %}inactive{% elif barcodebuddy.arm64 == "verified" %}success{% elif barcodebuddy.arm64 == "supported" %}informational{% elif barcodebuddy.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not barcodebuddy.armv7 %}untested{% else %}{{ barcodebuddy.armv7 }}{% endif %}-armv7-{% if not barcodebuddy.armv7 %}inactive{% elif barcodebuddy.armv7 == "verified" %}success{% elif barcodebuddy.armv7 == "supported" %}informational{% elif barcodebuddy.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** f0rc3/barcodebuddy-docker <br />
**Current Image Version:** {{ barcodebuddy.version }}

## SETUP

### Enabling and customizing barcodebuddy

#### Command:

**`vlab service setup -s barcodebuddy`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
barcodebuddy
  enable: {{ barcodebuddy.version }}
  https_only: {{ barcodebuddy.https_only }}
  auth: {{ barcodebuddy.auth }}
  domain: {{ barcodebuddy.domain }}
  subdomain: {{ barcodebuddy.subdomain }}
  version: {{ barcodebuddy.version }}
```

#### Finalising changes:

run: **`vlab update -s barcodebuddy`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ barcodebuddy.domain }}/admin*

Create an account with your desired username; as this is the first user, barcodebuddy makes this account the administrator.

## ACCESS

Barcode Buddy (HTTPS) link: [https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)
Barcode Buddy (HTTP) link: [http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ barcodebuddy.subdomain + "." + tor_domain }}/](http://{{ barcodebuddy.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
