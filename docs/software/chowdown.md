# Chowdown

[Chowdown](https://hub.docker.com/r/gregyankovoy/chowdown)  Simple recipes in Markdown format

![amd64](https://img.shields.io/badge/{% if not chowdown.amd64 %}untested{% else %}{{ chowdown.amd64 }}{% endif %}-amd64-{% if not chowdown.amd64 %}inactive{% elif chowdown.amd64 == "verified" %}success{% elif chowdown.amd64 == "supported" %}informational{% elif chowdown.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not chowdown.arm64 %}untested{% else %}{{ chowdown.arm64 }}{% endif %}-arm64-{% if not chowdown.arm64 %}inactive{% elif chowdown.arm64 == "verified" %}success{% elif chowdown.arm64 == "supported" %}informational{% elif chowdown.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not chowdown.armv7 %}untested{% else %}{{ chowdown.armv7 }}{% endif %}-armv7-{% if not chowdown.armv7 %}inactive{% elif chowdown.armv7 == "verified" %}success{% elif chowdown.armv7 == "supported" %}informational{% elif chowdown.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ chowdown.version }}

## SETUP

### Enabling chowdown

#### Command:

**`vlab set chowdown.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>chowdown
  enable: True

#### Finalising changes:

run: **`vlab update_one service=chowdown`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ chowdown.domain }}/admin*

Create an account with your desired username; as this is the first user, chowdown makes this account the administrator.

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

3. run **`vlab update_one service=chowdown`** to complete the changes


## ACCESS

Chowdown (HTTPS) link: [https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/)
Chowdown (HTTP) link: [http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ chowdown.subdomain + "." + tor_domain }}/](http://{{ chowdown.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set chowdown.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set chowdown.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set chowdown.domain chowdown.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  domain: chowdown.com
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### SUBDOMAIN
*Default: chowdown*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set chowdown.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

### VERSION
*Default: {{  chowdown.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set chowdown.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
chowdown
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=chowdown`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
