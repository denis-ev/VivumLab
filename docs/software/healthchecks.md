# HealthChecks

[HealthChecks](https://HealthChecks.io) A Cron Monitoring Tool written in Python & Django

![amd64_verified](https://img.shields.io/badge/{{ if healthchecks.tested_amd64 }}not_tested{{ else }}{{ healthchecks.tested_amd64 }}{{ endif }}-amd64-{{ if healthchecks.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if healthchecks.tested_arm64 }}not_tested{{ else }}{{ healthchecks.tested_arm64 }}{{ endif }}-arm64-{{ if healthchecks.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if healthchecks.tested_armv8 }}not_tested{{ else }}{{ healthchecks.tested_armv8 }}{{ endif }}-armv8-{{ if healthchecks.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ healthchecks.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

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
*Default: {{domain}}*
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
*Default: {{healthchecks.version}}*
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
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
