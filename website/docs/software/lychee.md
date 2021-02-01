---
id: lychee
title: Lychee
hide_title: true
hide_table_of_contents: false
sidebar_label: Lychee
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Lychee

[Lychee](https://lycheeorg.github.io/) Lightweight, self-hosted, easy-to-use photo management

![amd64](https://img.shields.io/badge/{% if not lychee.amd64 %}untested{% else %}{{ lychee.amd64 }}{% endif %}-amd64-{% if not lychee.amd64 %}inactive{% elif lychee.amd64 == "verified" %}success{% elif lychee.amd64 == "supported" %}informational{% elif lychee.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not lychee.arm64 %}untested{% else %}{{ lychee.arm64 }}{% endif %}-arm64-{% if not lychee.arm64 %}inactive{% elif lychee.arm64 == "verified" %}success{% elif lychee.arm64 == "supported" %}informational{% elif lychee.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not lychee.armv7 %}untested{% else %}{{ lychee.armv7 }}{% endif %}-armv7-{% if not lychee.armv7 %}inactive{% elif lychee.armv7 == "verified" %}success{% elif lychee.armv7 == "supported" %}informational{% elif lychee.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** https://hub.docker.com/r/lycheeorg/lychee <br />
**Current Image Version:** {{ lychee.version }}

## SETUP

### Enabling lychee

#### Command:

**`vlab set lychee.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lychee`**

## FIRST RUN

###### COMPLETING INSTANCE SETUP
On first run, an input box should appear, asking for a username and password. This will create the first user, whom is also the instance administrator.
Always consider creating a user account, separate from the initial user/ administrator account.

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

3. run **`vlab update_one service=lychee`** to complete the changes


## ACCESS

lychee (HTTPS) link: [https://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/](https://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/)
lychee (HTTP) link: [http://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/](http://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lychee.subdomain + "." + tor_domain }}/](http://{{ lychee.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lychee.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lychee.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lychee.domain lychee.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  domain: lychee.com
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### SUBDOMAIN
*Default: lychee* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lychee.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### VERSION
*Default: {{  lychee.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lychee.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

## Need more help?
Further information regarding services can be
 found. \
General Information can be found in the [documentation](https://vivumlab.com/docs). \
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
