# Lazylibrarian

[Lazylibrarian](https://lazylibrarian.gitlab.io/) LazyLibrarian is a program to follow authors and grab metadata for all your digital reading needs.

![amd64_verified](https://img.shields.io/badge/{{ if lazylibrarian.tested_amd64 }}not_tested{{ else }}{{ lazylibrarian.tested_amd64 }}{{ endif }}-amd64-{{ if lazylibrarian.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if lazylibrarian.tested_arm64 }}not_tested{{ else }}{{ lazylibrarian.tested_arm64 }}{{ endif }}-arm64-{{ if lazylibrarian.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if lazylibrarian.tested_armv8 }}not_tested{{ else }}{{ lazylibrarian.tested_armv8 }}{{ endif }}-armv8-{{ if lazylibrarian.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ lazylibrarian.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling lazylibrarian

#### Command:

**`vlab set lazylibrarian.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ lazylibrarian.domain }}/admin*

Create an account with your desired username; as this is the first user, lazylibrarian makes this account the administrator.

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

3. run **`vlab update_one service=lazylibrarian`** to complete the changes


## ACCESS

lazylibrarian (HTTPS) link: [https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/)
lazylibrarian (HTTP) link: [http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lazylibrarian.subdomain + "." + tor_domain }}/](http://{{ lazylibrarian.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set lazylibrarian.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set lazylibrarian.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lazylibrarian.domain lazylibrarian.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  domain: lazylibrarian.com
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### SUBDOMAIN
*Default: lazylibrarian*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lazylibrarian.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

### VERSION
*Default: {{lazylibrarian.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lazylibrarian.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lazylibrarian
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lazylibrarian`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
