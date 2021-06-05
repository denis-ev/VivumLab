---
id: nocodb
title: NocoDB
hide_title: true
hide_table_of_contents: false
sidebar_label: NocoDB
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# NocoDB

[NocoDB](https://github.com/nocodb/nocodb) Open Source AirTable alternative

![amd64](https://img.shields.io/badge/{% if not nocodb.amd64 %}untested{% else %}{{ nocodb.amd64 }}{% endif %}-amd64-{% if not nocodb.amd64 %}inactive{% elif nocodb.amd64 == "verified" %}success{% elif nocodb.amd64 == "supported" %}informational{% elif nocodb.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not nocodb.arm64 %}untested{% else %}{{ nocodb.arm64 }}{% endif %}-arm64-{% if not nocodb.arm64 %}inactive{% elif nocodb.arm64 == "verified" %}success{% elif nocodb.arm64 == "supported" %}informational{% elif nocodb.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not nocodb.armv7 %}untested{% else %}{{ nocodb.armv7 }}{% endif %}-armv7-{% if not nocodb.armv7 %}inactive{% elif nocodb.armv7 == "verified" %}success{% elif nocodb.armv7 == "supported" %}informational{% elif nocodb.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ nocodb.version }}

## SETUP

### Enabling and customizing nocodb

#### Command:

**`vlab service nocodb setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
nocodb
  enable: {{ nocodb.version }}
  hsts: {{ nocodb.hsts }}
  auth: {{ nocodb.auth }}
  domain: {{ nocodb.domain }}
  subdomain: {{ nocodb.subdomain }}
  version: {{ nocodb.version }}
```

- after setting the appropriate service settings in `settings/decrypted.yml` to the desired value, run `vlab config encrypt --dev` to encrypt the settings again

#### Finalising changes:

run: **`vlab service nocodb update`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ nocodb.domain }}/admin*

Create an account with your desired username; as this is the first user, nocodb makes this account the administrator.

## ACCESS

nocodb (HTTPS) link: [https://{% if nocodb.domain %}{{ nocodb.domain }}{% else %}{{ nocodb.subdomain + "." + domain }}{% endif %}/](https://{% if nocodb.domain %}{{ nocodb.domain }}{% else %}{{ nocodb.subdomain + "." + domain }}{% endif %}/)
nocodb (HTTP) link: [http://{% if nocodb.domain %}{{ nocodb.domain }}{% else %}{{ nocodb.subdomain + "." + domain }}{% endif %}/](http://{% if nocodb.domain %}{{ nocodb.domain }}{% else %}{{ nocodb.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ nocodb.subdomain + "." + tor_domain }}/](http://{{ nocodb.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
