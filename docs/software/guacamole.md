# Guacamole

[Guacamole](https://guacamole.apache.org) is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.

![amd64_verified](https://img.shields.io/badge/{{ if guacamole.tested_amd64 }}not_tested{{ else }}{{ guacamole.tested_amd64 }}{{ endif }}-amd64-{{ if guacamole.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if guacamole.tested_arm64 }}not_tested{{ else }}{{ guacamole.tested_arm64 }}{{ endif }}-arm64-{{ if guacamole.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if guacamole.tested_armv8 }}not_tested{{ else }}{{ guacamole.tested_armv8 }}{{ endif }}-armv8-{{ if guacamole.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ guacamole.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling guacamole

#### Command:

**`vlab set guacamole.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=guacamole`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Default login is user admin with password admin, please change the password immediately (see user menu).

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

3. run **`vlab update_one service=guacamole`** to complete the changes


## ACCESS

guacamole (HTTPS) link: [https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/](https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/)
guacamole (HTTP) link: [http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/](http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ guacamole.subdomain + "." + tor_domain }}/](http://{{ guacamole.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set guacamole.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set guacamole.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set guacamole.domain guacamole.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  domain: guacamole.com
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### SUBDOMAIN
*Default: guacamole*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set guacamole.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

### VERSION
*Default: {{guacamole.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set guacamole.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
guacamole
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=guacamole`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
