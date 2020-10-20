# AdGuard Home

[AdGuard Home](https://adguard.com/en/adguard-home/overview.html) Network-wide software for blocking ads and tracking.

![amd64_verified](https://img.shields.io/badge/{{ if adguardhome.tested_amd64 }}not_tested{{ else }}{{ adguardhome.tested_amd64 }}{{ endif }}-amd64-{{ if adguardhome.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if adguardhome.tested_arm64 }}not_tested{{ else }}{{ adguardhome.tested_arm64 }}{{ endif }}-arm64-{{ if adguardhome.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if adguardhome.tested_armv8 }}not_tested{{ else }}{{ adguardhome.tested_armv8 }}{{ endif }}-armv8-{{ if adguardhome.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ adguardhome.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling adguardhome

#### Command:

**`vlab set adguardhome.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  enable: True

#### Finalising changes:

run: **`vlab update_one service=adguardhome`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ adguardhome.domain }}/admin*

Create an account with your desired username; as this is the first user, adguardhome makes this account the administrator.

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

3. run **`vlab update_one service=adguardhome`** to complete the changes

## ACCESS

AdGuard Home (HTTPS) link: [https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)
AdGuard Home (HTTP) link: [http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ adguardhome.subdomain + "." + tor_domain }}/](http://{{ adguardhome.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set adguardhome.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  https_only: True

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set adguardhome.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  auth: True

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set adguardhome.domain adguardhome.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  domain: adguardhome.com

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### SUBDOMAIN
*Default: adguardhome*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{ domain }}'*

#### Command:

**`vlab set adguardhome.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  subdomain: media

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

### VERSION
*Default: {{ adguardhome.version }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set adguardhome.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>adguardhome
  version: 2.7

##### Finalising changes:

run: **`vlab update_one service=adguardhome`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
