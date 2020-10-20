# Lidarr

[Lidarr](https://lidarr.audio/) Sonarr but for Music.

![amd64_verified](https://img.shields.io/badge/{{ if lidarr.tested_amd64 }}not_tested{{ else }}{{ lidarr.tested_amd64 }}{{ endif }}-amd64-{{ if lidarr.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if lidarr.tested_arm64 }}not_tested{{ else }}{{ lidarr.tested_arm64 }}{{ endif }}-arm64-{{ if lidarr.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if lidarr.tested_armv8 }}not_tested{{ else }}{{ lidarr.tested_armv8 }}{{ endif }}-armv8-{{ if lidarr.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ lidarr.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling lidarr

#### Command:

**`vlab set lidarr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lidarr`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ lidarr.domain }}/admin*

Create an account with your desired username; as this is the first user, lidarr makes this account the administrator.

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

3. run **`vlab update_one service=lidarr`** to complete the changes


## ACCESS

lidarr (HTTPS) link: [https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/)
lidarr (HTTP) link: [http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lidarr.subdomain + "." + tor_domain }}/](http://{{ lidarr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set lidarr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set lidarr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lidarr.domain lidarr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  domain: lidarr.com
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### SUBDOMAIN
*Default: lidarr*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lidarr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

### VERSION
*Default: {{lidarr.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lidarr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lidarr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lidarr`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
