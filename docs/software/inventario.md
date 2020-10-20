# Inventario

[Inventario](https://gitlab.com/NickBusey/inventario) is a home inventory managament system.

![amd64_verified](https://img.shields.io/badge/{{ if inventario.tested_amd64 }}not_tested{{ else }}{{ inventario.tested_amd64 }}{{ endif }}-amd64-{{ if inventario.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if inventario.tested_arm64 }}not_tested{{ else }}{{ inventario.tested_arm64 }}{{ endif }}-arm64-{{ if inventario.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if inventario.tested_armv8 }}not_tested{{ else }}{{ inventario.tested_armv8 }}{{ endif }}-armv8-{{ if inventario.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ inventario.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling inventario

#### Command:

**`vlab set inventario.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=inventario`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ inventario.domain }}/admin*

Create an account with your desired username; as this is the first user, inventario makes this account the administrator.

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

3. run **`vlab update_one service=inventario`** to complete the changes


## ACCESS

inventario (HTTPS) link: [https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/)
inventario (HTTP) link: [http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ inventario.subdomain + "." + tor_domain }}/](http://{{ inventario.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set inventario.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set inventario.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set inventario.domain inventario.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  domain: inventario.com
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### SUBDOMAIN
*Default: inventario*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set inventario.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

### VERSION
*Default: {{inventario.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set inventario.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
inventario
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=inventario`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
