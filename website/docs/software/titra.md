---
id: titra
title: titra
hide_title: true
hide_table_of_contents: false
sidebar_label: titra
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# titra

[titra](https://github.com/kromitgmbh/titra) modern open source project time tracking for freelancers and small teams

![amd64](https://img.shields.io/badge/{% if not titra.amd64 %}untested{% else %}{{ titra.amd64 }}{% endif %}-amd64-{% if not titra.amd64 %}inactive{% elif titra.amd64 == "verified" %}success{% elif titra.amd64 == "supported" %}informational{% elif titra.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not titra.arm64 %}untested{% else %}{{ titra.arm64 }}{% endif %}-arm64-{% if not titra.arm64 %}inactive{% elif titra.arm64 == "verified" %}success{% elif titra.arm64 == "supported" %}informational{% elif titra.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not titra.armv7 %}untested{% else %}{{ titra.armv7 }}{% endif %}-armv7-{% if not titra.armv7 %}inactive{% elif titra.armv7 == "verified" %}success{% elif titra.armv7 == "supported" %}informational{% elif titra.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** kromit/titra <br />
**Current Image Version:** {{ titra.version }}

## SETUP

### FIRST START (Important)

After enabling and running Titra it is important to register and claim the admin right.
This is done by registering and visiting `https://{% if titra.domain %}{{ titra.domain }}{% else %}{{ titra.subdomain + "." + domain }}{% endif %}/claim/admin`

### Enabling and customizing titra

#### Command:

**`vlab service titra setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
titra
  enable: {{ titra.version }}
  hsts: {{ titra.hsts }}
  auth: {{ titra.auth }}
  domain: {{ titra.domain }}
  subdomain: {{ titra.subdomain }}
  version: {{ titra.version }}
```

- after setting the appropriate service settings in `settings/decrypted.yml` to true, run `vlab config encrypt --dev` to encrypt the settings again

#### Finalising changes:

run: **`vlab service titra update`**

## ACCESS

titra (HTTPS) link: [https://{% if titra.domain %}{{ titra.domain }}{% else %}{{ titra.subdomain + "." + domain }}{% endif %}/](https://{% if titra.domain %}{{ titra.domain }}{% else %}{{ titra.subdomain + "." + domain }}{% endif %}/)
titra (HTTP) link: [http://{% if titra.domain %}{{ titra.domain }}{% else %}{{ titra.subdomain + "." + domain }}{% endif %}/](http://{% if titra.domain %}{{ titra.domain }}{% else %}{{ titra.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ titra.subdomain + "." + tor_domain }}/](http://{{ titra.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
