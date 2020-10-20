# Grafana

[Grafana](https://grafana.com/) is a Time Series Database graphing application.

![amd64_verified](https://img.shields.io/badge/{{ if grafana.tested_amd64 }}not_tested{{ else }}{{ grafana.tested_amd64 }}{{ endif }}-amd64-{{ if grafana.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if grafana.tested_arm64 }}not_tested{{ else }}{{ grafana.tested_arm64 }}{{ endif }}-arm64-{{ if grafana.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if grafana.tested_armv8 }}not_tested{{ else }}{{ grafana.tested_armv8 }}{{ endif }}-armv8-{{ if grafana.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ grafana.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling grafana

#### Command:

**`vlab set grafana.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=grafana`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

You can use it to visualize the Weather data imported by [influxdb_darksky](software/influxdb_darksky),
power, activity, and other data from [Home Assistant](software/homeassistant), and general server
information via Telegraf.

Grafana comes configured with a Dashboard and Datasource connected for you out of the box. This default
dash and datasource will only with if you have the [TICK](software/tick) stack enabled.

You can login with the default user and pass you setup for VivumLab.

To reset the admin password run `docker exec -it grafana_grafana_1 grafana-cli admin reset-admin-password 12345`.

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

3. run **`vlab update_one service=grafana`** to complete the changes


## ACCESS

grafana (HTTPS) link: [https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/)
grafana (HTTP) link: [http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ grafana.subdomain + "." + tor_domain }}/](http://{{ grafana.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set grafana.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=grafana`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set grafana.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=grafana`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set grafana.domain grafana.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  domain: grafana.com
```

##### Finalising changes:

run: **`vlab update_one service=grafana`**

### SUBDOMAIN
*Default: grafana*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set grafana.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=grafana`**

### VERSION
*Default: {{grafana.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set grafana.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
grafana
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=grafana`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
