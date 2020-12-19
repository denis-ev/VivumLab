---
id: openldap
title: phpLDAPadmin
hide_title: true
hide_table_of_contents: false
sidebar_label: phpLDAPadmin
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# phpldapadmin

[docker-phpLDAPadmin](https://github.com/osixia/docker-phpLDAPadmin) provides LDAP.

![amd64](https://img.shields.io/badge/{% if not openldap.amd64 %}untested{% else %}{{ openldap.amd64 }}{% endif %}-amd64-{% if not openldap.amd64 %}inactive{% elif openldap.amd64 == "verified" %}success{% elif openldap.amd64 == "supported" %}informational{% elif openldap.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not openldap.arm64 %}untested{% else %}{{ openldap.arm64 }}{% endif %}-arm64-{% if not openldap.arm64 %}inactive{% elif openldap.arm64 == "verified" %}success{% elif openldap.arm64 == "supported" %}informational{% elif openldap.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not openldap.armv7 %}untested{% else %}{{ openldap.armv7 }}{% endif %}-armv7-{% if not openldap.armv7 %}inactive{% elif openldap.armv7 == "verified" %}success{% elif openldap.armv7 == "supported" %}informational{% elif openldap.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ openldap.version }}

## SETUP

### Enabling openldap

#### Command:

**`vlab set openldap.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=openldap`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ openldap.domain }}/admin*

Create an account with your desired username; as this is the first user, openldap makes this account the administrator.

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

3. run **`vlab update_one service=openldap`** to complete the changes


## ACCESS

openldap (HTTPS) link: [https://{% if openldap.domain %}{{ openldap.domain }}{% else %}{{ openldap.subdomain + "." + domain }}{% endif %}/](https://{% if openldap.domain %}{{ openldap.domain }}{% else %}{{ openldap.subdomain + "." + domain }}{% endif %}/)
openldap (HTTP) link: [http://{% if openldap.domain %}{{ openldap.domain }}{% else %}{{ openldap.subdomain + "." + domain }}{% endif %}/](http://{% if openldap.domain %}{{ openldap.domain }}{% else %}{{ openldap.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ openldap.subdomain + "." + tor_domain }}/](http://{{ openldap.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set openldap.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=openldap`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set openldap.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=openldap`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set openldap.domain openldap.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  domain: openldap.com
```

##### Finalising changes:

run: **`vlab update_one service=openldap`**

### SUBDOMAIN
*Default: openldap* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set openldap.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=openldap`**

### VERSION
*Default: {{  openldap.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set openldap.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
openldap
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=openldap`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
