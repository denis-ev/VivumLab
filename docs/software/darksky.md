# Darksky

[darksky-influxdb](https://github.com/ErwinSteffens/darksky-influxdb) pulls in weather data for your location every 2 minutes from [Darksky](http://darksky.net/) and saves it to your [InfluxDB](software/influxdb) instance.

![amd64_verified](https://img.shields.io/badge/{{ if darksky_influx.tested_amd64 }}not_tested{{ else }}{{ darksky_influx.tested_amd64 }}{{ endif }}-amd64-{{ if darksky_influx.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if darksky_influx.tested_arm64 }}not_tested{{ else }}{{ darksky_influx.tested_arm64 }}{{ endif }}-arm64-{{ if darksky_influx.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if darksky_influx.tested_armv8 }}not_tested{{ else }}{{ darksky_influx.tested_armv8 }}{{ endif }}-armv8-{{ if darksky_influx.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ darksky_influx.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling darksky_influx

#### Command:

**`vlab set darksky_influx.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

## Access

There is no direct access to it, but you can create graphs via [Grafana](software/grafana) to visualize it.

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set darksky_influx.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set darksky_influx.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set darksky_influx.domain darksky_influx.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  domain: darksky_influx.com
```

##### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

### SUBDOMAIN
*Default: darksky_influx*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set darksky_influx.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

### VERSION
*Default: {{darksky_influx.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set darksky_influx.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
darksky_influx
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=darksky_influx`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
