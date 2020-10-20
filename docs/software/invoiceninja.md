# Invoice Ninja

[Invoice Ninja](https://www.invoiceninja.org/) Free Open-Source Invoicing

![amd64_verified](https://img.shields.io/badge/{{ if invoiceninja.tested_amd64 }}not_tested{{ else }}{{ invoiceninja.tested_amd64 }}{{ endif }}-amd64-{{ if invoiceninja.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if invoiceninja.tested_arm64 }}not_tested{{ else }}{{ invoiceninja.tested_arm64 }}{{ endif }}-arm64-{{ if invoiceninja.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if invoiceninja.tested_armv8 }}not_tested{{ else }}{{ invoiceninja.tested_armv8 }}{{ endif }}-armv8-{{ if invoiceninja.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ invoiceninja.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling invoiceninja

#### Command:

**`vlab set invoiceninja.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ invoiceninja.domain }}/admin*

Create an account with your desired username; as this is the first user, invoiceninja makes this account the administrator.

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

3. run **`vlab update_one service=invoiceninja`** to complete the changes


## ACCESS

invoiceninja (HTTPS) link: [https://{% if invoiceninja.domain %}{{ invoiceninja.domain }}{% else %}{{ invoiceninja.subdomain + "." + domain }}{% endif %}/](https://{% if invoiceninja.domain %}{{ invoiceninja.domain }}{% else %}{{ invoiceninja.subdomain + "." + domain }}{% endif %}/)
invoiceninja (HTTP) link: [http://{% if invoiceninja.domain %}{{ invoiceninja.domain }}{% else %}{{ invoiceninja.subdomain + "." + domain }}{% endif %}/](http://{% if invoiceninja.domain %}{{ invoiceninja.domain }}{% else %}{{ invoiceninja.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ invoiceninja.subdomain + "." + tor_domain }}/](http://{{ invoiceninja.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set invoiceninja.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set invoiceninja.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set invoiceninja.domain invoiceninja.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  domain: invoiceninja.com
```

##### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

### SUBDOMAIN
*Default: invoiceninja*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set invoiceninja.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

### VERSION
*Default: {{invoiceninja.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set invoiceninja.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
invoiceninja
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=invoiceninja`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
