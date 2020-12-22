---
id: trilium
title: Trilium
hide_title: true
hide_table_of_contents: false
sidebar_label: Trilium
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Trilium

[Trilium](https://github.com/zadam/trilium) Build your personal knowledge base with Trilium Notes

![amd64](https://img.shields.io/badge/{% if not trilium.amd64 %}untested{% else %}{{ trilium.amd64 }}{% endif %}-amd64-{% if not trilium.amd64 %}inactive{% elif trilium.amd64 == "verified" %}success{% elif trilium.amd64 == "supported" %}informational{% elif trilium.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not trilium.arm64 %}untested{% else %}{{ trilium.arm64 }}{% endif %}-arm64-{% if not trilium.arm64 %}inactive{% elif trilium.arm64 == "verified" %}success{% elif trilium.arm64 == "supported" %}informational{% elif trilium.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not trilium.armv7 %}untested{% else %}{{ trilium.armv7 }}{% endif %}-armv7-{% if not trilium.armv7 %}inactive{% elif trilium.armv7 == "verified" %}success{% elif trilium.armv7 == "supported" %}informational{% elif trilium.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ trilium.version }}

## SETUP

### Enabling trilium

#### Command:

**`vlab set trilium.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=trilium`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ trilium.domain }}/admin*

Create an account with your desired username; as this is the first user, trilium makes this account the administrator.

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

3. run **`vlab update_one service=trilium`** to complete the changes


## ACCESS

trilium (HTTPS) link: [https://{% if trilium.domain %}{{ trilium.domain }}{% else %}{{ trilium.subdomain + "." + domain }}{% endif %}/](https://{% if trilium.domain %}{{ trilium.domain }}{% else %}{{ trilium.subdomain + "." + domain }}{% endif %}/)
trilium (HTTP) link: [http://{% if trilium.domain %}{{ trilium.domain }}{% else %}{{ trilium.subdomain + "." + domain }}{% endif %}/](http://{% if trilium.domain %}{{ trilium.domain }}{% else %}{{ trilium.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ trilium.subdomain + "." + tor_domain }}/](http://{{ trilium.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set trilium.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=trilium`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set trilium.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=trilium`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set trilium.domain trilium.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  domain: trilium.com
```

##### Finalising changes:

run: **`vlab update_one service=trilium`**

### SUBDOMAIN
*Default: trilium* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set trilium.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=trilium`**

### VERSION
*Default: {{  trilium.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set trilium.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
trilium
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=trilium`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
