# DuckDNS

[DuckDNS](http://duckdns.org/) is free dynamic DNS hosted on AWS. This provides a client to update the IP pointed to by DuckDNS.

![amd64_verified](https://img.shields.io/badge/{{ if duckdns.tested_amd64 }}not_tested{{ else }}{{ duckdns.tested_amd64 }}{{ endif }}-amd64-{{ if duckdns.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if duckdns.tested_arm64 }}not_tested{{ else }}{{ duckdns.tested_arm64 }}{{ endif }}-arm64-{{ if duckdns.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if duckdns.tested_armv8 }}not_tested{{ else }}{{ duckdns.tested_armv8 }}{{ endif }}-armv8-{{ if duckdns.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ duckdns.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

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
*Default: {{duckdns.version}}*
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
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
