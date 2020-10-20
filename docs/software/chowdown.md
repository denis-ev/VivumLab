# Chowdown

[Chowdown](https://hub.docker.com/r/gregyankovoy/chowdown)  Simple recipes in Markdown format

![amd64_verified](https://img.shields.io/badge/{{ if chowdown.tested_amd64 }}not_tested{{ else }}{{ chowdown.tested_amd64 }}{{ endif }}-amd64-{{ if chowdown.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if chowdown.tested_arm64 }}not_tested{{ else }}{{ chowdown.tested_arm64 }}{{ endif }}-arm64-{{ if chowdown.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if chowdown.tested_armv8 }}not_tested{{ else }}{{ chowdown.tested_armv8 }}{{ endif }}-armv8-{{ if chowdown.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ chowdown.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling chowdown

#### Command:

**`vlab set chowdown.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>chowdown
  enable: True

#### Finalising changes:

run: **`vlab update_one service=chowdown`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ chowdown.domain }}/admin*

Create an account with your desired username; as this is the first user, chowdown makes this account the administrator.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


># SMTP Settings
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:

3. run **`vlab update_one service=chowdown`** to complete the changes


## ACCESS

Chowdown (HTTPS) link: [https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/)
Chowdown (HTTP) link: [http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ chowdown.subdomain + "." + tor_domain }}/](http://{{ chowdown.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set chowdown.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set chowdown.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set chowdown.domain chowdown.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  domain: chowdown.com
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### SUBDOMAIN
*Default: chowdown*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set chowdown.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### VERSION
*Default: {{chowdown.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set chowdown.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
