---
id: speedtest
title: Speedtest
hide_title: true
hide_table_of_contents: false
sidebar_label: Speedtest
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Speedtest

[Speedtest](https://github.com/atribe/Speedtest-for-InfluxDB-and-Grafana) A tool to run periodic speedtests and save them in InfluxDB for graphing in Grafana

![amd64](https://img.shields.io/badge/{% if not speedtest.amd64 %}untested{% else %}{{ speedtest.amd64 }}{% endif %}-amd64-{% if not speedtest.amd64 %}inactive{% elif speedtest.amd64 == "verified" %}success{% elif speedtest.amd64 == "supported" %}informational{% elif speedtest.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not speedtest.arm64 %}untested{% else %}{{ speedtest.arm64 }}{% endif %}-arm64-{% if not speedtest.arm64 %}inactive{% elif speedtest.arm64 == "verified" %}success{% elif speedtest.arm64 == "supported" %}informational{% elif speedtest.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not speedtest.armv7 %}untested{% else %}{{ speedtest.armv7 }}{% endif %}-armv7-{% if not speedtest.armv7 %}inactive{% elif speedtest.armv7 == "verified" %}success{% elif speedtest.armv7 == "supported" %}informational{% elif speedtest.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ speedtest.version }}

## SETUP

### Enabling speedtest

#### Command:

**`vlab set speedtest.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=speedtest`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ speedtest.domain }}/admin*

Create an account with your desired username; as this is the first user, speedtest makes this account the administrator.

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

3. run **`vlab update_one service=speedtest`** to complete the changes


## ACCESS

speedtest (HTTPS) link: [https://{% if speedtest.domain %}{{ speedtest.domain }}{% else %}{{ speedtest.subdomain + "." + domain }}{% endif %}/](https://{% if speedtest.domain %}{{ speedtest.domain }}{% else %}{{ speedtest.subdomain + "." + domain }}{% endif %}/)
speedtest (HTTP) link: [http://{% if speedtest.domain %}{{ speedtest.domain }}{% else %}{{ speedtest.subdomain + "." + domain }}{% endif %}/](http://{% if speedtest.domain %}{{ speedtest.domain }}{% else %}{{ speedtest.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ speedtest.subdomain + "." + tor_domain }}/](http://{{ speedtest.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set speedtest.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=speedtest`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set speedtest.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=speedtest`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set speedtest.domain speedtest.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  domain: speedtest.com
```

##### Finalising changes:

run: **`vlab update_one service=speedtest`**

### SUBDOMAIN
*Default: speedtest* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set speedtest.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=speedtest`**

### VERSION
*Default: {{  speedtest.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set speedtest.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
speedtest
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=speedtest`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
