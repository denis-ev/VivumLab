---
id: qbittorrent
title: qBittorrent
hide_title: true
hide_table_of_contents: false
sidebar_label: qBittorrent
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# qBittorrent

[qBittorrent](https://www.qbittorrent.org/) An open-source alternative to µTorrent

![amd64](https://img.shields.io/badge/{% if not qbittorrent.amd64 %}untested{% else %}{{ qbittorrent.amd64 }}{% endif %}-amd64-{% if not qbittorrent.amd64 %}inactive{% elif qbittorrent.amd64 == "verified" %}success{% elif qbittorrent.amd64 == "supported" %}informational{% elif qbittorrent.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not qbittorrent.arm64 %}untested{% else %}{{ qbittorrent.arm64 }}{% endif %}-arm64-{% if not qbittorrent.arm64 %}inactive{% elif qbittorrent.arm64 == "verified" %}success{% elif qbittorrent.arm64 == "supported" %}informational{% elif qbittorrent.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not qbittorrent.armv7 %}untested{% else %}{{ qbittorrent.armv7 }}{% endif %}-armv7-{% if not qbittorrent.armv7 %}inactive{% elif qbittorrent.armv7 == "verified" %}success{% elif qbittorrent.armv7 == "supported" %}informational{% elif qbittorrent.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ qbittorrent.version }}

## SETUP

### Enabling qbittorrent

#### Command:

**`vlab set qbittorrent.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ qbittorrent.domain }}/admin*

Create an account with your desired username; as this is the first user, qbittorrent makes this account the administrator.

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

3. run **`vlab update_one service=qbittorrent`** to complete the changes


## ACCESS

qbittorrent (HTTPS) link: [https://{% if qbittorrent.domain %}{{ qbittorrent.domain }}{% else %}{{ qbittorrent.subdomain + "." + domain }}{% endif %}/](https://{% if qbittorrent.domain %}{{ qbittorrent.domain }}{% else %}{{ qbittorrent.subdomain + "." + domain }}{% endif %}/)
qbittorrent (HTTP) link: [http://{% if qbittorrent.domain %}{{ qbittorrent.domain }}{% else %}{{ qbittorrent.subdomain + "." + domain }}{% endif %}/](http://{% if qbittorrent.domain %}{{ qbittorrent.domain }}{% else %}{{ qbittorrent.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ qbittorrent.subdomain + "." + tor_domain }}/](http://{{ qbittorrent.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set qbittorrent.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set qbittorrent.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set qbittorrent.domain qbittorrent.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  domain: qbittorrent.com
```

##### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

### SUBDOMAIN
*Default: qbittorrent* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set qbittorrent.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

### VERSION
*Default: {{  qbittorrent.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set qbittorrent.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
qbittorrent
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=qbittorrent`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
