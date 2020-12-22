---
id: grafana
title: Grafana
hide_title: true
hide_table_of_contents: false
sidebar_label: Grafana
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Grafana

[Grafana](https://grafana.com/) is a Time Series Database graphing application.

![amd64](https://img.shields.io/badge/{% if not grafana.amd64 %}untested{% else %}{{ grafana.amd64 }}{% endif %}-amd64-{% if not grafana.amd64 %}inactive{% elif grafana.amd64 == "verified" %}success{% elif grafana.amd64 == "supported" %}informational{% elif grafana.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not grafana.arm64 %}untested{% else %}{{ grafana.arm64 }}{% endif %}-arm64-{% if not grafana.arm64 %}inactive{% elif grafana.arm64 == "verified" %}success{% elif grafana.arm64 == "supported" %}informational{% elif grafana.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not grafana.armv7 %}untested{% else %}{{ grafana.armv7 }}{% endif %}-armv7-{% if not grafana.armv7 %}inactive{% elif grafana.armv7 == "verified" %}success{% elif grafana.armv7 == "supported" %}informational{% elif grafana.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ grafana.version }}

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

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

You can use it to visualize the Weather data imported by [influxdb_darksky](darksky),
power, activity, and other data from [Home Assistant](homeassistant), and general server
information via Telegraf.

Grafana comes configured with a Dashboard and Datasource connected for you out of the box. This default
dash and datasource will only with if you have the [TICK](tick) stack enabled.

You can login with the default user and pass you setup for VivumLab.

To reset the admin password run `docker exec -it grafana_grafana_1 grafana-cli admin reset-admin-password 12345`.

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

3. run **`vlab update_one service=grafana`** to complete the changes


## ACCESS

grafana (HTTPS) link: [https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/)
grafana (HTTP) link: [http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ grafana.subdomain + "." + tor_domain }}/](http://{{ grafana.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
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
*Default: False* <br />
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
*Default: False* <br />
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
*Default: grafana* <br />
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
*Default: {{  grafana.version  }}* <br />
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
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
