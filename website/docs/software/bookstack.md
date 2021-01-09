---
id: bookstack
title: Bookstack
hide_title: true
hide_table_of_contents: false
sidebar_label: Bookstack
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Bookstack

[Bookstack](https://www.bookstackapp.com/) Simple & Free Wiki Software

![amd64](https://img.shields.io/badge/{% if not bookstack.amd64 %}untested{% else %}{{ bookstack.amd64 }}{% endif %}-amd64-{% if not bookstack.amd64 %}inactive{% elif bookstack.amd64 == "verified" %}success{% elif bookstack.amd64 == "supported" %}informational{% elif bookstack.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not bookstack.arm64 %}untested{% else %}{{ bookstack.arm64 }}{% endif %}-arm64-{% if not bookstack.arm64 %}inactive{% elif bookstack.arm64 == "verified" %}success{% elif bookstack.arm64 == "supported" %}informational{% elif bookstack.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not bookstack.armv7 %}untested{% else %}{{ bookstack.armv7 }}{% endif %}-armv7-{% if not bookstack.armv7 %}inactive{% elif bookstack.armv7 == "verified" %}success{% elif bookstack.armv7 == "supported" %}informational{% elif bookstack.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** solidnerd/bookstack <br />
**Current Image Version:** {{ bookstack.version }}

## SETUP

### Enabling and customizing bookstack

#### Command:

**`vlab service setup -s bookstack`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
bookstack
  enable: {{ bookstack.version }}
  hsts: {{ bookstack.hsts }}
  auth: {{ bookstack.auth }}
  domain: {{ bookstack.domain }}
  subdomain: {{ bookstack.subdomain }}
  version: {{ bookstack.version }}
```

#### Finalising changes:

run: **`vlab update -s bookstack`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bookstack.domain }}/admin*

Create an account with your desired username; as this is the first user, bookstack makes this account the administrator.

## ACCESS

Bookstack (HTTPS) link: [https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)
Bookstack (HTTP) link: [http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bookstack.subdomain + "." + tor_domain }}/](http://{{ bookstack.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
