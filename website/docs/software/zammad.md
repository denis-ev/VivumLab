---
id: zammad
title: Zammad
hide_title: true
hide_table_of_contents: false
sidebar_label: Zammad
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Zammad

[Zammad](https://zammad.org/) Zammad is a web-based, open source user support/ticketing solution.

![amd64](https://img.shields.io/badge/{% if not zammad.amd64 %}untested{% else %}{{ zammad.amd64 }}{% endif %}-amd64-{% if not zammad.amd64 %}inactive{% elif zammad.amd64 == "verified" %}success{% elif zammad.amd64 == "supported" %}informational{% elif zammad.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not zammad.arm64 %}untested{% else %}{{ zammad.arm64 }}{% endif %}-arm64-{% if not zammad.arm64 %}inactive{% elif zammad.arm64 == "verified" %}success{% elif zammad.arm64 == "supported" %}informational{% elif zammad.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not zammad.armv7 %}untested{% else %}{{ zammad.armv7 }}{% endif %}-armv7-{% if not zammad.armv7 %}inactive{% elif zammad.armv7 == "verified" %}success{% elif zammad.armv7 == "supported" %}informational{% elif zammad.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ zammad.version }}

## Requirements Hardware

##### For Zammad and a database server like PostgreSQL we recommend at least:
 - 2 CPU cores
 - 4 GB of RAM (+4 GB if you want to run Elasticsearch on the same server)

##### For optimal performance up to 40 agents:
 - 4 CPU cores
 - 6 GB of RAM (+6 GB if you want to run Elasticsearch on the same server)

Of course at the end it depends on acutal load of concurent agents and data traffic.

## SETUP

### Enabling zammad

#### Command:

**`vlab set zammad.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=zammad`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ zammad.domain }}/admin*

Create an account with your desired username; as this is the first user, zammad makes this account the administrator.

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

3. run **`vlab update_one service=zammad`** to complete the changes


## ACCESS

zammad (HTTPS) link: [https://{% if zammad.domain %}{{ zammad.domain }}{% else %}{{ zammad.subdomain + "." + domain }}{% endif %}/](https://{% if zammad.domain %}{{ zammad.domain }}{% else %}{{ zammad.subdomain + "." + domain }}{% endif %}/)
zammad (HTTP) link: [http://{% if zammad.domain %}{{ zammad.domain }}{% else %}{{ zammad.subdomain + "." + domain }}{% endif %}/](http://{% if zammad.domain %}{{ zammad.domain }}{% else %}{{ zammad.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ zammad.subdomain + "." + tor_domain }}/](http://{{ zammad.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set zammad.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=zammad`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set zammad.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=zammad`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set zammad.domain zammad.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  domain: zammad.com
```

##### Finalising changes:

run: **`vlab update_one service=zammad`**

### SUBDOMAIN
*Default: zammad* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set zammad.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=zammad`**

### VERSION
*Default: {{  zammad.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set zammad.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zammad
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=zammad`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
