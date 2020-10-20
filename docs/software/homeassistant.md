# Home Assistant

[Home Assistant](https://www.home-assistant.io/) can automate just about any part of your home.

![amd64_verified](https://img.shields.io/badge/{{ if homeassistant.tested_amd64 }}not_tested{{ else }}{{ homeassistant.tested_amd64 }}{{ endif }}-amd64-{{ if homeassistant.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if homeassistant.tested_arm64 }}not_tested{{ else }}{{ homeassistant.tested_arm64 }}{{ endif }}-arm64-{{ if homeassistant.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if homeassistant.tested_armv8 }}not_tested{{ else }}{{ homeassistant.tested_armv8 }}{{ endif }}-armv8-{{ if homeassistant.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ homeassistant.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling homeassistant

#### Command:

**`vlab set homeassistant.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homeassistant`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homeassistant.domain }}/admin*

Create an account with your desired username; as this is the first user, homeassistant makes this account the administrator.

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

3. run **`vlab update_one service=homeassistant`** to complete the changes


## ACCESS

homeassistant (HTTPS) link: [https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)
homeassistant (HTTP) link: [http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homeassistant.subdomain + "." + tor_domain }}/](http://{{ homeassistant.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homeassistant.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homeassistant.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homeassistant.domain homeassistant.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  domain: homeassistant.com
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### SUBDOMAIN
*Default: homeassistant*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homeassistant.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

### VERSION
*Default: {{homeassistant.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homeassistant.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homeassistant
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homeassistant`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
