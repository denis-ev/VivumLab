# BulletNotes

[BulletNotes](https://github.com/Vivumlab/BulletNotes/) is an open source note taking app.

![amd64_verified](https://img.shields.io/badge/{{ if bulletnotes.tested_amd64 }}not_tested{{ else }}{{ bulletnotes.tested_amd64 }}{{ endif }}-amd64-{{ if bulletnotes.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if bulletnotes.tested_arm64 }}not_tested{{ else }}{{ bulletnotes.tested_arm64 }}{{ endif }}-arm64-{{ if bulletnotes.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if bulletnotes.tested_armv8 }}not_tested{{ else }}{{ bulletnotes.tested_armv8 }}{{ endif }}-armv8-{{ if bulletnotes.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ bulletnotes.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling bulletnotes

#### Command:

**`vlab set bulletnotes.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bulletnotes.domain }}/admin*

Create an account with your desired username; as this is the first user, bulletnotes makes this account the administrator.

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

3. run **`vlab update_one service=bulletnotes`** to complete the changes


## ACCESS

Bulletnotes (HTTPS) link: [https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)
Bulletnotes (HTTP) link: [http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bulletnotes.subdomain + "." + tor_domain }}/](http://{{ bulletnotes.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bulletnotes.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bulletnotes.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bulletnotes.domain bulletnotes.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  domain: bulletnotes.com
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### SUBDOMAIN
*Default: bulletnotes*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bulletnotes.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

### VERSION
*Default: {{bulletnotes.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bulletnotes.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bulletnotes
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=bulletnotes`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
