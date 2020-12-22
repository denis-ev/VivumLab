---
id: bitwarden
title: Bitwarden
hide_title: true
hide_table_of_contents: false
sidebar_label: Bitwarden
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Bitwarden

[Bitwarden](https://bitwarden.com/) is an open source password manager. VivumLab utilizes an Open Source clone of the Bitwarden API server, [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs). This is primarily due to performance and complexity reasons. `bitwarden_rs` requires just one Docker container, whereas the official `Bitwarden` install requires something like six different containers.

![amd64](https://img.shields.io/badge/{% if not bitwarden.amd64 %}untested{% else %}{{ bitwarden.amd64 }}{% endif %}-amd64-{% if not bitwarden.amd64 %}inactive{% elif bitwarden.amd64 == "verified" %}success{% elif bitwarden.amd64 == "supported" %}informational{% elif bitwarden.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not bitwarden.arm64 %}untested{% else %}{{ bitwarden.arm64 }}{% endif %}-arm64-{% if not bitwarden.arm64 %}inactive{% elif bitwarden.arm64 == "verified" %}success{% elif bitwarden.arm64 == "supported" %}informational{% elif bitwarden.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not bitwarden.armv7 %}untested{% else %}{{ bitwarden.armv7 }}{% endif %}-armv7-{% if not bitwarden.armv7 %}inactive{% elif bitwarden.armv7 == "verified" %}success{% elif bitwarden.armv7 == "supported" %}informational{% elif bitwarden.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ bitwarden.version }}

## SETUP

### Security Note

>Password managers like Bitwarden should only be used over HTTPS. Ensure you have valid certificates in place before beginning to use this service. You have been warned. :)

### Enabling bitwarden

#### Command:

**`vlab set bitwarden.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bitwarden`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bitwarden.domain }}/admin*

Create an account with your desired username; as this is the first user, bitwarden makes this account the administrator.

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

3. run **`vlab update_one service=bitwarden`** to complete the changes


## ACCESS

Bitwarden (HTTPS) link: [https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)
Bitwarden (HTTP) link: [http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bitwarden.subdomain + "." + tor_domain }}/](http://{{ bitwarden.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bitwarden.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set bitwarden.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bitwarden.domain bitwarden.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  domain: bitwarden.com
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### SUBDOMAIN
*Default: bitwarden* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bitwarden.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### VERSION
*Default: {{  bitwarden.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bitwarden.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  version: 2.7
```
s
##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
