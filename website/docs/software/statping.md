---
id: statping
title: Statping
hide_title: true
hide_table_of_contents: false
sidebar_label: Statping
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Statping

[Statping](https://github.com/statping/statping) Web and App Status Monitoring for Any Type of Project

![amd64](https://img.shields.io/badge/{% if not statping.amd64 %}untested{% else %}{{ statping.amd64 }}{% endif %}-amd64-{% if not statping.amd64 %}inactive{% elif statping.amd64 == "verified" %}success{% elif statping.amd64 == "supported" %}informational{% elif statping.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not statping.arm64 %}untested{% else %}{{ statping.arm64 }}{% endif %}-arm64-{% if not statping.arm64 %}inactive{% elif statping.arm64 == "verified" %}success{% elif statping.arm64 == "supported" %}informational{% elif statping.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not statping.armv7 %}untested{% else %}{{ statping.armv7 }}{% endif %}-armv7-{% if not statping.armv7 %}inactive{% elif statping.armv7 == "verified" %}success{% elif statping.armv7 == "supported" %}informational{% elif statping.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ statping.version }}

## SETUP

### Enabling statping

#### Command:

**`vlab set statping.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=statping`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

To login, click on 'Dashboard' at the end of the page.
A default username and password named 'admin' is generated on first start, please change them.

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

3. run **`vlab update_one service=statping`** to complete the changes


## ACCESS

statping (HTTPS) link: [https://{% if statping.domain %}{{ statping.domain }}{% else %}{{ statping.subdomain + "." + domain }}{% endif %}/](https://{% if statping.domain %}{{ statping.domain }}{% else %}{{ statping.subdomain + "." + domain }}{% endif %}/)
statping (HTTP) link: [http://{% if statping.domain %}{{ statping.domain }}{% else %}{{ statping.subdomain + "." + domain }}{% endif %}/](http://{% if statping.domain %}{{ statping.domain }}{% else %}{{ statping.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ statping.subdomain + "." + tor_domain }}/](http://{{ statping.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set statping.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=statping`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set statping.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=statping`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set statping.domain statping.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  domain: statping.com
```

##### Finalising changes:

run: **`vlab update_one service=statping`**

### SUBDOMAIN
*Default: statping* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set statping.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=statping`**

### VERSION
*Default: {{  statping.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set statping.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
statping
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=statping`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
