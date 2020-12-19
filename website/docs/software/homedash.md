---
id: homedash
title: Homedash
hide_title: true
hide_table_of_contents: false
sidebar_label: Homedash
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Homedash

[Homedash](https://lamarios.github.io/Homedash2/) is a simple dashboard that allows to monitor and interact with many different services.

![amd64](https://img.shields.io/badge/{% if not homedash.amd64 %}untested{% else %}{{ homedash.amd64 }}{% endif %}-amd64-{% if not homedash.amd64 %}inactive{% elif homedash.amd64 == "verified" %}success{% elif homedash.amd64 == "supported" %}informational{% elif homedash.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not homedash.arm64 %}untested{% else %}{{ homedash.arm64 }}{% endif %}-arm64-{% if not homedash.arm64 %}inactive{% elif homedash.arm64 == "verified" %}success{% elif homedash.arm64 == "supported" %}informational{% elif homedash.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not homedash.armv7 %}untested{% else %}{{ homedash.armv7 }}{% endif %}-armv7-{% if not homedash.armv7 %}inactive{% elif homedash.armv7 == "verified" %}success{% elif homedash.armv7 == "supported" %}informational{% elif homedash.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ homedash.version }}

## SETUP

### Enabling homedash

#### Command:

**`vlab set homedash.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homedash`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homedash.domain }}/admin*

Create an account with your desired username; as this is the first user, homedash makes this account the administrator.

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

3. run **`vlab update_one service=homedash`** to complete the changes


## ACCESS

homedash (HTTPS) link: [https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)
homedash (HTTP) link: [http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homedash.subdomain + "." + tor_domain }}/](http://{{ homedash.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homedash.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set homedash.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homedash.domain homedash.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  domain: homedash.com
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### SUBDOMAIN
*Default: homedash* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homedash.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### VERSION
*Default: {{  homedash.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homedash.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
