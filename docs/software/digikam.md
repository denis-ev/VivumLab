# Digikam

[Digikam](https://www.digikam.org/) Professional Photo Management with the Power of Open Source

![amd64_verified](https://img.shields.io/badge/{{ if digikam.tested_amd64 }}not_tested{{ else }}{{ digikam.tested_amd64 }}{{ endif }}-amd64-{{ if digikam.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if digikam.tested_arm64 }}not_tested{{ else }}{{ digikam.tested_arm64 }}{{ endif }}-arm64-{{ if digikam.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if digikam.tested_armv8 }}not_tested{{ else }}{{ digikam.tested_armv8 }}{{ endif }}-armv8-{{ if digikam.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ digikam.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling digikam

#### Command:

**`vlab set digikam.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=digikam`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ digikam.domain }}/admin*

Create an account with your desired username; as this is the first user, digikam makes this account the administrator.

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

3. run **`vlab update_one service=digikam`** to complete the changes


## ACCESS

digikam (HTTPS) link: [https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)
digikam (HTTP) link: [http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ digikam.subdomain + "." + tor_domain }}/](http://{{ digikam.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set digikam.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set digikam.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set digikam.domain digikam.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  domain: digikam.com
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### SUBDOMAIN
*Default: digikam*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set digikam.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

### VERSION
*Default: {{digikam.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set digikam.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
digikam
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=digikam`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
