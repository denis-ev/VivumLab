# Huginn

[Huginn](https://github.com/huginn/huginn) Create agents that monitor and act on your behalf. Your agents are standing by!

![amd64_verified](https://img.shields.io/badge/{{ if huginn.tested_amd64 }}not_tested{{ else }}{{ huginn.tested_amd64 }}{{ endif }}-amd64-{{ if huginn.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if huginn.tested_arm64 }}not_tested{{ else }}{{ huginn.tested_arm64 }}{{ endif }}-arm64-{{ if huginn.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if huginn.tested_armv8 }}not_tested{{ else }}{{ huginn.tested_armv8 }}{{ endif }}-armv8-{{ if huginn.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ huginn.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling huginn

#### Command:

**`vlab set huginn.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=huginn`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ huginn.domain }}/admin*

Create an account with your desired username; as this is the first user, huginn makes this account the administrator.

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

3. run **`vlab update_one service=huginn`** to complete the changes


## ACCESS

huginn (HTTPS) link: [https://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/](https://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/)
huginn (HTTP) link: [http://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/](http://{% if huginn.domain %}{{ huginn.domain }}{% else %}{{ huginn.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ huginn.subdomain + "." + tor_domain }}/](http://{{ huginn.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set huginn.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set huginn.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set huginn.domain huginn.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  domain: huginn.com
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### SUBDOMAIN
*Default: huginn*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set huginn.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

### VERSION
*Default: {{huginn.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set huginn.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
huginn
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=huginn`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
