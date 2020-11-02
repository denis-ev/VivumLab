# Taisun

[Taisun](https://www.taisun.io/) Single Server Docker Management for Humans

![amd64](https://img.shields.io/badge/{% if not taisun.amd64 %}untested{% else %}{{ taisun.amd64 }}{% endif %}-amd64-{% if not taisun.amd64 %}inactive{% elif taisun.amd64 == "verified" %}success{% elif taisun.amd64 == "supported" %}informational{% elif taisun.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not taisun.arm64 %}untested{% else %}{{ taisun.arm64 }}{% endif %}-arm64-{% if not taisun.arm64 %}inactive{% elif taisun.arm64 == "verified" %}success{% elif taisun.arm64 == "supported" %}informational{% elif taisun.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not taisun.armv7 %}untested{% else %}{{ taisun.armv7 }}{% endif %}-armv7-{% if not taisun.armv7 %}inactive{% elif taisun.armv7 == "verified" %}success{% elif taisun.armv7 == "supported" %}informational{% elif taisun.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ taisun.version }}

## SETUP

### Enabling taisun

#### Command:

**`vlab set taisun.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=taisun`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ taisun.domain }}/admin*

Create an account with your desired username; as this is the first user, taisun makes this account the administrator.

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

3. run **`vlab update_one service=taisun`** to complete the changes


## ACCESS

taisun (HTTPS) link: [https://{% if taisun.domain %}{{ taisun.domain }}{% else %}{{ taisun.subdomain + "." + domain }}{% endif %}/](https://{% if taisun.domain %}{{ taisun.domain }}{% else %}{{ taisun.subdomain + "." + domain }}{% endif %}/)
taisun (HTTP) link: [http://{% if taisun.domain %}{{ taisun.domain }}{% else %}{{ taisun.subdomain + "." + domain }}{% endif %}/](http://{% if taisun.domain %}{{ taisun.domain }}{% else %}{{ taisun.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ taisun.subdomain + "." + tor_domain }}/](http://{{ taisun.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set taisun.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=taisun`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set taisun.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=taisun`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set taisun.domain taisun.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  domain: taisun.com
```

##### Finalising changes:

run: **`vlab update_one service=taisun`**

### SUBDOMAIN
*Default: taisun*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set taisun.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=taisun`**

### VERSION
*Default: {{  taisun.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set taisun.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
taisun
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=taisun`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
