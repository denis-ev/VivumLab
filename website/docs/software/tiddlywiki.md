---
id: tiddlywiki
title: TiddlyWiki
hide_title: true
hide_table_of_contents: false
sidebar_label: TiddlyWiki
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# TiddlyWiki

[TiddlyWiki](https://tiddlywiki.com) a unique non-linear notebook for capturing, organizing and sharing complex information

![amd64](https://img.shields.io/badge/{% if not tiddlywiki.amd64 %}untested{% else %}{{ tiddlywiki.amd64 }}{% endif %}-amd64-{% if not tiddlywiki.amd64 %}inactive{% elif tiddlywiki.amd64 == "verified" %}success{% elif tiddlywiki.amd64 == "supported" %}informational{% elif tiddlywiki.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not tiddlywiki.arm64 %}untested{% else %}{{ tiddlywiki.arm64 }}{% endif %}-arm64-{% if not tiddlywiki.arm64 %}inactive{% elif tiddlywiki.arm64 == "verified" %}success{% elif tiddlywiki.arm64 == "supported" %}informational{% elif tiddlywiki.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not tiddlywiki.armv7 %}untested{% else %}{{ tiddlywiki.armv7 }}{% endif %}-armv7-{% if not tiddlywiki.armv7 %}inactive{% elif tiddlywiki.armv7 == "verified" %}success{% elif tiddlywiki.armv7 == "supported" %}informational{% elif tiddlywiki.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ tiddlywiki.version }}

## SETUP

### Enabling tiddlywiki

#### Command:

**`vlab set tiddlywiki.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ tiddlywiki.domain }}/admin*

Create an account with your desired username; as this is the first user, tiddlywiki makes this account the administrator.

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

3. run **`vlab update_one service=tiddlywiki`** to complete the changes


## ACCESS

tiddlywiki (HTTPS) link: [https://{% if tiddlywiki.domain %}{{ tiddlywiki.domain }}{% else %}{{ tiddlywiki.subdomain + "." + domain }}{% endif %}/](https://{% if tiddlywiki.domain %}{{ tiddlywiki.domain }}{% else %}{{ tiddlywiki.subdomain + "." + domain }}{% endif %}/)
tiddlywiki (HTTP) link: [http://{% if tiddlywiki.domain %}{{ tiddlywiki.domain }}{% else %}{{ tiddlywiki.subdomain + "." + domain }}{% endif %}/](http://{% if tiddlywiki.domain %}{{ tiddlywiki.domain }}{% else %}{{ tiddlywiki.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ tiddlywiki.subdomain + "." + tor_domain }}/](http://{{ tiddlywiki.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set tiddlywiki.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set tiddlywiki.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set tiddlywiki.domain tiddlywiki.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  domain: tiddlywiki.com
```

##### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

### SUBDOMAIN
*Default: tiddlywiki* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set tiddlywiki.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

### VERSION
*Default: {{  tiddlywiki.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set tiddlywiki.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tiddlywiki
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=tiddlywiki`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
