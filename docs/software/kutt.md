# Kutt

[Kutt](https://kutt.it) Kutt your links shorter.

![amd64](https://img.shields.io/badge/{% if not kutt.amd64 %}untested{% else %}{{ kutt.amd64 }}{% endif %}-amd64-{% if not kutt.amd64 %}inactive{% elif kutt.amd64 == "verified" %}success{% elif kutt.amd64 == "supported" %}informational{% elif kutt.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not kutt.arm64 %}untested{% else %}{{ kutt.arm64 }}{% endif %}-arm64-{% if not kutt.arm64 %}inactive{% elif kutt.arm64 == "verified" %}success{% elif kutt.arm64 == "supported" %}informational{% elif kutt.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not kutt.armv7 %}untested{% else %}{{ kutt.armv7 }}{% endif %}-armv7-{% if not kutt.armv7 %}inactive{% elif kutt.armv7 == "verified" %}success{% elif kutt.armv7 == "supported" %}informational{% elif kutt.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ kutt.version }}

## SETUP

### Enabling Kutt

#### Command:

**`vlab set kutt.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=kutt`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ kutt.domain }}/admin*

Create an account with your desired username; as this is the first user, kutt makes this account the administrator.

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

3. run **`vlab update_one service=kutt`** to complete the changes


## ACCESS

kutt (HTTPS) link: [https://{% if kutt.domain %}{{ kutt.domain }}{% else %}{{ kutt.subdomain + "." + domain }}{% endif %}/](https://{% if kutt.domain %}{{ kutt.domain }}{% else %}{{ kutt.subdomain + "." + domain }}{% endif %}/)
kutt (HTTP) link: [http://{% if kutt.domain %}{{ kutt.domain }}{% else %}{{ kutt.subdomain + "." + domain }}{% endif %}/](http://{% if kutt.domain %}{{ kutt.domain }}{% else %}{{ kutt.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ kutt.subdomain + "." + tor_domain }}/](http://{{ kutt.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set kutt.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  https_only: True
```

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set kutt.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  auth: True
```

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set kutt.domain kutt.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  domain: kutt.com
```

### SUBDOMAIN
*Default: kutt*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set kutt.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  subdomain: media
```

### VERSION
*Default: {{  kutt.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set kutt.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
kutt
  version: 2.7
```

### Finalising changes:

run: **`vlab update_one service=kutt`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
