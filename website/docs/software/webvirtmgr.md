---
id: webvirtmgr
title: WebVirtMgr
hide_title: true
hide_table_of_contents: false
sidebar_label: WebVirtMgr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# WebVirtMgr

[WebVirtMgr](https://github.com/retspen/webvirtmgr) is a complete Kernel Virtual Machine (KVM) hypervisor manager.

![amd64](https://img.shields.io/badge/{% if not webvirtmgr.amd64 %}untested{% else %}{{ webvirtmgr.amd64 }}{% endif %}-amd64-{% if not webvirtmgr.amd64 %}inactive{% elif webvirtmgr.amd64 == "verified" %}success{% elif webvirtmgr.amd64 == "supported" %}informational{% elif webvirtmgr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not webvirtmgr.arm64 %}untested{% else %}{{ webvirtmgr.arm64 }}{% endif %}-arm64-{% if not webvirtmgr.arm64 %}inactive{% elif webvirtmgr.arm64 == "verified" %}success{% elif webvirtmgr.arm64 == "supported" %}informational{% elif webvirtmgr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not webvirtmgr.armv7 %}untested{% else %}{{ webvirtmgr.armv7 }}{% endif %}-armv7-{% if not webvirtmgr.armv7 %}inactive{% elif webvirtmgr.armv7 == "verified" %}success{% elif webvirtmgr.armv7 == "supported" %}informational{% elif webvirtmgr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ webvirtmgr.version }}

## SETUP

### Enabling webvirtmgr

#### Command:

**`vlab set webvirtmgr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ webvirtmgr.domain }}/admin*

Create an account with your desired username; as this is the first user, webvirtmgr makes this account the administrator.

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

3. run **`vlab update_one service=webvirtmgr`** to complete the changes


## ACCESS

webvirtmgr (HTTPS) link: [https://{% if webvirtmgr.domain %}{{ webvirtmgr.domain }}{% else %}{{ webvirtmgr.subdomain + "." + domain }}{% endif %}/](https://{% if webvirtmgr.domain %}{{ webvirtmgr.domain }}{% else %}{{ webvirtmgr.subdomain + "." + domain }}{% endif %}/)
webvirtmgr (HTTP) link: [http://{% if webvirtmgr.domain %}{{ webvirtmgr.domain }}{% else %}{{ webvirtmgr.subdomain + "." + domain }}{% endif %}/](http://{% if webvirtmgr.domain %}{{ webvirtmgr.domain }}{% else %}{{ webvirtmgr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ webvirtmgr.subdomain + "." + tor_domain }}/](http://{{ webvirtmgr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set webvirtmgr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set webvirtmgr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set webvirtmgr.domain webvirtmgr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  domain: webvirtmgr.com
```

##### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

### SUBDOMAIN
*Default: webvirtmgr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set webvirtmgr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

### VERSION
*Default: {{  webvirtmgr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set webvirtmgr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webvirtmgr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=webvirtmgr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
