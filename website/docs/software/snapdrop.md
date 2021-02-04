# SnapDrop

[SnapDrop](https://snapdrop.net) Snapdrop: local file sharing in your browser. Inspired by Apple's Airdrop.

![amd64](https://img.shields.io/badge/{% if not snapdrop.amd64 %}untested{% else %}{{ snapdrop.amd64 }}{% endif %}-amd64-{% if not snapdrop.amd64 %}inactive{% elif snapdrop.amd64 == "verified" %}success{% elif snapdrop.amd64 == "supported" %}informational{% elif snapdrop.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br>
![arm64](https://img.shields.io/badge/{% if not snapdrop.arm64 %}untested{% else %}{{ snapdrop.arm64 }}{% endif %}-arm64-{% if not snapdrop.arm64 %}inactive{% elif snapdrop.arm64 == "verified" %}success{% elif snapdrop.arm64 == "supported" %}informational{% elif snapdrop.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br>
![armv7](https://img.shields.io/badge/{% if not snapdrop.armv7 %}untested{% else %}{{ snapdrop.armv7 }}{% endif %}-armv7-{% if not snapdrop.armv7 %}inactive{% elif snapdrop.armv7 == "verified" %}success{% elif snapdrop.armv7 == "supported" %}informational{% elif snapdrop.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br>

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br>
**Current Image Version:** {{ snapdrop.version }}

## SETUP

### Enabling SnapDrop

#### Command:

**`vlab set snapdrop.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=snapdrop`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br>
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ snapdrop.domain }}/admin*

Create an account with your desired username; as this is the first user, snapdrop makes this account the administrator.

### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file
2. make some changes


#### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=snapdrop`** to complete the changes


## ACCESS

snapdrop (HTTPS) link: [https://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/](https://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/)
snapdrop (HTTP) link: [http://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/](http://{% if snapdrop.domain %}{{ snapdrop.domain }}{% else %}{{ snapdrop.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ snapdrop.subdomain + "." + tor_domain }}/](http://{{ snapdrop.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br>
*Options: True/False*

#### Command:

**`vlab set snapdrop.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  https_only: True
```

### AUTH
*Default: False* <br>
*Options: True/False*

#### Command:

**`vlab set snapdrop.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  auth: True
```

### DOMAIN
*Default: False* <br>
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set snapdrop.domain snapdrop.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  domain: snapdrop.com
```

### SUBDOMAIN
*Default: snapdrop* <br>
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set snapdrop.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  subdomain: media
```

### VERSION
*Default: {{  snapdrop.version  }}* <br>
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set snapdrop.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
snapdrop
  version: 2.7
```

### Finalising changes:

run: **`vlab update_one service=snapdrop`**

## Need more help?
Further information regarding services can be found. <br>
General Information can be found in the [documentation](https://vivumlab.com/docs). <br>
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
