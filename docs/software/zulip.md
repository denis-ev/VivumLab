# Zulip

[Zulip](https://github.com/zulip/zulip) is a threaded chat service.

![amd64](https://img.shields.io/badge/{% if not zulip.amd64 %}untested{% else %}{{ zulip.amd64 }}{% endif %}-amd64-{% if not zulip.amd64 %}inactive{% elif zulip.amd64 == "verified" %}success{% elif zulip.amd64 == "supported" %}informational{% elif zulip.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not zulip.arm64 %}untested{% else %}{{ zulip.arm64 }}{% endif %}-arm64-{% if not zulip.arm64 %}inactive{% elif zulip.arm64 == "verified" %}success{% elif zulip.arm64 == "supported" %}informational{% elif zulip.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not zulip.armv7 %}untested{% else %}{{ zulip.armv7 }}{% endif %}-armv7-{% if not zulip.armv7 %}inactive{% elif zulip.armv7 == "verified" %}success{% elif zulip.armv7 == "supported" %}informational{% elif zulip.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ zulip.version }}

## SETUP

### Enabling zulip

#### Command:

**`vlab set zulip.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=zulip`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

[https://github.com/zulip/docker-zulip](https://github.com/zulip/docker-zulip)

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

3. run **`vlab update_one service=zulip`** to complete the changes


## ACCESS

zulip (HTTPS) link: [https://{% if zulip.domain %}{{ zulip.domain }}{% else %}{{ zulip.subdomain + "." + domain }}{% endif %}/](https://{% if zulip.domain %}{{ zulip.domain }}{% else %}{{ zulip.subdomain + "." + domain }}{% endif %}/)
zulip (HTTP) link: [http://{% if zulip.domain %}{{ zulip.domain }}{% else %}{{ zulip.subdomain + "." + domain }}{% endif %}/](http://{% if zulip.domain %}{{ zulip.domain }}{% else %}{{ zulip.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ zulip.subdomain + "." + tor_domain }}/](http://{{ zulip.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set zulip.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=zulip`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set zulip.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=zulip`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set zulip.domain zulip.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  domain: zulip.com
```

##### Finalising changes:

run: **`vlab update_one service=zulip`**

### SUBDOMAIN
*Default: zulip*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set zulip.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=zulip`**

### VERSION
*Default: {{  zulip.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set zulip.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
zulip
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=zulip`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
