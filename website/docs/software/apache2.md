---
id: apache2
title: Apache 2
hide_title: true
hide_table_of_contents: false
sidebar_label: Apache 2
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Apache 2

[Apache 2](https://httpd.apache.org/) is a free web server.

![amd64](https://img.shields.io/badge/{% if not apache2.amd64 %}untested{% else %}{{ apache2.amd64 }}{% endif %}-amd64-{% if not apache2.amd64 %}inactive{% elif apache2.amd64 == "verified" %}success{% elif apache2.amd64 == "supported" %}informational{% elif apache2.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not apache2.arm64 %}untested{% else %}{{ apache2.arm64 }}{% endif %}-arm64-{% if not apache2.arm64 %}inactive{% elif apache2.arm64 == "verified" %}success{% elif apache2.arm64 == "supported" %}informational{% elif apache2.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not apache2.armv7 %}untested{% else %}{{ apache2.armv7 }}{% endif %}-armv7-{% if not apache2.armv7 %}inactive{% elif apache2.armv7 == "verified" %}success{% elif apache2.armv7 == "supported" %}informational{% elif apache2.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** httpd <br />
**Current Image Version:** {{ apache2.version }}

## SETUP

### Enabling and customizing apache2

#### Command:

**`vlab service setup -s apache2`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
apache2
  enable: {{ apache2.version }}
  https_only: {{ apache2.https_only }}
  auth: {{ apache2.auth }}
  domain: {{ apache2.domain }}
  subdomain: {{ apache2.subdomain }}
  version: {{ apache2.version }}
```

#### Finalising changes:

run: **`vlab update -s apache2`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ apache2.domain }}/admin*

Create an account with your desired username; as this is the first user, apache2 makes this account the administrator.

## ACCESS

Apache2 (HTTPS) link: [https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)
Apache2 (HTTP) link: [http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ apache2.subdomain + "." + tor_domain }}/](http://{{ apache2.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
