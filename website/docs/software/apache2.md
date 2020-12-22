---
id: apache2
title: Apache 2
hide_title: true
hide_table_of_contents: false
sidebar_label: Apache 2
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Apache 2

[Apache 2](https://httpd.apache.org/) is a free web server.

![amd64](https://img.shields.io/badge/{% if not apache2.amd64 %}untested{% else %}{{ apache2.amd64 }}{% endif %}-amd64-{% if not apache2.amd64 %}inactive{% elif apache2.amd64 == "verified" %}success{% elif apache2.amd64 == "supported" %}informational{% elif apache2.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not apache2.arm64 %}untested{% else %}{{ apache2.arm64 }}{% endif %}-arm64-{% if not apache2.arm64 %}inactive{% elif apache2.arm64 == "verified" %}success{% elif apache2.arm64 == "supported" %}informational{% elif apache2.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not apache2.armv7 %}untested{% else %}{{ apache2.armv7 }}{% endif %}-armv7-{% if not apache2.armv7 %}inactive{% elif apache2.armv7 == "verified" %}success{% elif apache2.armv7 == "supported" %}informational{% elif apache2.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ apache2.version }}

## SETUP

### Enabling apache2

#### Command:

**`vlab set apache2.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=apache2`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ apache2.domain }}/admin*

Create an account with your desired username; as this is the first user, apache2 makes this account the administrator.

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

3. run **`vlab update_one service=apache2`** to complete the changes


## ACCESS

Apache2 (HTTPS) link: [https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)
Apache2 (HTTP) link: [http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ apache2.subdomain + "." + tor_domain }}/](http://{{ apache2.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set apache2.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set apache2.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set apache2.domain apache2.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  domain: apache2.com
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### SUBDOMAIN
*Default: apache2* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set apache2.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### VERSION
*Default: {{  apache2.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set apache2.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
