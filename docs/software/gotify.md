# Gotify

[Gotify](https://github.com/gotify/server) A simple server for sending and receiving messages in real-time per WebSocket. (Includes a sleek web-ui)

![amd64](https://img.shields.io/badge/{% if not gotify.amd64 %}untested{% else %}{{ gotify.amd64 }}{% endif %}-amd64-{% if not gotify.amd64 %}inactive{% elif gotify.amd64 == "verified" %}success{% elif gotify.amd64 == "supported" %}informational{% elif gotify.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not gotify.arm64 %}untested{% else %}{{ gotify.arm64 }}{% endif %}-arm64-{% if not gotify.arm64 %}inactive{% elif gotify.arm64 == "verified" %}success{% elif gotify.arm64 == "supported" %}informational{% elif gotify.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not gotify.armv7 %}untested{% else %}{{ gotify.armv7 }}{% endif %}-armv7-{% if not gotify.armv7 %}inactive{% elif gotify.armv7 == "verified" %}success{% elif gotify.armv7 == "supported" %}informational{% elif gotify.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ gotify.version }}

## SETUP

### Enabling gotify

#### Command:

**`vlab set gotify.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=gotify`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ gotify.domain }}/admin*

Create an account with your desired username; as this is the first user, gotify makes this account the administrator.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


##### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=gotify`** to complete the changes


## ACCESS

gotify (HTTPS) link: [https://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/](https://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/)
gotify (HTTP) link: [http://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/](http://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ gotify.subdomain + "." + tor_domain }}/](http://{{ gotify.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gotify.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=gotify`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gotify.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=gotify`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set gotify.domain gotify.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  domain: gotify.com
```

##### Finalising changes:

run: **`vlab update_one service=gotify`**

### SUBDOMAIN
*Default: gotify*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set gotify.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=gotify`**

### VERSION
*Default: {{  gotify.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set gotify.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gotify
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=gotify`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
