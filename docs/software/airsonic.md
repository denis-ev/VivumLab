# Airsonic

[Airsonic](https://airsonic.github.io/) is a free, web-based media streamer, providing ubiquitous access to your music.

![amd64_verified](https://img.shields.io/badge/{{ if airsonic.tested }}not_tested{{ else }}{{ airsonic.tested }}{{ endif }}-amd64-{{ if airsonic.tested }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if airsonic.tested }}not_tested{{ else }}{{ airsonic.tested }}{{ endif }}-arm64-{{ if airsonic.tested }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if airsonic.tested }}not_tested{{ else }}{{ airsonic.tested }}{{ endif }}-armv8-{{ if airsonic.tested }}red{{ else }}informational{{ endif }}?style=flat)

{% if tested %}
**Docker Image:** https://hub.docker.com/r/linuxserver/airsonic
**Current Image Version:** {{ airsonic.version }}
{% endif %}
**Supported Architectures:** amd64, arm64, armv8

## SETUP

### Enabling Airsonic

#### Command:

**`vlab set airsonic.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  enable: True

#### Finalising changes:

run: **`vlab update_one service=airsonic`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ airsonic.domain }}/admin*

Create an account with your desired username; as this is the first user, Airsonic makes this account the administrator.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


># SMTP Settings
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:

3. run **`vlab update_one service=airsonic`** to complete the changes

## ACCESS

Airsonic (HTTPS) link: [https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)
Airsonic (HTTP) link: [http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ airsonic.subdomain + "." + tor_domain }}/](http://{{ airsonic.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set airsonic.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  https_only: True

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set airsonic.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  auth: True

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set airsonic.domain airsonic.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  domain: airsonic.com

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### SUBDOMAIN
*Default: airsonic*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set airsonic.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  subdomain: media

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

### VERSION
*Default: {{airsonic.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set airsonic.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>airsonic
  version: 2.7

##### Finalising changes:

run: **`vlab update_one service=airsonic`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](../index.md).
Additional assistance can be found on our [Contact Us](../Contact-us.md) page.
