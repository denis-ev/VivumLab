# Emby

[Emby](https://emby.media/) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![amd64_verified](https://img.shields.io/badge/{{ if emby.tested_amd64 }}not_tested{{ else }}{{ emby.tested_amd64 }}{{ endif }}-amd64-{{ if emby.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if emby.tested_arm64 }}not_tested{{ else }}{{ emby.tested_arm64 }}{{ endif }}-arm64-{{ if emby.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if emby.tested_armv8 }}not_tested{{ else }}{{ emby.tested_armv8 }}{{ endif }}-armv8-{{ if emby.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ emby.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling emby

#### Command:

**`vlab set emby.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=emby`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ emby.domain }}/admin*

Create an account with your desired username; as this is the first user, emby makes this account the administrator.

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

3. run **`vlab update_one service=emby`** to complete the changes


## ACCESS

emby (HTTPS) link: [https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/)
emby (HTTP) link: [http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ emby.subdomain + "." + tor_domain }}/](http://{{ emby.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set emby.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set emby.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set emby.domain emby.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  domain: emby.com
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### SUBDOMAIN
*Default: emby*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set emby.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

### VERSION
*Default: {{emby.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set emby.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
emby
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=emby`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
