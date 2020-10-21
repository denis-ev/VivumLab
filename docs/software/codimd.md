# CodiMD

[CodiMD](https://demo.codimd.org/) The best platform to write and share markdown

![amd64](https://img.shields.io/badge/{% if not codimd.amd64 %}untested{% else %}{{ codimd.amd64 }}{% endif %}-amd64-{% if not codimd.amd64 %}inactive{% elif codimd.amd64 == "verified" %}success{% elif codimd.amd64 == "supported" %}informational{% elif codimd.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not codimd.arm64 %}untested{% else %}{{ codimd.arm64 }}{% endif %}-arm64-{% if not codimd.arm64 %}inactive{% elif codimd.arm64 == "verified" %}success{% elif codimd.arm64 == "supported" %}informational{% elif codimd.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not codimd.armv7 %}untested{% else %}{{ codimd.armv7 }}{% endif %}-armv7-{% if not codimd.armv7 %}inactive{% elif codimd.armv7 == "verified" %}success{% elif codimd.armv7 == "supported" %}informational{% elif codimd.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ codimd.version }}

## SETUP

### Enabling codimd

#### Command:

**`vlab set codimd.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>codimd
  enable: True

#### Finalising changes:

run: **`vlab update_one service=codimd`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ codimd.domain }}/admin*

Create an account with your desired username; as this is the first user, codimd makes this account the administrator.

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

3. run **`vlab update_one service=codimd`** to complete the changes


## ACCESS

Codimd (HTTPS) link: [https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/)
Codimd (HTTP) link: [http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ codimd.subdomain + "." + tor_domain }}/](http://{{ codimd.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codimd.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codimd.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set codimd.domain codimd.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  domain: codimd.com
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### SUBDOMAIN
*Default: codimd*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set codimd.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### VERSION
*Default: {{  codimd.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set codimd.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
