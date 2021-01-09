---
id: mailu
title: Mailu
hide_title: true
hide_table_of_contents: false
sidebar_label: Mailu
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Mailu

[Mailu](https://mailu.io/1.7/general.html) is a simple yet full-featured mail server as a set of Docker images.

![amd64](https://img.shields.io/badge/{% if not mailu.amd64 %}untested{% else %}{{ mailu.amd64 }}{% endif %}-amd64-{% if not mailu.amd64 %}inactive{% elif mailu.amd64 == "verified" %}success{% elif mailu.amd64 == "supported" %}informational{% elif mailu.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not mailu.arm64 %}untested{% else %}{{ mailu.arm64 }}{% endif %}-arm64-{% if not mailu.arm64 %}inactive{% elif mailu.arm64 == "verified" %}success{% elif mailu.arm64 == "supported" %}informational{% elif mailu.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not mailu.armv7 %}untested{% else %}{{ mailu.armv7 }}{% endif %}-armv7-{% if not mailu.armv7 %}inactive{% elif mailu.armv7 == "verified" %}success{% elif mailu.armv7 == "supported" %}informational{% elif mailu.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ mailu.version }}

## SETUP

### Enabling mailu

#### Command:

**`vlab set mailu.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mailu`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mailu.domain }}/admin*

Create an account with your desired username; as this is the first user, mailu makes this account the administrator.

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

3. run **`vlab update_one service=mailu`** to complete the changes

#### Creating Users

You can create users in the admin interface, by clicking `Mail Domains` on the main menu, then the envelope icon next to your mail domain.

Users can then also login to the admin interface, but will only be able to adjunt their password and spam settings.

## Access

It is available at [https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/) or [http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ mailu.subdomain + "." + tor_domain }}/](http://{{ mailu.subdomain + "." + tor_domain }}/)
{% endif %}

## Admin Access

It is available at [https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/) or [http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/)

{% if enable_tor %}
It is also available via Tor at [http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/](http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/)
{% endif %}

You can login using admin@{{ domain }} and the password found on your server in `~/vivumlab/mailu/.env` under INITIAL_ADMIN_PW, or in `settings/passwords/mailu_admin_password` from your deploy location.

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mailu.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set mailu.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mailu.domain mailu.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  domain: mailu.com
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### SUBDOMAIN
*Default: mailu* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mailu.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### VERSION
*Default: {{  mailu.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mailu.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
