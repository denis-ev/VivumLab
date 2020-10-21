# Ghost

[Ghost](http://ghost.org/) is a fully open source, adaptable platform for building and running a modern online publication.

![amd64](https://img.shields.io/badge/{% if not ghost.amd64 %}untested{% else %}{{ ghost.amd64 }}{% endif %}-amd64-{% if not ghost.amd64 %}inactive{% elif ghost.amd64 == "verified" %}success{% elif ghost.amd64 == "supported" %}informational{% elif ghost.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not ghost.arm64 %}untested{% else %}{{ ghost.arm64 }}{% endif %}-arm64-{% if not ghost.arm64 %}inactive{% elif ghost.arm64 == "verified" %}success{% elif ghost.arm64 == "supported" %}informational{% elif ghost.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not ghost.armv7 %}untested{% else %}{{ ghost.armv7 }}{% endif %}-armv7-{% if not ghost.armv7 %}inactive{% elif ghost.armv7 == "verified" %}success{% elif ghost.armv7 == "supported" %}informational{% elif ghost.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ ghost.version }}

## SETUP

### Enabling ghost

#### Command:

**`vlab set ghost.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=ghost`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

It is important to secure Ghost! Access the Ghost admin with [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/), and create an account.

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

3. run **`vlab update_one service=ghost`** to complete the changes


## ACCESS

ghost (HTTPS) link: [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)
ghost (HTTP) link: [http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ ghost.subdomain + "." + tor_domain }}/](http://{{ ghost.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set ghost.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set ghost.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set ghost.domain ghost.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  domain: ghost.com
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### SUBDOMAIN
*Default: ghost*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set ghost.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

### VERSION
*Default: {{  ghost.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set ghost.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
ghost
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=ghost`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
