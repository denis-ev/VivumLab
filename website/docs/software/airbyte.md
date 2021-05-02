---
id: airbyte
title: Airbyte
hide_title: true
hide_table_of_contents: false
sidebar_label: Airbyte
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Airbyte

[Airbyte](https://airbyte.io) Simple & extensible open-source data integration

![amd64](https://img.shields.io/badge/{% if not airbyte.amd64 %}untested{% else %}{{ airbyte.amd64 }}{% endif %}-amd64-{% if not airbyte.amd64 %}inactive{% elif airbyte.amd64 == "verified" %}success{% elif airbyte.amd64 == "supported" %}informational{% elif airbyte.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not airbyte.arm64 %}untested{% else %}{{ airbyte.arm64 }}{% endif %}-arm64-{% if not airbyte.arm64 %}inactive{% elif airbyte.arm64 == "verified" %}success{% elif airbyte.arm64 == "supported" %}informational{% elif airbyte.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not airbyte.armv7 %}untested{% else %}{{ airbyte.armv7 }}{% endif %}-armv7-{% if not airbyte.armv7 %}inactive{% elif airbyte.armv7 == "verified" %}success{% elif airbyte.armv7 == "supported" %}informational{% elif airbyte.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ airbyte.airbyteversion }}

## SETUP

### Enabling and customizing airbyte

#### Command:

**`vlab service setup -s airbyte`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
airbyte
  enable: {{ airbyte.enable | default(False) }}
  hsts: {{ airbyte.hsts | default(True) }}
  auth: {{ airbyte.auth | default(False) }}
  domain: {{ airbyte.domain | default(False) }}
  subdomain: {{ airbyte.subdomain | default("airbyte")}}
  airbyteversion: {{ airbyteversion | default("0.18.2-alpha")}}
  serverversion: {{ airbyte.serverversion | default("0.18.2-alpha") }}
  initversion: {{ airbyte.initversion | default("0.18.2-alpha") }}
  dbversion: {{ airbyte.dbversion | default("0.18.2-alpha") }}
  seedversion: {{ airbyte.seedversion | default("0.18.2-alpha") }}
  schedulerversion: {{ airbyte.schedulerversion | default("0.18.2-alpha") }}
  webappversion: {{ airbyte.webappversion | default("0.18.2-alpha") }}
  temporalversion: {{ airbyte.temporalversion | default("1.7.0") }}
  amd64: False
  arm64: False
  armv7: False
```

#### Finalising changes:

run: **`vlab update -s airbyte`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ airbyte.domain }}/admin*

Create an account with your desired username; as this is the first user, airbyte makes this account the administrator.

## ACCESS

airbyte (HTTPS) link: [https://{% if airbyte.domain %}{{ airbyte.domain }}{% else %}{{ airbyte.subdomain + "." + domain }}{% endif %}/](https://{% if airbyte.domain %}{{ airbyte.domain }}{% else %}{{ airbyte.subdomain + "." + domain }}{% endif %}/)
airbyte (HTTP) link: [http://{% if airbyte.domain %}{{ airbyte.domain }}{% else %}{{ airbyte.subdomain + "." + domain }}{% endif %}/](http://{% if airbyte.domain %}{{ airbyte.domain }}{% else %}{{ airbyte.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ airbyte.subdomain + "." + tor_domain }}/](http://{{ airbyte.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
