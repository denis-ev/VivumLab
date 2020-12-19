---
id: mylar
title: Mylar
hide_title: true
hide_table_of_contents: false
sidebar_label: Mylar
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Mylar

[mylar](https://github.com/evilhero/mylar) An automated Comic Book downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents

![amd64](https://img.shields.io/badge/{% if not mylar.amd64 %}untested{% else %}{{ mylar.amd64 }}{% endif %}-amd64-{% if not mylar.amd64 %}inactive{% elif mylar.amd64 == "verified" %}success{% elif mylar.amd64 == "supported" %}informational{% elif mylar.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mylar.arm64 %}untested{% else %}{{ mylar.arm64 }}{% endif %}-arm64-{% if not mylar.arm64 %}inactive{% elif mylar.arm64 == "verified" %}success{% elif mylar.arm64 == "supported" %}informational{% elif mylar.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mylar.armv7 %}untested{% else %}{{ mylar.armv7 }}{% endif %}-armv7-{% if not mylar.armv7 %}inactive{% elif mylar.armv7 == "verified" %}success{% elif mylar.armv7 == "supported" %}informational{% elif mylar.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mylar.version }}

## SETUP

### Enabling mylar

#### Command:

**`vlab set mylar.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mylar`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mylar.domain }}/admin*

Create an account with your desired username; as this is the first user, mylar makes this account the administrator.

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

3. run **`vlab update_one service=mylar`** to complete the changes


## ACCESS

mylar (HTTPS) link: [https://{% if mylar.domain %}{{ mylar.domain }}{% else %}{{ mylar.subdomain + "." + domain }}{% endif %}/](https://{% if mylar.domain %}{{ mylar.domain }}{% else %}{{ mylar.subdomain + "." + domain }}{% endif %}/)
mylar (HTTP) link: [http://{% if mylar.domain %}{{ mylar.domain }}{% else %}{{ mylar.subdomain + "." + domain }}{% endif %}/](http://{% if mylar.domain %}{{ mylar.domain }}{% else %}{{ mylar.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ mylar.subdomain + "." + tor_domain }}/](http://{{ mylar.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mylar.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mylar`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mylar.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mylar`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mylar.domain mylar.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  domain: mylar.com
```

##### Finalising changes:

run: **`vlab update_one service=mylar`**

### SUBDOMAIN
*Default: mylar* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mylar.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mylar`**

### VERSION
*Default: {{  mylar.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mylar.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mylar`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
