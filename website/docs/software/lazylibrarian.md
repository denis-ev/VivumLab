---
id: lazylibrarian
title: LazyLibrarian
hide_title: true
hide_table_of_contents: false
sidebar_label: LazyLibrarian
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# LazyLibrarian

[Lazylibrarian](https://lazylibrarian.gitlab.io/) LazyLibrarian is a program to follow authors and grab metadata for all your digital reading needs.

![amd64](https://img.shields.io/badge/{% if not lazylibrarian.amd64 %}untested{% else %}{{ lazylibrarian.amd64 }}{% endif %}-amd64-{% if not lazylibrarian.amd64 %}inactive{% elif lazylibrarian.amd64 == "verified" %}success{% elif lazylibrarian.amd64 == "supported" %}informational{% elif lazylibrarian.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not lazylibrarian.arm64 %}untested{% else %}{{ lazylibrarian.arm64 }}{% endif %}-arm64-{% if not lazylibrarian.arm64 %}inactive{% elif lazylibrarian.arm64 == "verified" %}success{% elif lazylibrarian.arm64 == "supported" %}informational{% elif lazylibrarian.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not lazylibrarian.armv7 %}untested{% else %}{{ lazylibrarian.armv7 }}{% endif %}-armv7-{% if not lazylibrarian.armv7 %}inactive{% elif lazylibrarian.armv7 == "verified" %}success{% elif lazylibrarian.armv7 == "supported" %}informational{% elif lazylibrarian.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ lazylibrarian.version }}

## SETUP

### Enabling lazylibrarian

#### Command:

**`vlab set lazylibrarian.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ lazylibrarian.domain }}/admin*

Create an account with your desired username; as this is the first user, lazylibrarian makes this account the administrator.

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

3. run **`vlab update_one service=lazylibrarian`** to complete the changes


## ACCESS

lazylibrarian (HTTPS) link: [https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/)
lazylibrarian (HTTP) link: [http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lazylibrarian.subdomain + "." + tor_domain }}/](http://{{ lazylibrarian.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lazylibrarian.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lazylibrarian.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lazylibrarian.domain lazylibrarian.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  domain: lazylibrarian.com
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### SUBDOMAIN
*Default: lazylibrarian* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lazylibrarian.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### VERSION
*Default: {{  lazylibrarian.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lazylibrarian.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
