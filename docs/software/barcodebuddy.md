# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

![amd64_verified](https://img.shields.io/badge/{{ if barcodebuddy.tested_amd64 }}not_tested{{ else }}{{ barcodebuddy.tested_amd64 }}{{ endif }}-amd64-{{ if barcodebuddy.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if barcodebuddy.tested_arm64 }}not_tested{{ else }}{{ barcodebuddy.tested_arm64 }}{{ endif }}-arm64-{{ if barcodebuddy.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if barcodebuddy.tested_armv8 }}not_tested{{ else }}{{ barcodebuddy.tested_armv8 }}{{ endif }}-armv8-{{ if barcodebuddy.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ barcodebuddy.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling barcodebuddy

#### Command:

**`vlab set barcodebuddy.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ barcodebuddy.domain }}/admin*

Create an account with your desired username; as this is the first user, barcodebuddy makes this account the administrator.

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

3. run **`vlab update_one service=barcodebuddy`** to complete the changes


## ACCESS

Barcodebuddy (HTTPS) link: [https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)
Barcodebuddy (HTTP) link: [http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ barcodebuddy.subdomain + "." + tor_domain }}/](http://{{ barcodebuddy.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set barcodebuddy.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set barcodebuddy.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set barcodebuddy.domain barcodebuddy.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  domain: barcodebuddy.com
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### SUBDOMAIN
*Default: barcodebuddy*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set barcodebuddy.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

### VERSION
*Default: {{barcodebuddy.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set barcodebuddy.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
barcodebuddy
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=barcodebuddy`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
