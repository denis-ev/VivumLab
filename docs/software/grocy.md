# Grocy

[Grocy](https://grocy.info) ERP beyond your fridge - grocy is a web-based self-hosted groceries & household management solution for your home

![amd64_verified](https://img.shields.io/badge/{{ if grocy.tested_amd64 }}not_tested{{ else }}{{ grocy.tested_amd64 }}{{ endif }}-amd64-{{ if grocy.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if grocy.tested_arm64 }}not_tested{{ else }}{{ grocy.tested_arm64 }}{{ endif }}-arm64-{{ if grocy.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if grocy.tested_armv8 }}not_tested{{ else }}{{ grocy.tested_armv8 }}{{ endif }}-armv8-{{ if grocy.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ grocy.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling grocy

#### Command:

**`vlab set grocy.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=grocy`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Default login is user admin with password admin, please change the password immediately (see user menu).

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

3. run **`vlab update_one service=grocy`** to complete the changes


## ACCESS

grocy (HTTPS) link: [https://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/](https://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/)
grocy (HTTP) link: [http://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/](http://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ grocy.subdomain + "." + tor_domain }}/](http://{{ grocy.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set grocy.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=grocy`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set grocy.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=grocy`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set grocy.domain grocy.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  domain: grocy.com
```

##### Finalising changes:

run: **`vlab update_one service=grocy`**

### SUBDOMAIN
*Default: grocy*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set grocy.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=grocy`**

### VERSION
*Default: {{grocy.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set grocy.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grocy
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=grocy`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
