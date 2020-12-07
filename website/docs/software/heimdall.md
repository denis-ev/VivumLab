# Heimdall

[Heimdall](https://heimdall.site/) Heimdall Application Dashboard is a dashboard for all your web applications.

![amd64](https://img.shields.io/badge/{% if not heimdall.amd64 %}untested{% else %}{{ heimdall.amd64 }}{% endif %}-amd64-{% if not heimdall.amd64 %}inactive{% elif heimdall.amd64 == "verified" %}success{% elif heimdall.amd64 == "supported" %}informational{% elif heimdall.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not heimdall.arm64 %}untested{% else %}{{ heimdall.arm64 }}{% endif %}-arm64-{% if not heimdall.arm64 %}inactive{% elif heimdall.arm64 == "verified" %}success{% elif heimdall.arm64 == "supported" %}informational{% elif heimdall.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not heimdall.armv7 %}untested{% else %}{{ heimdall.armv7 }}{% endif %}-armv7-{% if not heimdall.armv7 %}inactive{% elif heimdall.armv7 == "verified" %}success{% elif heimdall.armv7 == "supported" %}informational{% elif heimdall.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ heimdall.version }}

## SETUP

### Enabling heimdall

#### Command:

**`vlab set heimdall.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=heimdall`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ heimdall.domain }}/admin*

Create an account with your desired username; as this is the first user, heimdall makes this account the administrator.

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

3. run **`vlab update_one service=heimdall`** to complete the changes


## ACCESS

heimdall (HTTPS) link: [https://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/](https://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/)
heimdall (HTTP) link: [http://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/](http://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ heimdall.subdomain + "." + tor_domain }}/](http://{{ heimdall.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set heimdall.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=heimdall`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set heimdall.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=heimdall`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set heimdall.domain heimdall.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  domain: heimdall.com
```

##### Finalising changes:

run: **`vlab update_one service=heimdall`**

### SUBDOMAIN
*Default: heimdall*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set heimdall.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=heimdall`**

### VERSION
*Default: {{  heimdall.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set heimdall.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
heimdall
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=heimdall`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
