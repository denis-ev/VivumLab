---
id: portainer
title: Portainer
hide_title: true
hide_table_of_contents: false
sidebar_label: Portainer
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Portainer

[Portainer](https://www.portainer.io/) is a Docker management interface, for the more advanced user.

![amd64](https://img.shields.io/badge/{% if not portainer.amd64 %}untested{% else %}{{ portainer.amd64 }}{% endif %}-amd64-{% if not portainer.amd64 %}inactive{% elif portainer.amd64 == "verified" %}success{% elif portainer.amd64 == "supported" %}informational{% elif portainer.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not portainer.arm64 %}untested{% else %}{{ portainer.arm64 }}{% endif %}-arm64-{% if not portainer.arm64 %}inactive{% elif portainer.arm64 == "verified" %}success{% elif portainer.arm64 == "supported" %}informational{% elif portainer.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not portainer.armv7 %}untested{% else %}{{ portainer.armv7 }}{% endif %}-armv7-{% if not portainer.armv7 %}inactive{% elif portainer.armv7 == "verified" %}success{% elif portainer.armv7 == "supported" %}informational{% elif portainer.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ portainer.version }}

## SETUP

### Enabling portainer

#### Command:

**`vlab set portainer.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=portainer`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ portainer.domain }}/admin*

Create an account with your desired username; as this is the first user, portainer makes this account the administrator.

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

3. run **`vlab update_one service=portainer`** to complete the changes


## ACCESS

portainer (HTTPS) link: [https://{% if portainer.domain %}{{ portainer.domain }}{% else %}{{ portainer.subdomain + "." + domain }}{% endif %}/](https://{% if portainer.domain %}{{ portainer.domain }}{% else %}{{ portainer.subdomain + "." + domain }}{% endif %}/)
portainer (HTTP) link: [http://{% if portainer.domain %}{{ portainer.domain }}{% else %}{{ portainer.subdomain + "." + domain }}{% endif %}/](http://{% if portainer.domain %}{{ portainer.domain }}{% else %}{{ portainer.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ portainer.subdomain + "." + tor_domain }}/](http://{{ portainer.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set portainer.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=portainer`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set portainer.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=portainer`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set portainer.domain portainer.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  domain: portainer.com
```

##### Finalising changes:

run: **`vlab update_one service=portainer`**

### SUBDOMAIN
*Default: portainer* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set portainer.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=portainer`**

### VERSION
*Default: {{  portainer.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set portainer.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
portainer
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=portainer`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
