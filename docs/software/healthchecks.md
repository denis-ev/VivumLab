# HealthChecks

[HealthChecks](https://HealthChecks.io) A Cron Monitoring Tool written in Python & Django

![amd64](https://img.shields.io/badge/{% if not healthchecks.amd64 %}untested{% else %}{{ healthchecks.amd64 }}{% endif %}-amd64-{% if not healthchecks.amd64 %}inactive{% elif healthchecks.amd64 == "verified" %}success{% elif healthchecks.amd64 == "supported" %}informational{% elif healthchecks.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not healthchecks.arm64 %}untested{% else %}{{ healthchecks.arm64 }}{% endif %}-arm64-{% if not healthchecks.arm64 %}inactive{% elif healthchecks.arm64 == "verified" %}success{% elif healthchecks.arm64 == "supported" %}informational{% elif healthchecks.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not healthchecks.armv7 %}untested{% else %}{{ healthchecks.armv7 }}{% endif %}-armv7-{% if not healthchecks.armv7 %}inactive{% elif healthchecks.armv7 == "verified" %}success{% elif healthchecks.armv7 == "supported" %}informational{% elif healthchecks.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ healthchecks.version }}

## SETUP

### Enabling healthchecks

#### Command:

**`vlab set healthchecks.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=healthchecks`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ healthchecks.domain }}/admin*

Create an account with your desired username; as this is the first user, healthchecks makes this account the administrator.

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

3. run **`vlab update_one service=healthchecks`** to complete the changes


## ACCESS

healthchecks (HTTPS) link: [https://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/](https://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/)
healthchecks (HTTP) link: [http://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/](http://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ healthchecks.subdomain + "." + tor_domain }}/](http://{{ healthchecks.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set healthchecks.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=healthchecks`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set healthchecks.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=healthchecks`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set healthchecks.domain healthchecks.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  domain: healthchecks.com
```

##### Finalising changes:

run: **`vlab update_one service=healthchecks`**

### SUBDOMAIN
*Default: healthchecks*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set healthchecks.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=healthchecks`**

### VERSION
*Default: {{  healthchecks.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set healthchecks.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
healthchecks
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=healthchecks`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
