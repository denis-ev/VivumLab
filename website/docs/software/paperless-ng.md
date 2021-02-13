---
id: paperlessng
title: paperlessng
hide_title: true
hide_table_of_contents: false
sidebar_label: paperlessng
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# paperlessng

[paperlessng](https://github.com/jonaswinkler/paperlessng) paperlessng is a fork of the original project, adding a new interface and many other changes under the hood.

![amd64](https://img.shields.io/badge/{% if not paperlessng.amd64 %}untested{% else %}{{ paperlessng.amd64 }}{% endif %}-amd64-{% if not paperlessng.amd64 %}inactive{% elif paperlessng.amd64 == "verified" %}success{% elif paperlessng.amd64 == "supported" %}informational{% elif paperlessng.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not paperlessng.arm64 %}untested{% else %}{{ paperlessng.arm64 }}{% endif %}-arm64-{% if not paperlessng.arm64 %}inactive{% elif paperlessng.arm64 == "verified" %}success{% elif paperlessng.arm64 == "supported" %}informational{% elif paperlessng.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not paperlessng.armv7 %}untested{% else %}{{ paperlessng.armv7 }}{% endif %}-armv7-{% if not paperlessng.armv7 %}inactive{% elif paperlessng.armv7 == "verified" %}success{% elif paperlessng.armv7 == "supported" %}informational{% elif paperlessng.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** jonaswinkler/paperless-ng <br />
**Current Image Version:** {{ paperlessng.version }}

## SETUP

### Enabling and customizing paperlessng

#### Command:

**`vlab service paperlessng setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
paperlessng
  enable: {{ paperlessng.version }}
  hsts: {{ paperlessng.hsts }}
  auth: {{ paperlessng.auth }}
  domain: {{ paperlessng.domain }}
  subdomain: {{ paperlessng.subdomain }}
  version: {{ paperlessng.version }}
```

#### Finalising changes:

run: **`vlab update -s paperlessng`**

## ACCESS

paperlessng (HTTPS) link: [https://{% if paperlessng.domain %}{{ paperlessng.domain }}{% else %}{{ paperlessng.subdomain + "." + domain }}{% endif %}/](https://{% if paperlessng.domain %}{{ paperlessng.domain }}{% else %}{{ paperlessng.subdomain + "." + domain }}{% endif %}/)
paperlessng (HTTP) link: [http://{% if paperlessng.domain %}{{ paperlessng.domain }}{% else %}{{ paperlessng.subdomain + "." + domain }}{% endif %}/](http://{% if paperlessng.domain %}{{ paperlessng.domain }}{% else %}{{ paperlessng.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ paperlessng.subdomain + "." + tor_domain }}/](http://{{ paperlessng.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
