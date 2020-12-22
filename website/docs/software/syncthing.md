---
id: syncthing
title: Synchthing
hide_title: true
hide_table_of_contents: false
sidebar_label: Synchthing
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Synchthing

[Synchthing](https://syncthing.net/) is a powerful file synchronization tool. [NextCloud](nextcloud.md) can also do this, but Syncthing is nicer to work with servers and other people.

![amd64](https://img.shields.io/badge/{% if not syncthing.amd64 %}untested{% else %}{{ syncthing.amd64 }}{% endif %}-amd64-{% if not syncthing.amd64 %}inactive{% elif syncthing.amd64 == "verified" %}success{% elif syncthing.amd64 == "supported" %}informational{% elif syncthing.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not syncthing.arm64 %}untested{% else %}{{ syncthing.arm64 }}{% endif %}-arm64-{% if not syncthing.arm64 %}inactive{% elif syncthing.arm64 == "verified" %}success{% elif syncthing.arm64 == "supported" %}informational{% elif syncthing.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not syncthing.armv7 %}untested{% else %}{{ syncthing.armv7 }}{% endif %}-armv7-{% if not syncthing.armv7 %}inactive{% elif syncthing.armv7 == "verified" %}success{% elif syncthing.armv7 == "supported" %}informational{% elif syncthing.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ syncthing.version }}

## SETUP

### Enabling syncthing

#### Command:

**`vlab set syncthing.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=syncthing`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ syncthing.domain }}/admin*

Create an account with your desired username; as this is the first user, syncthing makes this account the administrator.

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

3. run **`vlab update_one service=syncthing`** to complete the changes


## ACCESS

syncthing (HTTPS) link: [https://{% if syncthing.domain %}{{ syncthing.domain }}{% else %}{{ syncthing.subdomain + "." + domain }}{% endif %}/](https://{% if syncthing.domain %}{{ syncthing.domain }}{% else %}{{ syncthing.subdomain + "." + domain }}{% endif %}/)
syncthing (HTTP) link: [http://{% if syncthing.domain %}{{ syncthing.domain }}{% else %}{{ syncthing.subdomain + "." + domain }}{% endif %}/](http://{% if syncthing.domain %}{{ syncthing.domain }}{% else %}{{ syncthing.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ syncthing.subdomain + "." + tor_domain }}/](http://{{ syncthing.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set syncthing.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=syncthing`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set syncthing.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=syncthing`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set syncthing.domain syncthing.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  domain: syncthing.com
```

##### Finalising changes:

run: **`vlab update_one service=syncthing`**

### SUBDOMAIN
*Default: syncthing* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set syncthing.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=syncthing`**

### VERSION
*Default: {{  syncthing.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set syncthing.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
syncthing
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=syncthing`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
