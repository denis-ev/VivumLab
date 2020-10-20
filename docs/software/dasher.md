# Dasher

[Dasher](https://github.com/maddox/dasher) provides support for triggering things when you press one of those free Amazon Dash buttons.

![amd64_verified](https://img.shields.io/badge/{{ if dasher.tested_amd64 }}not_tested{{ else }}{{ dasher.tested_amd64 }}{{ endif }}-amd64-{{ if dasher.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if dasher.tested_arm64 }}not_tested{{ else }}{{ dasher.tested_arm64 }}{{ endif }}-arm64-{{ if dasher.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if dasher.tested_armv8 }}not_tested{{ else }}{{ dasher.tested_armv8 }}{{ endif }}-armv8-{{ if dasher.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ dasher.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling dasher

#### Command:

**`vlab set dasher.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=dasher`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ dasher.domain }}/admin*

Create an account with your desired username; as this is the first user, dasher makes this account the administrator.

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

3. run **`vlab update_one service=dasher`** to complete the changes


## Access

No direct access, but like all the images you can tail the logs in [Portainer](software/portainer)

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set dasher.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=dasher`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set dasher.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=dasher`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set dasher.domain dasher.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  domain: dasher.com
```

##### Finalising changes:

run: **`vlab update_one service=dasher`**

### SUBDOMAIN
*Default: dasher*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set dasher.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=dasher`**

### VERSION
*Default: {{dasher.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set dasher.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dasher
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=dasher`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
