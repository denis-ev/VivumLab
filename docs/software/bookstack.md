# bookstack

[Bookstack](https://www.bookstackapp.com/) Simple & Free Wiki Software

![amd64_verified](https://img.shields.io/badge/{{ if bookstack.tested_amd64 }}not_tested{{ else }}{{ bookstack.tested_amd64 }}{{ endif }}-amd64-{{ if bookstack.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if bookstack.tested_arm64 }}not_tested{{ else }}{{ bookstack.tested_arm64 }}{{ endif }}-arm64-{{ if bookstack.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if bookstack.tested_armv8 }}not_tested{{ else }}{{ bookstack.tested_armv8 }}{{ endif }}-armv8-{{ if bookstack.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ bookstack.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling bookstack

#### Command:

**`vlab set bookstack.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bookstack`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bookstack.domain }}/admin*

Create an account with your desired username; as this is the first user, bookstack makes this account the administrator.

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

3. run **`vlab update_one service=bookstack`** to complete the changes


## ACCESS

Bookstack (HTTPS) link: [https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)
Bookstack (HTTP) link: [http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bookstack.subdomain + "." + tor_domain }}/](http://{{ bookstack.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bookstack.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bookstack.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bookstack.domain bookstack.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  domain: bookstack.com
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### SUBDOMAIN
*Default: bookstack*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bookstack.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

### VERSION
*Default: {{bookstack.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bookstack.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bookstack
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=bookstack`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
