---
id: plex
title: Plex Media Server
hide_title: true
hide_table_of_contents: false
sidebar_label: Plex Media Server
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Plex Media Server

[Plex](https://plex.tv/) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![amd64](https://img.shields.io/badge/{% if not plex.amd64 %}untested{% else %}{{ plex.amd64 }}{% endif %}-amd64-{% if not plex.amd64 %}inactive{% elif plex.amd64 == "verified" %}success{% elif plex.amd64 == "supported" %}informational{% elif plex.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not plex.arm64 %}untested{% else %}{{ plex.arm64 }}{% endif %}-arm64-{% if not plex.arm64 %}inactive{% elif plex.arm64 == "verified" %}success{% elif plex.arm64 == "supported" %}informational{% elif plex.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not plex.armv7 %}untested{% else %}{{ plex.armv7 }}{% endif %}-armv7-{% if not plex.armv7 %}inactive{% elif plex.armv7 == "verified" %}success{% elif plex.armv7 == "supported" %}informational{% elif plex.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ plex.version }}

## SETUP

### Enabling plex

#### Command:

**`vlab set plex.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=plex`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ plex.domain }}/admin*

Create an account with your desired username; as this is the first user, plex makes this account the administrator.

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

3. run **`vlab update_one service=plex`** to complete the changes


## ACCESS

plex (HTTPS) link: [https://{% if plex.domain %}{{ plex.domain }}{% else %}{{ plex.subdomain + "." + domain }}{% endif %}/](https://{% if plex.domain %}{{ plex.domain }}{% else %}{{ plex.subdomain + "." + domain }}{% endif %}/)
plex (HTTP) link: [http://{% if plex.domain %}{{ plex.domain }}{% else %}{{ plex.subdomain + "." + domain }}{% endif %}/](http://{% if plex.domain %}{{ plex.domain }}{% else %}{{ plex.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ plex.subdomain + "." + tor_domain }}/](http://{{ plex.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set plex.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=plex`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set plex.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=plex`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set plex.domain plex.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  domain: plex.com
```

##### Finalising changes:

run: **`vlab update_one service=plex`**

### SUBDOMAIN
*Default: plex* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set plex.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=plex`**

### VERSION
*Default: {{  plex.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set plex.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
plex
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=plex`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
