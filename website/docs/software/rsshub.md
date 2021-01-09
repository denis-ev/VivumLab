---
id: rsshub
title: RSSHub
hide_title: true
hide_table_of_contents: false
sidebar_label: RSSHub
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# RSSHub

[RSSHub](https://docs.rsshub.app/en/) RSSHub is an open source, easy to use, and extensible RSS feed aggregator, it's capable of generating RSS feeds from pretty much everything.

![amd64](https://img.shields.io/badge/{% if not rsshub.amd64 %}untested{% else %}{{ rsshub.amd64 }}{% endif %}-amd64-{% if not rsshub.amd64 %}inactive{% elif rsshub.amd64 == "verified" %}success{% elif rsshub.amd64 == "supported" %}informational{% elif rsshub.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not rsshub.arm64 %}untested{% else %}{{ rsshub.arm64 }}{% endif %}-arm64-{% if not rsshub.arm64 %}inactive{% elif rsshub.arm64 == "verified" %}success{% elif rsshub.arm64 == "supported" %}informational{% elif rsshub.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not rsshub.armv7 %}untested{% else %}{{ rsshub.armv7 }}{% endif %}-armv7-{% if not rsshub.armv7 %}inactive{% elif rsshub.armv7 == "verified" %}success{% elif rsshub.armv7 == "supported" %}informational{% elif rsshub.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ rsshub.version }}

## SETUP

### Enabling rsshub

#### Command:

**`vlab set rsshub.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=rsshub`**

## FIRST RUN

Additional config can be set via environment variables within the docker-compose file. Full configuragtion details can be [found here](https://docs.rsshub.app/en/install/#configuration).

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

3. run **`vlab update_one service=rsshub`** to complete the changes


## ACCESS

rsshub (HTTPS) link: [https://{% if rsshub.domain %}{{ rsshub.domain }}{% else %}{{ rsshub.subdomain + "." + domain }}{% endif %}/](https://{% if rsshub.domain %}{{ rsshub.domain }}{% else %}{{ rsshub.subdomain + "." + domain }}{% endif %}/)
rsshub (HTTP) link: [http://{% if rsshub.domain %}{{ rsshub.domain }}{% else %}{{ rsshub.subdomain + "." + domain }}{% endif %}/](http://{% if rsshub.domain %}{{ rsshub.domain }}{% else %}{{ rsshub.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ rsshub.subdomain + "." + tor_domain }}/](http://{{ rsshub.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set rsshub.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=rsshub`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set rsshub.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=rsshub`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set rsshub.domain rsshub.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  domain: rsshub.com
```

##### Finalising changes:

run: **`vlab update_one service=rsshub`**

### SUBDOMAIN
*Default: rsshub* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set rsshub.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=rsshub`**

### VERSION
*Default: {{  rsshub.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set rsshub.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
rsshub
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=rsshub`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
