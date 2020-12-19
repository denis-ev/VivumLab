---
id: codeserver
title: Code-Server
hide_title: true
hide_table_of_contents: false
sidebar_label: Code-Server
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Code-Server

[Codeserver](https://github.com/cdr/code-server) Run VS Code on a remote server.

![amd64](https://img.shields.io/badge/{% if not codeserver.amd64 %}untested{% else %}{{ codeserver.amd64 }}{% endif %}-amd64-{% if not codeserver.amd64 %}inactive{% elif codeserver.amd64 == "verified" %}success{% elif codeserver.amd64 == "supported" %}informational{% elif codeserver.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not codeserver.arm64 %}untested{% else %}{{ codeserver.arm64 }}{% endif %}-arm64-{% if not codeserver.arm64 %}inactive{% elif codeserver.arm64 == "verified" %}success{% elif codeserver.arm64 == "supported" %}informational{% elif codeserver.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not codeserver.armv7 %}untested{% else %}{{ codeserver.armv7 }}{% endif %}-armv7-{% if not codeserver.armv7 %}inactive{% elif codeserver.armv7 == "verified" %}success{% elif codeserver.armv7 == "supported" %}informational{% elif codeserver.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ codeserver.version }}

## SETUP

### Enabling codeserver

#### Command:

**`vlab set codeserver.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=codeserver`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ codeserver.domain }}/admin*

Create an account with your desired username; as this is the first user, codeserver makes this account the administrator.

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

3. run **`vlab update_one service=codeserver`** to complete the changes


## ACCESS

Codeserver (HTTPS) link: [https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)
Codeserver (HTTP) link: [http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ codeserver.subdomain + "." + tor_domain }}/](http://{{ codeserver.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set codeserver.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  https_only: True
````

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set codeserver.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set codeserver.domain codeserver.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  domain: codeserver.com
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### SUBDOMAIN
*Default: codeserver* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set codeserver.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### VERSION
*Default: {{  codeserver.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set codeserver.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
