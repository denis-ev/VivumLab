---
id: PackageFileName
title: PackageTitleCase
hide_title: true
hide_table_of_contents: false
sidebar_label: PackageTitleCase
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# PackageTitleCase

[PackageTitleCase](PackageURL) PackageOneLiner

![amd64](https://img.shields.io/badge/{% if not PackageFileName.amd64 %}untested{% else %}{{ PackageFileName.amd64 }}{% endif %}-amd64-{% if not PackageFileName.amd64 %}inactive{% elif PackageFileName.amd64 == "verified" %}success{% elif PackageFileName.amd64 == "supported" %}informational{% elif PackageFileName.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not PackageFileName.arm64 %}untested{% else %}{{ PackageFileName.arm64 }}{% endif %}-arm64-{% if not PackageFileName.arm64 %}inactive{% elif PackageFileName.arm64 == "verified" %}success{% elif PackageFileName.arm64 == "supported" %}informational{% elif PackageFileName.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not PackageFileName.armv7 %}untested{% else %}{{ PackageFileName.armv7 }}{% endif %}-armv7-{% if not PackageFileName.armv7 %}inactive{% elif PackageFileName.armv7 == "verified" %}success{% elif PackageFileName.armv7 == "supported" %}informational{% elif PackageFileName.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ PackageFileName.version }}

## SETUP

### Enabling and customizing PackageFileName

#### Command:

**`vlab service PackageFileName setup`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
PackageFileName
  enable: {{ PackageFileName.version }}
  hsts: {{ PackageFileName.hsts }}
  auth: {{ PackageFileName.auth }}
  domain: {{ PackageFileName.domain }}
  subdomain: {{ PackageFileName.subdomain }}
  version: {{ PackageFileName.version }}
```

- after setting the appropriate service settings in `settings/decrypted.yml` to the desired value, run `vlab config encrypt --dev` to encrypt the settings again

#### Finalising changes:

run: **`vlab service PackageFileName update`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ PackageFileName.domain }}/admin*

Create an account with your desired username; as this is the first user, PackageFileName makes this account the administrator.

## ACCESS

PackageFileName (HTTPS) link: [https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)
PackageFileName (HTTP) link: [http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ PackageFileName.subdomain + "." + tor_domain }}/](http://{{ PackageFileName.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
