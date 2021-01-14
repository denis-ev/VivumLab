---
id: hedgedoc
title: hedgedoc
hide_title: true
hide_table_of_contents: false
sidebar_label: hedgedoc
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# hedgedoc

[hedgedoc](https://demo.hedgedoc.org/) The best platform to write and share markdown

![amd64](https://img.shields.io/badge/{% if not hedgedoc.amd64 %}untested{% else %}{{ hedgedoc.amd64 }}{% endif %}-amd64-{% if not hedgedoc.amd64 %}inactive{% elif hedgedoc.amd64 == "verified" %}success{% elif hedgedoc.amd64 == "supported" %}informational{% elif hedgedoc.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not hedgedoc.arm64 %}untested{% else %}{{ hedgedoc.arm64 }}{% endif %}-arm64-{% if not hedgedoc.arm64 %}inactive{% elif hedgedoc.arm64 == "verified" %}success{% elif hedgedoc.arm64 == "supported" %}informational{% elif hedgedoc.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not hedgedoc.armv7 %}untested{% else %}{{ hedgedoc.armv7 }}{% endif %}-armv7-{% if not hedgedoc.armv7 %}inactive{% elif hedgedoc.armv7 == "verified" %}success{% elif hedgedoc.armv7 == "supported" %}informational{% elif hedgedoc.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ hedgedoc.version }}

## SETUP

### Enabling hedgedoc

#### Command:

**`vlab set hedgedoc.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

> hedgedoc
> enable: True

#### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to _https://{{ hedgedoc.domain }}/admin_

Create an account with your desired username; as this is the first user, hedgedoc makes this account the administrator.

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

3. run **`vlab update_one service=hedgedoc`** to complete the changes

## ACCESS

hedgedoc (HTTPS) link: [https://{% if hedgedoc.domain %}{{ hedgedoc.domain }}{% else %}{{ hedgedoc.subdomain + "." + domain }}{% endif %}/](https://{% if hedgedoc.domain %}{{ hedgedoc.domain }}{% else %}{{ hedgedoc.subdomain + "." + domain }}{% endif %}/)
hedgedoc (HTTP) link: [http://{% if hedgedoc.domain %}{{ hedgedoc.domain }}{% else %}{{ hedgedoc.subdomain + "." + domain }}{% endif %}/](http://{% if hedgedoc.domain %}{{ hedgedoc.domain }}{% else %}{{ hedgedoc.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ hedgedoc.subdomain + "." + tor_domain }}/](http://{{ hedgedoc.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY

_Default: False_ <br />
_Options: True/False_

#### Command:

**`vlab set hedgedoc.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

```
hedgedoc
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

### AUTH

_Default: False_ <br />
_Options: True/False_

#### Command:

**`vlab set hedgedoc.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

```
hedgedoc
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

### DOMAIN

_Default: False_ <br />
_NOTE: include the sitename and top level domain suffix. eg. name.com, site.net_

#### Command:

**`vlab set hedgedoc.domain hedgedoc.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

```
hedgedoc
  domain: hedgedoc.com
```

##### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

### SUBDOMAIN

_Default: hedgedoc_ <br />
_NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'_

#### Command:

**`vlab set hedgedoc.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

```
hedgedoc
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

### VERSION

_Default: {{  hedgedoc.version  }}_ <br />
_NOTE: Ensure that the version exists_

#### Command:

**`vlab set hedgedoc.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.

```
hedgedoc
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=hedgedoc`**

## Need more help?

Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
