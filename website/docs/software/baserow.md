---
id: baserow
title: Baserow
hide_title: true
hide_table_of_contents: false
sidebar_label: Baserow
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Baserow

[Baserow](baserow.io) Create your own database without technical experience. Our user friendly no-code tool gives you the powers of a developer without leaving your browser.

![amd64](https://img.shields.io/badge/{% if not baserow.amd64 %}untested{% else %}{{ baserow.amd64 }}{% endif %}-amd64-{% if not baserow.amd64 %}inactive{% elif baserow.amd64 == "verified" %}success{% elif baserow.amd64 == "supported" %}informational{% elif baserow.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not baserow.arm64 %}untested{% else %}{{ baserow.arm64 }}{% endif %}-arm64-{% if not baserow.arm64 %}inactive{% elif baserow.arm64 == "verified" %}success{% elif baserow.arm64 == "supported" %}informational{% elif baserow.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not baserow.armv7 %}untested{% else %}{{ baserow.armv7 }}{% endif %}-armv7-{% if not baserow.armv7 %}inactive{% elif baserow.armv7 == "verified" %}success{% elif baserow.armv7 == "supported" %}informational{% elif baserow.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ baserow.version }}

## SETUP

### Enabling and customizing baserow

#### Command:

**`vlab service baserow setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
baserow
  enable: {{ baserow.version }}
  hsts: {{ baserow.hsts }}
  auth: {{ baserow.auth }}
  domain: {{ baserow.domain }}
  subdomain: {{ baserow.subdomain }}
  version: {{ baserow.version }}
```

- after setting the appropriate service settings in `settings/decrypted.yml` to the desired value, run `vlab config encrypt --dev` to encrypt the settings again

#### Finalising changes:

run: **`vlab service baserow update`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ baserow.domain }}/admin*

Create an account with your desired username; as this is the first user, baserow makes this account the administrator.

## ACCESS

baserow (HTTPS) link: [https://{% if baserow.domain %}{{ baserow.domain }}{% else %}{{ baserow.subdomain + "." + domain }}{% endif %}/](https://{% if baserow.domain %}{{ baserow.domain }}{% else %}{{ baserow.subdomain + "." + domain }}{% endif %}/)
baserow (HTTP) link: [http://{% if baserow.domain %}{{ baserow.domain }}{% else %}{{ baserow.subdomain + "." + domain }}{% endif %}/](http://{% if baserow.domain %}{{ baserow.domain }}{% else %}{{ baserow.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ baserow.subdomain + "." + tor_domain }}/](http://{{ baserow.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
