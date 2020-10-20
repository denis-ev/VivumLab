# Jellyfin

[Jellyfin](https://github.com/jellyfin/jellyfin) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![amd64_verified](https://img.shields.io/badge/{{ if jellyfin.tested_amd64 }}not_tested{{ else }}{{ jellyfin.tested_amd64 }}{{ endif }}-amd64-{{ if jellyfin.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if jellyfin.tested_arm64 }}not_tested{{ else }}{{ jellyfin.tested_arm64 }}{{ endif }}-arm64-{{ if jellyfin.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if jellyfin.tested_armv8 }}not_tested{{ else }}{{ jellyfin.tested_armv8 }}{{ endif }}-armv8-{{ if jellyfin.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ jellyfin.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling jellyfin

#### Command:

**`vlab set jellyfin.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=jellyfin`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ jellyfin.domain }}/admin*

Create an account with your desired username; as this is the first user, jellyfin makes this account the administrator.

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

3. run **`vlab update_one service=jellyfin`** to complete the changes


## ACCESS

jellyfin (HTTPS) link: [https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/)
jellyfin (HTTP) link: [http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ jellyfin.subdomain + "." + tor_domain }}/](http://{{ jellyfin.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jellyfin.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jellyfin.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set jellyfin.domain jellyfin.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  domain: jellyfin.com
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### SUBDOMAIN
*Default: jellyfin*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set jellyfin.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

### VERSION
*Default: {{jellyfin.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set jellyfin.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jellyfin
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=jellyfin`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
