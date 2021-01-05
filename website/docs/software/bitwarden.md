---
id: bitwarden
title: Bitwarden
hide_title: true
hide_table_of_contents: false
sidebar_label: Bitwarden
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Bitwarden

[Bitwarden](https://bitwarden.com/) is an open source password manager. VivumLab utilizes an Open Source clone of the Bitwarden API server, [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs). This is primarily due to performance and complexity reasons. `bitwarden_rs` requires just one Docker container, whereas the official `Bitwarden` install requires something like six different containers.

![amd64](https://img.shields.io/badge/{% if not bitwarden.amd64 %}untested{% else %}{{ bitwarden.amd64 }}{% endif %}-amd64-{% if not bitwarden.amd64 %}inactive{% elif bitwarden.amd64 == "verified" %}success{% elif bitwarden.amd64 == "supported" %}informational{% elif bitwarden.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not bitwarden.arm64 %}untested{% else %}{{ bitwarden.arm64 }}{% endif %}-arm64-{% if not bitwarden.arm64 %}inactive{% elif bitwarden.arm64 == "verified" %}success{% elif bitwarden.arm64 == "supported" %}informational{% elif bitwarden.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not bitwarden.armv7 %}untested{% else %}{{ bitwarden.armv7 }}{% endif %}-armv7-{% if not bitwarden.armv7 %}inactive{% elif bitwarden.armv7 == "verified" %}success{% elif bitwarden.armv7 == "supported" %}informational{% elif bitwarden.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** bitwardenrs/server <br />
**Current Image Version:** {{ bitwarden.version }}

## SETUP

### Security Note

>Password managers like Bitwarden should only be used over HTTPS. Ensure you have valid certificates in place before beginning to use this service. You have been warned. :)

## SETUP

### Enabling and customizing bitwarden

#### Command:

**`vlab service setup -s bitwarden`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
bitwarden
  enable: {{ bitwarden.version }}
  https_only: {{ bitwarden.https_only }}
  auth: {{ bitwarden.auth }}
  domain: {{ bitwarden.domain }}
  subdomain: {{ bitwarden.subdomain }}
  version: {{ bitwarden.version }}
```

#### Finalising changes:

run: **`vlab update -s bitwarden`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bitwarden.domain }}/admin*

Create an account with your desired username; as this is the first user, bitwarden makes this account the administrator.

## ACCESS

Bitwarden (HTTPS) link: [https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)
Bitwarden (HTTP) link: [http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bitwarden.subdomain + "." + tor_domain }}/](http://{{ bitwarden.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
