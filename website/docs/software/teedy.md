# Teedy

[Teedy](https://teedy.io) Document Management made simple for everyone

![amd64](https://img.shields.io/badge/{% if not teedy.amd64 %}untested{% else %}{{ teedy.amd64 }}{% endif %}-amd64-{% if not teedy.amd64 %}inactive{% elif teedy.amd64 == "verified" %}success{% elif teedy.amd64 == "supported" %}informational{% elif teedy.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not teedy.arm64 %}untested{% else %}{{ teedy.arm64 }}{% endif %}-arm64-{% if not teedy.arm64 %}inactive{% elif teedy.arm64 == "verified" %}success{% elif teedy.arm64 == "supported" %}informational{% elif teedy.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not teedy.armv7 %}untested{% else %}{{ teedy.armv7 }}{% endif %}-armv7-{% if not teedy.armv7 %}inactive{% elif teedy.armv7 == "verified" %}success{% elif teedy.armv7 == "supported" %}informational{% elif teedy.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ teedy.version }}

## SETUP

### Enabling teedy

#### Command:

**`vlab set teedy.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=teedy`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ teedy.domain }}/admin*

Create an account with your desired username; as this is the first user, teedy makes this account the administrator.

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

3. run **`vlab update_one service=teedy`** to complete the changes


## ACCESS

teedy (HTTPS) link: [https://{% if teedy.domain %}{{ teedy.domain }}{% else %}{{ teedy.subdomain + "." + domain }}{% endif %}/](https://{% if teedy.domain %}{{ teedy.domain }}{% else %}{{ teedy.subdomain + "." + domain }}{% endif %}/)
teedy (HTTP) link: [http://{% if teedy.domain %}{{ teedy.domain }}{% else %}{{ teedy.subdomain + "." + domain }}{% endif %}/](http://{% if teedy.domain %}{{ teedy.domain }}{% else %}{{ teedy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ teedy.subdomain + "." + tor_domain }}/](http://{{ teedy.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set teedy.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=teedy`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set teedy.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=teedy`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set teedy.domain teedy.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  domain: teedy.com
```

##### Finalising changes:

run: **`vlab update_one service=teedy`**

### SUBDOMAIN
*Default: teedy*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set teedy.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=teedy`**

### VERSION
*Default: {{  teedy.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set teedy.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
teedy
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=teedy`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
