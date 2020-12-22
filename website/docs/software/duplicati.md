---
id: duplicati
title: Duplicati
hide_title: true
hide_table_of_contents: false
sidebar_label: Duplicati
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Duplicati

[Duplicati](https://www.duplicati.com/) Free backup software to store encrypted backups online
For Windows, macOS and Linux.

![amd64](https://img.shields.io/badge/{% if not duplicati.amd64 %}untested{% else %}{{ duplicati.amd64 }}{% endif %}-amd64-{% if not duplicati.amd64 %}inactive{% elif duplicati.amd64 == "verified" %}success{% elif duplicati.amd64 == "supported" %}informational{% elif duplicati.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not duplicati.arm64 %}untested{% else %}{{ duplicati.arm64 }}{% endif %}-arm64-{% if not duplicati.arm64 %}inactive{% elif duplicati.arm64 == "verified" %}success{% elif duplicati.arm64 == "supported" %}informational{% elif duplicati.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not duplicati.armv7 %}untested{% else %}{{ duplicati.armv7 }}{% endif %}-armv7-{% if not duplicati.armv7 %}inactive{% elif duplicati.armv7 == "verified" %}success{% elif duplicati.armv7 == "supported" %}informational{% elif duplicati.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ duplicati.version }}

## SETUP

### Enabling duplicati

#### Command:

**`vlab set duplicati.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=duplicati`**

## FIRST RUN

> Note: The password for Duplicati is configured to use the `default_password` set during the initail `make config` (which is then subsequently stored in vault.yml)

## ACCESS

duplicati (HTTPS) link: [https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)
duplicati (HTTP) link: [http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ duplicati.subdomain + "." + tor_domain }}/](http://{{ duplicati.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set duplicati.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set duplicati.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set duplicati.domain duplicati.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  domain: duplicati.com
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### SUBDOMAIN
*Default: duplicati* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set duplicati.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### VERSION
*Default: {{  duplicati.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set duplicati.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
