# WiFi Card

[WiFi Card](https://wificard.bdw.to/) Make a simple card with your WiFi login details.

![amd64](https://img.shields.io/badge/{% if not wificard.amd64 %}untested{% else %}{{ wificard.amd64 }}{% endif %}-amd64-{% if not wificard.amd64 %}inactive{% elif wificard.amd64 == "verified" %}success{% elif wificard.amd64 == "supported" %}informational{% elif wificard.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not wificard.arm64 %}untested{% else %}{{ wificard.arm64 }}{% endif %}-arm64-{% if not wificard.arm64 %}inactive{% elif wificard.arm64 == "verified" %}success{% elif wificard.arm64 == "supported" %}informational{% elif wificard.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not wificard.armv7 %}untested{% else %}{{ wificard.armv7 }}{% endif %}-armv7-{% if not wificard.armv7 %}inactive{% elif wificard.armv7 == "verified" %}success{% elif wificard.armv7 == "supported" %}informational{% elif wificard.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** https://hub.docker.com/r/bndw/wifi-card
**Current Image Version:** {{ wificard.version }}

## SETUP

### Enabling Kutt

#### Command:

**`vlab set wificard.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=wificard`**

## FIRST RUN

WiFiCard is ready, from the moment it is deployed. See below to access it

## ACCESS

wificard (HTTPS) link: [https://{% if wificard.domain %}{{ wificard.domain }}{% else %}{{ wificard.subdomain + "." + domain }}{% endif %}/](https://{% if wificard.domain %}{{ wificard.domain }}{% else %}{{ wificard.subdomain + "." + domain }}{% endif %}/)
wificard (HTTP) link: [http://{% if wificard.domain %}{{ wificard.domain }}{% else %}{{ wificard.subdomain + "." + domain }}{% endif %}/](http://{% if wificard.domain %}{{ wificard.domain }}{% else %}{{ wificard.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ wificard.subdomain + "." + tor_domain }}/](http://{{ wificard.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set wificard.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  https_only: True
```

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set wificard.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  auth: True
```

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set wificard.domain wificard.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  domain: wificard.com
```

### SUBDOMAIN
*Default: wificard*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set wificard.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  subdomain: media
```

### VERSION
*Default: {{  wificard.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set wificard.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
wificard
  version: 2.7
```

### Finalising changes:

run: **`vlab update_one service=wificard`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://vivumlab.com/docs). \
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
