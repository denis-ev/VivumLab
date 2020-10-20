# Duplicati

[Duplicati](https://www.duplicati.com/) Free backup software to store encrypted backups online
For Windows, macOS and Linux.

![amd64_verified](https://img.shields.io/badge/{{ if duplicati.tested_amd64 }}not_tested{{ else }}{{ duplicati.tested_amd64 }}{{ endif }}-amd64-{{ if duplicati.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if duplicati.tested_arm64 }}not_tested{{ else }}{{ duplicati.tested_arm64 }}{{ endif }}-arm64-{{ if duplicati.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if duplicati.tested_armv8 }}not_tested{{ else }}{{ duplicati.tested_armv8 }}{{ endif }}-armv8-{{ if duplicati.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ duplicati.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling duplicati

#### Command:

**`vlab set duplicati.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=duplicati`**

## FIRST RUN

> Note: The password for Duplicati is configured to use the `default_password` set during the initail `make config` (which is then subsequently stored in vault.yml)

## ACCESS

duplicati (HTTPS) link: [https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)
duplicati (HTTP) link: [http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ duplicati.subdomain + "." + tor_domain }}/](http://{{ duplicati.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set duplicati.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set duplicati.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set duplicati.domain duplicati.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  domain: duplicati.com
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### SUBDOMAIN
*Default: duplicati*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set duplicati.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

### VERSION
*Default: {{duplicati.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set duplicati.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duplicati
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=duplicati`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
