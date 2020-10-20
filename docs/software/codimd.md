# CodiMD

[CodiMD](https://demo.codimd.org/) The best platform to write and share markdown

![amd64_verified](https://img.shields.io/badge/{{ if codimd.tested_amd64 }}not_tested{{ else }}{{ codimd.tested_amd64 }}{{ endif }}-amd64-{{ if codimd.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if codimd.tested_arm64 }}not_tested{{ else }}{{ codimd.tested_arm64 }}{{ endif }}-arm64-{{ if codimd.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if codimd.tested_armv8 }}not_tested{{ else }}{{ codimd.tested_armv8 }}{{ endif }}-armv8-{{ if codimd.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ codimd.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling codimd

#### Command:

**`vlab set codimd.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>codimd
  enable: True

#### Finalising changes:

run: **`vlab update_one service=codimd`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ codimd.domain }}/admin*

Create an account with your desired username; as this is the first user, codimd makes this account the administrator.

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

3. run **`vlab update_one service=codimd`** to complete the changes


## ACCESS

Codimd (HTTPS) link: [https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/)
Codimd (HTTP) link: [http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ codimd.subdomain + "." + tor_domain }}/](http://{{ codimd.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codimd.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codimd.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set codimd.domain codimd.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  domain: codimd.com
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### SUBDOMAIN
*Default: codimd*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set codimd.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

### VERSION
*Default: {{codimd.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set codimd.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codimd
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=codimd`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
