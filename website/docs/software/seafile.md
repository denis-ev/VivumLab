---
id: seafile
title: Seafile
hide_title: true
hide_table_of_contents: false
sidebar_label: Seafile
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Seafile

[Seafile](https://www.seafile.com/en/home/) Reliable and Performant File Sync and Share Solution

![amd64](https://img.shields.io/badge/{% if not seafile.amd64 %}untested{% else %}{{ seafile.amd64 }}{% endif %}-amd64-{% if not seafile.amd64 %}inactive{% elif seafile.amd64 == "verified" %}success{% elif seafile.amd64 == "supported" %}informational{% elif seafile.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not seafile.arm64 %}untested{% else %}{{ seafile.arm64 }}{% endif %}-arm64-{% if not seafile.arm64 %}inactive{% elif seafile.arm64 == "verified" %}success{% elif seafile.arm64 == "supported" %}informational{% elif seafile.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not seafile.armv7 %}untested{% else %}{{ seafile.armv7 }}{% endif %}-armv7-{% if not seafile.armv7 %}inactive{% elif seafile.armv7 == "verified" %}success{% elif seafile.armv7 == "supported" %}informational{% elif seafile.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ seafile.version }}

## SETUP

### Enabling and customizing seafile

#### Command:

**`vlab service seafile setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
seafile
  enable: {{ seafile.version }}
  hsts: {{ seafile.hsts }}
  auth: {{ seafile.auth }}
  domain: {{ seafile.domain }}
  subdomain: {{ seafile.subdomain }}
  version: {{ seafile.version }}
```

- after setting the appropriate service settings in `settings/decrypted.yml` to the desired value, run `vlab config encrypt --dev` to encrypt the settings again

#### Finalising changes:

run: **`vlab service seafile update`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ seafile.domain }}/admin*

Create an account with your desired username; as this is the first user, seafile makes this account the administrator.

## ACCESS

seafile (HTTPS) link: [https://{% if seafile.domain %}{{ seafile.domain }}{% else %}{{ seafile.subdomain + "." + domain }}{% endif %}/](https://{% if seafile.domain %}{{ seafile.domain }}{% else %}{{ seafile.subdomain + "." + domain }}{% endif %}/)
seafile (HTTP) link: [http://{% if seafile.domain %}{{ seafile.domain }}{% else %}{{ seafile.subdomain + "." + domain }}{% endif %}/](http://{% if seafile.domain %}{{ seafile.domain }}{% else %}{{ seafile.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ seafile.subdomain + "." + tor_domain }}/](http://{{ seafile.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
