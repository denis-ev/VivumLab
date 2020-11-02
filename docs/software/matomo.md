# Matomo

[Matomo](https://matomo.org) Google Analytics alternative that protects your data and your customers' privacy.

![amd64](https://img.shields.io/badge/{% if not matomo.amd64 %}untested{% else %}{{ matomo.amd64 }}{% endif %}-amd64-{% if not matomo.amd64 %}inactive{% elif matomo.amd64 == "verified" %}success{% elif matomo.amd64 == "supported" %}informational{% elif matomo.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not matomo.arm64 %}untested{% else %}{{ matomo.arm64 }}{% endif %}-arm64-{% if not matomo.arm64 %}inactive{% elif matomo.arm64 == "verified" %}success{% elif matomo.arm64 == "supported" %}informational{% elif matomo.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not matomo.armv7 %}untested{% else %}{{ matomo.armv7 }}{% endif %}-armv7-{% if not matomo.armv7 %}inactive{% elif matomo.armv7 == "verified" %}success{% elif matomo.armv7 == "supported" %}informational{% elif matomo.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ matomo.version }}

## SETUP

### Enabling matomo

#### Command:

**`vlab set matomo.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=matomo`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

During the setup wizard, your database connection information should all be autopopulated. Just click `Next`.

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

3. run **`vlab update_one service=matomo`** to complete the changes


## ACCESS

matomo (HTTPS) link: [https://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/](https://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/)
matomo (HTTP) link: [http://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/](http://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ matomo.subdomain + "." + tor_domain }}/](http://{{ matomo.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set matomo.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=matomo`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set matomo.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=matomo`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set matomo.domain matomo.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  domain: matomo.com
```

##### Finalising changes:

run: **`vlab update_one service=matomo`**

### SUBDOMAIN
*Default: matomo*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set matomo.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=matomo`**

### VERSION
*Default: {{ matomo.version }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set matomo.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
matomo
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=matomo`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
