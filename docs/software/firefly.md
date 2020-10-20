# Firefly III

[Firefly III](https://firefly-iii.org/) is a money management app.

![amd64_verified](https://img.shields.io/badge/{{ if firefly_iii.tested_amd64 }}not_tested{{ else }}{{ firefly_iii.tested_amd64 }}{{ endif }}-amd64-{{ if firefly_iii.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if firefly_iii.tested_arm64 }}not_tested{{ else }}{{ firefly_iii.tested_arm64 }}{{ endif }}-arm64-{{ if firefly_iii.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if firefly_iii.tested_armv8 }}not_tested{{ else }}{{ firefly_iii.tested_armv8 }}{{ endif }}-armv8-{{ if firefly_iii.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ firefly_iii.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling firefly_iii

#### Command:

**`vlab set firefly_iii.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ firefly_iii.domain }}/admin*

Create an account with your desired username; as this is the first user, firefly_iii makes this account the administrator.

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

3. run **`vlab update_one service=firefly_iii`** to complete the changes


## ACCESS

firefly_iii (HTTPS) link: [https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)
firefly_iii (HTTP) link: [http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ firefly_iii.subdomain + "." + tor_domain }}/](http://{{ firefly_iii.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set firefly_iii.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set firefly_iii.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set firefly_iii.domain firefly_iii.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  domain: firefly_iii.com
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### SUBDOMAIN
*Default: firefly_iii*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set firefly_iii.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

### VERSION
*Default: {{firefly_iii.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set firefly_iii.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
firefly_iii
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=firefly_iii`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
