---
id: docs
title: Docs
hide_title: true
hide_table_of_contents: false
sidebar_label: Docs
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Vivumlab Docs

[Docusaurus v2](https://v2.docusaurus.io) VivumLab Docs

![amd64](https://img.shields.io/badge/{% if not docs.amd64 %}untested{% else %}{{ docs.amd64 }}{% endif %}-amd64-{% if not docs.amd64 %}inactive{% elif docs.amd64 == "verified" %}success{% elif docs.amd64 == "supported" %}informational{% elif docs.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not docs.arm64 %}untested{% else %}{{ docs.arm64 }}{% endif %}-arm64-{% if not docs.arm64 %}inactive{% elif docs.arm64 == "verified" %}success{% elif docs.arm64 == "supported" %}informational{% elif docs.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not docs.armv7 %}untested{% else %}{{ docs.armv7 }}{% endif %}-armv7-{% if not docs.armv7 %}inactive{% elif docs.armv7 == "verified" %}success{% elif docs.armv7 == "supported" %}informational{% elif docs.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** [vivumlab/docusaurus](https://hub.docker.com/r/vivumlab/docusaurus) <br />
**Current Image Version:** {{ docs.version }}

## SETUP

### Enabling docs

#### Command:

**`vlab set docs.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=docs`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

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

3. run **`vlab update_one service=docs`** to complete the changes


## ACCESS

docs (HTTPS) link: [https://{% if docs.domain %}{{ docs.domain }}{% else %}{{ docs.subdomain + "." + domain }}{% endif %}/](https://{% if docs.domain %}{{ docs.domain }}{% else %}{{ docs.subdomain + "." + domain }}{% endif %}/) <br />
docs (HTTP) link: [http://{% if docs.domain %}{{ docs.domain }}{% else %}{{ docs.subdomain + "." + domain }}{% endif %}/](http://{% if docs.domain %}{{ docs.domain }}{% else %}{{ docs.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ docs.subdomain + "." + tor_domain }}/](http://{{ docs.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set docs.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=docs`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set docs.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=docs`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set docs.domain docs.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  domain: docs.com
```

##### Finalising changes:

run: **`vlab update_one service=docs`**

### SUBDOMAIN
*Default: docs* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set docs.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=docs`**

### VERSION
*Default: {{  docs.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set docs.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
docs
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=docs`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
