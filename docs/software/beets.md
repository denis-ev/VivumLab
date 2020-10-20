# Beets

[Beets](https://beets.io) Beets is the media library management system for obsessive-compulsive music geeks.

![amd64_verified](https://img.shields.io/badge/{{ if beets.tested_amd64 }}not_tested{{ else }}{{ beets.tested_amd64 }}{{ endif }}-amd64-{{ if beets.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if beets.tested_arm64 }}not_tested{{ else }}{{ beets.tested_arm64 }}{{ endif }}-arm64-{{ if beets.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if beets.tested_armv8 }}not_tested{{ else }}{{ beets.tested_armv8 }}{{ endif }}-armv8-{{ if beets.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ beets.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling beets

#### Command:

**`vlab set beets.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=beets`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ beets.domain }}/admin*

Create an account with your desired username; as this is the first user, beets makes this account the administrator.

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

3. run **`vlab update_one service=beets`** to complete the changes


## ACCESS

Beets (HTTPS) link: [https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)
Beets (HTTP) link: [http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ beets.subdomain + "." + tor_domain }}/](http://{{ beets.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set beets.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set beets.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set beets.domain beets.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  domain: beets.com
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### SUBDOMAIN
*Default: beets*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set beets.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

### VERSION
*Default: {{beets.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set beets.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
beets
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=beets`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
