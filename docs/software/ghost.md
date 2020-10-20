# Ghost

[Ghost](http://ghost.org/) is a fully open source, adaptable platform for building and running a modern online publication.

![amd64_verified](https://img.shields.io/badge/{{ if ghost.tested_amd64 }}not_tested{{ else }}{{ ghost.tested_amd64 }}{{ endif }}-amd64-{{ if ghost.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if ghost.tested_arm64 }}not_tested{{ else }}{{ ghost.tested_arm64 }}{{ endif }}-arm64-{{ if ghost.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if ghost.tested_armv8 }}not_tested{{ else }}{{ ghost.tested_armv8 }}{{ endif }}-armv8-{{ if ghost.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ ghost.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling ghost

#### Command:

**`vlab set ghost.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ghost`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

It is important to secure Ghost! Access the Ghost admin with [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/), and create an account.

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

3. run **`vlab update_one service=ghost`** to complete the changes


## ACCESS

ghost (HTTPS) link: [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)
ghost (HTTP) link: [http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ghost.subdomain + "." + tor_domain }}/](http://{{ ghost.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set ghost.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set ghost.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ghost.domain ghost.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  domain: ghost.com
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### SUBDOMAIN
*Default: ghost*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ghost.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### VERSION
*Default: {{ghost.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ghost.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
