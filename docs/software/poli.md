# Poli

[Poli](https://github.com/shzlw/poli) An easy-to-use BI server built for SQL lovers. Power data analysis in SQL and gain faster business insights.

![amd64](https://img.shields.io/badge/{% if not poli.amd64 %}untested{% else %}{{ poli.amd64 }}{% endif %}-amd64-{% if not poli.amd64 %}inactive{% elif poli.amd64 == "verified" %}success{% elif poli.amd64 == "supported" %}informational{% elif poli.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not poli.arm64 %}untested{% else %}{{ poli.arm64 }}{% endif %}-arm64-{% if not poli.arm64 %}inactive{% elif poli.arm64 == "verified" %}success{% elif poli.arm64 == "supported" %}informational{% elif poli.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not poli.armv7 %}untested{% else %}{{ poli.armv7 }}{% endif %}-armv7-{% if not poli.armv7 %}inactive{% elif poli.armv7 == "verified" %}success{% elif poli.armv7 == "supported" %}informational{% elif poli.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ poli.version }}

## SETUP

### Enabling poli

#### Command:

**`vlab set poli.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=poli`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ poli.domain }}/admin*

Create an account with your desired username; as this is the first user, poli makes this account the administrator.

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

3. run **`vlab update_one service=poli`** to complete the changes


## ACCESS

poli (HTTPS) link: [https://{% if poli.domain %}{{ poli.domain }}{% else %}{{ poli.subdomain + "." + domain }}{% endif %}/](https://{% if poli.domain %}{{ poli.domain }}{% else %}{{ poli.subdomain + "." + domain }}{% endif %}/)
poli (HTTP) link: [http://{% if poli.domain %}{{ poli.domain }}{% else %}{{ poli.subdomain + "." + domain }}{% endif %}/](http://{% if poli.domain %}{{ poli.domain }}{% else %}{{ poli.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ poli.subdomain + "." + tor_domain }}/](http://{{ poli.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set poli.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=poli`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set poli.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=poli`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set poli.domain poli.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  domain: poli.com
```

##### Finalising changes:

run: **`vlab update_one service=poli`**

### SUBDOMAIN
*Default: poli*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set poli.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=poli`**

### VERSION
*Default: {{  poli.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set poli.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
poli
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=poli`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
