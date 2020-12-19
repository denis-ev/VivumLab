---
id: system-cockpit
title: Cockpit
hide_title: true
hide_table_of_contents: false
sidebar_label: Cockpit
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Cockpit

[Cockpit](https://cockpit-project.org) Cockpit admin interface package for configuring and troubleshooting a system

{# ![amd64](https://img.shields.io/badge/{% if not cockpit.amd64 %}untested{% else %}{{ cockpit.amd64 }}{% endif %}-amd64-{% if not cockpit.amd64 %}inactive{% elif cockpit.amd64 == "verified" %}success{% elif cockpit.amd64 == "supported" %}informational{% elif cockpit.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not cockpit.arm64 %}untested{% else %}{{ cockpit.arm64 }}{% endif %}-arm64-{% if not cockpit.arm64 %}inactive{% elif cockpit.arm64 == "verified" %}success{% elif cockpit.arm64 == "supported" %}informational{% elif cockpit.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not cockpit.armv7 %}untested{% else %}{{ cockpit.armv7 }}{% endif %}-armv7-{% if not cockpit.armv7 %}inactive{% elif cockpit.armv7 == "verified" %}success{% elif cockpit.armv7 == "supported" %}informational{% elif cockpit.armv7 == "unsupported" %}critical{% endif %}?style=flat) #}

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** None

## SETUP

### Enabling cockpit

#### Command:

**`vlab set cockpit.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=cockpit`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ cockpit.domain }}/admin*

Create an account with your desired username; as this is the first user, cockpit makes this account the administrator.

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

3. run **`vlab update_one service=cockpit`** to complete the changes


## ACCESS

cockpit (HTTPS) link: [https://{% if cockpit.domain %}{{ cockpit.domain }}{% else %}{{ cockpit.subdomain + "." + domain }}{% endif %}/](https://{% if cockpit.domain %}{{ cockpit.domain }}{% else %}{{ cockpit.subdomain + "." + domain }}{% endif %}/)
cockpit (HTTP) link: [http://{% if cockpit.domain %}{{ cockpit.domain }}{% else %}{{ cockpit.subdomain + "." + domain }}{% endif %}/](http://{% if cockpit.domain %}{{ cockpit.domain }}{% else %}{{ cockpit.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ cockpit.subdomain + "." + tor_domain }}/](http://{{ cockpit.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set cockpit.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=cockpit`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set cockpit.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=cockpit`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set cockpit.domain cockpit.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  domain: cockpit.com
```

##### Finalising changes:

run: **`vlab update_one service=cockpit`**

### SUBDOMAIN
*Default: cockpit* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set cockpit.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=cockpit`**

### VERSION
*Default: None*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set cockpit.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
cockpit
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=cockpit`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
