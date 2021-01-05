---
id: webdavserver
title: WebDAV Server
hide_title: true
hide_table_of_contents: false
sidebar_label: WebDAV Server
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# WebDAV Server

[WebDAV Server](https://hub.docker.com/r/bytemark/webdav/) A simple WebDAV service.
If you enable WebDAV over SSL you will have a secure file transfer service setup, which is useful for e.g. syncing your notes from Joplin.
If you don't need all the extra from NextCloud/OwnCloud, this service could be what you need.

![amd64](https://img.shields.io/badge/{% if not webdavserver.amd64 %}untested{% else %}{{ webdavserver.amd64 }}{% endif %}-amd64-{% if not webdavserver.amd64 %}inactive{% elif webdavserver.amd64 == "verified" %}success{% elif webdavserver.amd64 == "supported" %}informational{% elif webdavserver.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not webdavserver.arm64 %}untested{% else %}{{ webdavserver.arm64 }}{% endif %}-arm64-{% if not webdavserver.arm64 %}inactive{% elif webdavserver.arm64 == "verified" %}success{% elif webdavserver.arm64 == "supported" %}informational{% elif webdavserver.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not webdavserver.armv7 %}untested{% else %}{{ webdavserver.armv7 }}{% endif %}-armv7-{% if not webdavserver.armv7 %}inactive{% elif webdavserver.armv7 == "verified" %}success{% elif webdavserver.armv7 == "supported" %}informational{% elif webdavserver.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ webdavserver.version }}

## SETUP

### Enabling webdavserver

#### Command:

**`vlab set webdavserver.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=webdavserver`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Files are stored in {{ storage_dir }}/webdav/data .

It is strongly recommended to only allow access over https.

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

3. run **`vlab update_one service=webdavserver`** to complete the changes


## ACCESS

webdavserver (HTTPS) link: [https://{% if webdavserver.domain %}{{ webdavserver.domain }}{% else %}{{ webdavserver.subdomain + "." + domain }}{% endif %}/](https://{% if webdavserver.domain %}{{ webdavserver.domain }}{% else %}{{ webdavserver.subdomain + "." + domain }}{% endif %}/)
webdavserver (HTTP) link: [http://{% if webdavserver.domain %}{{ webdavserver.domain }}{% else %}{{ webdavserver.subdomain + "." + domain }}{% endif %}/](http://{% if webdavserver.domain %}{{ webdavserver.domain }}{% else %}{{ webdavserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ webdavserver.subdomain + "." + tor_domain }}/](http://{{ webdavserver.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set webdavserver.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=webdavserver`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set webdavserver.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=webdavserver`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set webdavserver.domain webdavserver.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  domain: webdavserver.com
```

##### Finalising changes:

run: **`vlab update_one service=webdavserver`**

### SUBDOMAIN
*Default: webdavserver* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set webdavserver.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=webdavserver`**

### VERSION
*Default: {{  webdavserver.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set webdavserver.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webdavserver
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=webdavserver`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
