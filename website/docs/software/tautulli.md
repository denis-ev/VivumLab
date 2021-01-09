---
id: tautulli
title: Tautulli
hide_title: true
hide_table_of_contents: false
sidebar_label: Tautulli
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Tautulli

[Tautulli](https://github.com/tautulli/tautulli) A Python based monitoring and tracking tool for Plex Media Server.

![amd64](https://img.shields.io/badge/{% if not tautulli.amd64 %}untested{% else %}{{ tautulli.amd64 }}{% endif %}-amd64-{% if not tautulli.amd64 %}inactive{% elif tautulli.amd64 == "verified" %}success{% elif tautulli.amd64 == "supported" %}informational{% elif tautulli.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not tautulli.arm64 %}untested{% else %}{{ tautulli.arm64 }}{% endif %}-arm64-{% if not tautulli.arm64 %}inactive{% elif tautulli.arm64 == "verified" %}success{% elif tautulli.arm64 == "supported" %}informational{% elif tautulli.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not tautulli.armv7 %}untested{% else %}{{ tautulli.armv7 }}{% endif %}-armv7-{% if not tautulli.armv7 %}inactive{% elif tautulli.armv7 == "verified" %}success{% elif tautulli.armv7 == "supported" %}informational{% elif tautulli.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ tautulli.version }}

## SETUP

### Enabling tautulli

#### Command:

**`vlab set tautulli.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=tautulli`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ tautulli.domain }}/admin*

Create an account with your desired username; as this is the first user, tautulli makes this account the administrator.

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

3. run **`vlab update_one service=tautulli`** to complete the changes


## ACCESS

tautulli (HTTPS) link: [https://{% if tautulli.domain %}{{ tautulli.domain }}{% else %}{{ tautulli.subdomain + "." + domain }}{% endif %}/](https://{% if tautulli.domain %}{{ tautulli.domain }}{% else %}{{ tautulli.subdomain + "." + domain }}{% endif %}/)
tautulli (HTTP) link: [http://{% if tautulli.domain %}{{ tautulli.domain }}{% else %}{{ tautulli.subdomain + "." + domain }}{% endif %}/](http://{% if tautulli.domain %}{{ tautulli.domain }}{% else %}{{ tautulli.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ tautulli.subdomain + "." + tor_domain }}/](http://{{ tautulli.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set tautulli.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=tautulli`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set tautulli.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=tautulli`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set tautulli.domain tautulli.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  domain: tautulli.com
```

##### Finalising changes:

run: **`vlab update_one service=tautulli`**

### SUBDOMAIN
*Default: tautulli* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set tautulli.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=tautulli`**

### VERSION
*Default: {{  tautulli.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set tautulli.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tautulli
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=tautulli`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
