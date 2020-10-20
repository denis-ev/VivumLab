# Calibre

[Calibre](https://calibre-ebook.com) Ebook management system.

[Calibre Web](https://github.com/janeczku/calibre-web) Web app for accessing ebook library

![amd64_verified](https://img.shields.io/badge/{{ if calibre.tested_amd64 }}not_tested{{ else }}{{ calibre.tested_amd64 }}{{ endif }}-amd64-{{ if calibre.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if calibre.tested_arm64 }}not_tested{{ else }}{{ calibre.tested_arm64 }}{{ endif }}-arm64-{{ if calibre.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if calibre.tested_armv8 }}not_tested{{ else }}{{ calibre.tested_armv8 }}{{ endif }}-armv8-{{ if calibre.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ calibre.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling calibre

#### Command:

**`vlab set calibre.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=calibre`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ calibre.domain }}/admin*

Create an account with your desired username; as this is the first user, calibre makes this account the administrator.

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

3. run **`vlab update_one service=calibre`** to complete the changes


## ACCESS

Calibre (HTTPS) link: [https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)
Calibre (HTTP) link: [http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ calibre.subdomain + "." + tor_domain }}/](http://{{ calibre.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set calibre.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set calibre.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set calibre.domain calibre.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  domain: calibre.com
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### SUBDOMAIN
*Default: calibre*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set calibre.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

### VERSION
*Default: {{calibre.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set calibre.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
calibre
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=calibre`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
