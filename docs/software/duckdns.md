# DuckDNS

[DuckDNS](http://duckdns.org/) is free dynamic DNS hosted on AWS. This provides a client to update the IP pointed to by DuckDNS.

![amd64](https://img.shields.io/badge/{% if not duckdns.amd64 %}untested{% else %}{{ duckdns.amd64 }}{% endif %}-amd64-{% if not duckdns.amd64 %}inactive{% elif duckdns.amd64 == "verified" %}success{% elif duckdns.amd64 == "supported" %}informational{% elif duckdns.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not duckdns.arm64 %}untested{% else %}{{ duckdns.arm64 }}{% endif %}-arm64-{% if not duckdns.arm64 %}inactive{% elif duckdns.arm64 == "verified" %}success{% elif duckdns.arm64 == "supported" %}informational{% elif duckdns.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not duckdns.armv7 %}untested{% else %}{{ duckdns.armv7 }}{% endif %}-armv7-{% if not duckdns.armv7 %}inactive{% elif duckdns.armv7 == "verified" %}success{% elif duckdns.armv7 == "supported" %}informational{% elif duckdns.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ duckdns.version }}

## SETUP

### Enabling duckdns

#### Command:

**`vlab set duckdns.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duckdns
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=duckdns`**

## FIRST RUN

### Configuration

*Default: False*

Before enabling it create an account at http://duckdns.org/.
Set the token to the one available in the DuckDNS interface.

#### Command:

**`vlab set duckdns.token $TOKEN`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duckdns
  token: $TOKEN
```

#### Finalising changes:

run: **`vlab update_one service=duckdns`**

The service will then update your IP every 5 minutes

## Access

This service does not provide an interface

## OPTIONS

### VERSION
*Default: {{  duckdns.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set duckdns.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
duckdns
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=duckdns`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
