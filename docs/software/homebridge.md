# HomeBridge

[HomeBridge](https://homebridge.io/) HomeKit support for the impatient

![amd64_verified](https://img.shields.io/badge/{{ if homebridge.tested_amd64 }}not_tested{{ else }}{{ homebridge.tested_amd64 }}{{ endif }}-amd64-{{ if homebridge.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if homebridge.tested_arm64 }}not_tested{{ else }}{{ homebridge.tested_arm64 }}{{ endif }}-arm64-{{ if homebridge.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if homebridge.tested_armv8 }}not_tested{{ else }}{{ homebridge.tested_armv8 }}{{ endif }}-armv8-{{ if homebridge.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ homebridge.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling homebridge

#### Command:

**`vlab set homebridge.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homebridge`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homebridge.domain }}/admin*

Create an account with your desired username; as this is the first user, homebridge makes this account the administrator.

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

3. run **`vlab update_one service=homebridge`** to complete the changes


## ACCESS

homebridge (HTTPS) link: [https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/)
homebridge (HTTP) link: [http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homebridge.subdomain + "." + tor_domain }}/](http://{{ homebridge.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homebridge.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homebridge.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homebridge.domain homebridge.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  domain: homebridge.com
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### SUBDOMAIN
*Default: homebridge*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homebridge.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

### VERSION
*Default: {{homebridge.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homebridge.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homebridge
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homebridge`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
