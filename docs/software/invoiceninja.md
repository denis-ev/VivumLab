# Invoice Ninja

[Invoice Ninja](https://www.invoiceninja.org/) Free Open-Source Invoicing

![amd64](https://img.shields.io/badge/{% if not invoiceninja.amd64 %}untested{% else %}{{ invoiceninja.amd64 }}{% endif %}-amd64-{% if not invoiceninja.amd64 %}inactive{% elif invoiceninja.amd64 == "verified" %}success{% elif invoiceninja.amd64 == "supported" %}informational{% elif invoiceninja.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not invoiceninja.arm64 %}untested{% else %}{{ invoiceninja.arm64 }}{% endif %}-arm64-{% if not invoiceninja.arm64 %}inactive{% elif invoiceninja.arm64 == "verified" %}success{% elif invoiceninja.arm64 == "supported" %}informational{% elif invoiceninja.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not invoiceninja.armv7 %}untested{% else %}{{ invoiceninja.armv7 }}{% endif %}-armv7-{% if not invoiceninja.armv7 %}inactive{% elif invoiceninja.armv7 == "verified" %}success{% elif invoiceninja.armv7 == "supported" %}informational{% elif invoiceninja.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ invoiceninja.version }}

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
*Default: False*
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
*Default: {{  invoiceninja.version  }}*
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
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
