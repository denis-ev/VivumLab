---
id: elkstack
title: ELK Stack
hide_title: true
hide_table_of_contents: false
sidebar_label: ELK Stack
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# ELK Stack

[ELK Stack](https://github.com/deviantony/docker-elk) Elastic Search, Logstash and Kibana

![amd64](https://img.shields.io/badge/{% if not elkstack.amd64 %}untested{% else %}{{ elkstack.amd64 }}{% endif %}-amd64-{% if not elkstack.amd64 %}inactive{% elif elkstack.amd64 == "verified" %}success{% elif elkstack.amd64 == "supported" %}informational{% elif elkstack.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not elkstack.arm64 %}untested{% else %}{{ elkstack.arm64 }}{% endif %}-arm64-{% if not elkstack.arm64 %}inactive{% elif elkstack.arm64 == "verified" %}success{% elif elkstack.arm64 == "supported" %}informational{% elif elkstack.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not elkstack.armv7 %}untested{% else %}{{ elkstack.armv7 }}{% endif %}-armv7-{% if not elkstack.armv7 %}inactive{% elif elkstack.armv7 == "verified" %}success{% elif elkstack.armv7 == "supported" %}informational{% elif elkstack.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ elkstack.version }}

## SETUP

### Enabling elkstack

#### Command:

**`vlab set elkstack.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=elkstack`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ elkstack.domain }}/admin*

Create an account with your desired username; as this is the first user, elkstack makes this account the administrator.

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

3. run **`vlab update_one service=elkstack`** to complete the changes


## ACCESS

elkstack (HTTPS) link: [https://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/](https://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/)
elkstack (HTTP) link: [http://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/](http://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ elkstack.subdomain + "." + tor_domain }}/](http://{{ elkstack.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set elkstack.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=elkstack`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set elkstack.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=elkstack`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set elkstack.domain elkstack.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  domain: elkstack.com
```

##### Finalising changes:

run: **`vlab update_one service=elkstack`**

### SUBDOMAIN
*Default: elkstack* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set elkstack.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=elkstack`**

### VERSION
*Default: {{  elkstack.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set elkstack.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
elkstack
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=elkstack`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
