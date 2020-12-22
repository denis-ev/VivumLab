---
id: privatebin
title: PrivateBin
hide_title: true
hide_table_of_contents: false
sidebar_label: PrivateBin
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# PrivateBin

[PrivateBin](https://privatebin.info) PrivateBin is a minimalist, open source online pastebin where the server has zero knowledge of pasted data.

![amd64](https://img.shields.io/badge/{% if not privatebin.amd64 %}untested{% else %}{{ privatebin.amd64 }}{% endif %}-amd64-{% if not privatebin.amd64 %}inactive{% elif privatebin.amd64 == "verified" %}success{% elif privatebin.amd64 == "supported" %}informational{% elif privatebin.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not privatebin.arm64 %}untested{% else %}{{ privatebin.arm64 }}{% endif %}-arm64-{% if not privatebin.arm64 %}inactive{% elif privatebin.arm64 == "verified" %}success{% elif privatebin.arm64 == "supported" %}informational{% elif privatebin.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not privatebin.armv7 %}untested{% else %}{{ privatebin.armv7 }}{% endif %}-armv7-{% if not privatebin.armv7 %}inactive{% elif privatebin.armv7 == "verified" %}success{% elif privatebin.armv7 == "supported" %}informational{% elif privatebin.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ privatebin.version }}

## SETUP

### Enabling privatebin

#### Command:

**`vlab set privatebin.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=privatebin`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### Known Problems
For some reason, the volume mounts to PrivateBin sometimes don't work immediately after it's installed, causing it to fail after complaining that it can't access /srv/data/.htaccess.  A simple restart of the systemd service (`sudo systemctl restart privatebin`) seems to fix this.


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

3. run **`vlab update_one service=privatebin`** to complete the changes


## ACCESS

privatebin (HTTPS) link: [https://{% if privatebin.domain %}{{ privatebin.domain }}{% else %}{{ privatebin.subdomain + "." + domain }}{% endif %}/](https://{% if privatebin.domain %}{{ privatebin.domain }}{% else %}{{ privatebin.subdomain + "." + domain }}{% endif %}/)
privatebin (HTTP) link: [http://{% if privatebin.domain %}{{ privatebin.domain }}{% else %}{{ privatebin.subdomain + "." + domain }}{% endif %}/](http://{% if privatebin.domain %}{{ privatebin.domain }}{% else %}{{ privatebin.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ privatebin.subdomain + "." + tor_domain }}/](http://{{ privatebin.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set privatebin.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=privatebin`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set privatebin.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=privatebin`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set privatebin.domain privatebin.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  domain: privatebin.com
```

##### Finalising changes:

run: **`vlab update_one service=privatebin`**

### SUBDOMAIN
*Default: privatebin* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set privatebin.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=privatebin`**

### VERSION
*Default: {{  privatebin.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set privatebin.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
privatebin
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=privatebin`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
