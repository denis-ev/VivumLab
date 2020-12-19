---
id: jellyfin
title: Jellyfin
hide_title: true
hide_table_of_contents: false
sidebar_label: Jellyfin
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Jellyfin

[Jellyfin](https://github.com/jellyfin/jellyfin) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![amd64](https://img.shields.io/badge/{% if not jellyfin.amd64 %}untested{% else %}{{ jellyfin.amd64 }}{% endif %}-amd64-{% if not jellyfin.amd64 %}inactive{% elif jellyfin.amd64 == "verified" %}success{% elif jellyfin.amd64 == "supported" %}informational{% elif jellyfin.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not jellyfin.arm64 %}untested{% else %}{{ jellyfin.arm64 }}{% endif %}-arm64-{% if not jellyfin.arm64 %}inactive{% elif jellyfin.arm64 == "verified" %}success{% elif jellyfin.arm64 == "supported" %}informational{% elif jellyfin.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not jellyfin.armv7 %}untested{% else %}{{ jellyfin.armv7 }}{% endif %}-armv7-{% if not jellyfin.armv7 %}inactive{% elif jellyfin.armv7 == "verified" %}success{% elif jellyfin.armv7 == "supported" %}informational{% elif jellyfin.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ jellyfin.version }}

## SETUP

### Enabling jellyfin

#### Command:

**`vlab set jellyfin.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=jellyfin`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ jellyfin.domain }}/admin*

Create an account with your desired username; as this is the first user, jellyfin makes this account the administrator.

### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file
2. make some changes


#### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=jellyfin`** to complete the changes


## ACCESS

jellyfin (HTTPS) link: [https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/)
jellyfin (HTTP) link: [http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ jellyfin.subdomain + "." + tor_domain }}/](http://{{ jellyfin.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set jellyfin.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set jellyfin.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set jellyfin.domain jellyfin.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  domain: jellyfin.com
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### SUBDOMAIN
*Default: jellyfin* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set jellyfin.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### VERSION
*Default: {{  jellyfin.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set jellyfin.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
