---
id: mylar3
title: Mylar3
hide_title: true
hide_table_of_contents: false
sidebar_label: Mylar3
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Mylar3

[mylar3](https://github.com/mylar3/mylar3) An automated Comic Book downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents

![amd64](https://img.shields.io/badge/{% if not mylar3.amd64 %}untested{% else %}{{ mylar3.amd64 }}{% endif %}-amd64-{% if not mylar3.amd64 %}inactive{% elif mylar3.amd64 == "verified" %}success{% elif mylar3.amd64 == "supported" %}informational{% elif mylar3.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mylar3.arm64 %}untested{% else %}{{ mylar3.arm64 }}{% endif %}-arm64-{% if not mylar3.arm64 %}inactive{% elif mylar3.arm64 == "verified" %}success{% elif mylar3.arm64 == "supported" %}informational{% elif mylar3.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mylar3.armv7 %}untested{% else %}{{ mylar3.armv7 }}{% endif %}-armv7-{% if not mylar3.armv7 %}inactive{% elif mylar3.armv7 == "verified" %}success{% elif mylar3.armv7 == "supported" %}informational{% elif mylar3.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mylar3.version }}

## SETUP

### Enabling mylar3

#### Command:

**`vlab set mylar3.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mylar3`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mylar3.domain }}/admin*

Create an account with your desired username; as this is the first user, mylar3 makes this account the administrator.

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

3. run **`vlab update_one service=mylar3`** to complete the changes


## ACCESS

mylar3 (HTTPS) link: [https://{% if mylar3.domain %}{{ mylar3.domain }}{% else %}{{ mylar3.subdomain + "." + domain }}{% endif %}/](https://{% if mylar3.domain %}{{ mylar3.domain }}{% else %}{{ mylar3.subdomain + "." + domain }}{% endif %}/)
mylar3 (HTTP) link: [http://{% if mylar3.domain %}{{ mylar3.domain }}{% else %}{{ mylar3.subdomain + "." + domain }}{% endif %}/](http://{% if mylar3.domain %}{{ mylar3.domain }}{% else %}{{ mylar3.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ mylar3.subdomain + "." + tor_domain }}/](http://{{ mylar3.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mylar3.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mylar3`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mylar3.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mylar3`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mylar3.domain mylar3.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  domain: mylar3.com
```

##### Finalising changes:

run: **`vlab update_one service=mylar3`**

### SUBDOMAIN
*Default: mylar3* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mylar3.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mylar3`**

### VERSION
*Default: {{  mylar3.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mylar3.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mylar3
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mylar3`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
