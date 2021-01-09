---
id: turtl
title: Turtl
hide_title: true
hide_table_of_contents: false
sidebar_label: Turtl
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Turtl

[Turtl](https://github.com/turtl/server) Turtl is a note taking app with desktop and mobile apps.

![amd64](https://img.shields.io/badge/{% if not turtl.amd64 %}untested{% else %}{{ turtl.amd64 }}{% endif %}-amd64-{% if not turtl.amd64 %}inactive{% elif turtl.amd64 == "verified" %}success{% elif turtl.amd64 == "supported" %}informational{% elif turtl.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not turtl.arm64 %}untested{% else %}{{ turtl.arm64 }}{% endif %}-arm64-{% if not turtl.arm64 %}inactive{% elif turtl.arm64 == "verified" %}success{% elif turtl.arm64 == "supported" %}informational{% elif turtl.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not turtl.armv7 %}untested{% else %}{{ turtl.armv7 }}{% endif %}-armv7-{% if not turtl.armv7 %}inactive{% elif turtl.armv7 == "verified" %}success{% elif turtl.armv7 == "supported" %}informational{% elif turtl.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** None

## SETUP

### Enabling turtl

#### Command:

**`vlab set turtl.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=turtl`**

## FIRST RUN

You must then download a desktop client or Android or iOS app. Get the newest version here <https://github.com/turtl/desktop/releases>

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

3. run **`vlab update_one service=turtl`** to complete the changes


## ACCESS

turtl (HTTPS) link: [https://{% if turtl.domain %}{{ turtl.domain }}{% else %}{{ turtl.subdomain + "." + domain }}{% endif %}/](https://{% if turtl.domain %}{{ turtl.domain }}{% else %}{{ turtl.subdomain + "." + domain }}{% endif %}/)
turtl (HTTP) link: [http://{% if turtl.domain %}{{ turtl.domain }}{% else %}{{ turtl.subdomain + "." + domain }}{% endif %}/](http://{% if turtl.domain %}{{ turtl.domain }}{% else %}{{ turtl.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ turtl.subdomain + "." + tor_domain }}/](http://{{ turtl.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set turtl.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=turtl`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set turtl.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=turtl`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set turtl.domain turtl.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  domain: turtl.com
```

##### Finalising changes:

run: **`vlab update_one service=turtl`**

### SUBDOMAIN
*Default: turtl* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set turtl.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=turtl`**

### VERSION
*Default: None*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set turtl.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
turtl
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=turtl`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
