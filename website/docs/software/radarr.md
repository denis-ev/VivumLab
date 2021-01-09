---
id: radarr
title: Radarr
hide_title: true
hide_table_of_contents: false
sidebar_label: Radarr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Radarr

[Radarr](https://radarr.video/) (Automated movie downloading

![amd64](https://img.shields.io/badge/{% if not radarr.amd64 %}untested{% else %}{{ radarr.amd64 }}{% endif %}-amd64-{% if not radarr.amd64 %}inactive{% elif radarr.amd64 == "verified" %}success{% elif radarr.amd64 == "supported" %}informational{% elif radarr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not radarr.arm64 %}untested{% else %}{{ radarr.arm64 }}{% endif %}-arm64-{% if not radarr.arm64 %}inactive{% elif radarr.arm64 == "verified" %}success{% elif radarr.arm64 == "supported" %}informational{% elif radarr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not radarr.armv7 %}untested{% else %}{{ radarr.armv7 }}{% endif %}-armv7-{% if not radarr.armv7 %}inactive{% elif radarr.armv7 == "verified" %}success{% elif radarr.armv7 == "supported" %}informational{% elif radarr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ radarr.version }}

## SETUP

### Enabling radarr

#### Command:

**`vlab set radarr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=radarr`**

## FIRST RUN

To make Radarr work, you need to configure an Indexer and a Download Client.

### Indexer: Jackett

The Download Client will be [Jackett](jackett.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Radarr, go to `Settings` then the `Indexers` tab, and click the Plus button.
Select the `Custom` button undernear `Torznab` and enter `Jackett` for the name, for the URL enter `http://jackett:9117/api/v2.0/indexers/all/results/torznab/` and for the API Key, enter the API key that Jackett displays on its Dashboard.

### Download client: Transmission

The Download Client will be [Transmission](transmission.md), you should make sure
that you have it installed and configured to follow these instructions.
Then, in Radarr, go to the `Download Client` tab, toggle the `Advanced Settings` toggle in the top right to `Shown`, then click the Plus button,
select `Transmission`.
In the form that popped up, enter `transmission` for host, `9091` for port, and your transmission username and password in their respective fields.

Indicate the following value for the `Directory` field:
* `/data/complete/movies`

Click `Save` to close the modal window. Back in the `Advanced settings` screen,
add a "**Remote Path Mappings**" with the following values:
* Host: `transmission`
* Local Path:  `/downloads`
* (Radarr) Remote Path: `/data/complete/movies`

### Usage

We recommend that you make sure you point Radarr to `/movies`when you add a movie.

Now if you add some content, either a movie to Radarr, they will automatically be searched and downloaded according to your settings.

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

3. run **`vlab update_one service=radarr`** to complete the changes


## ACCESS

radarr (HTTPS) link: [https://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/](https://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/)
radarr (HTTP) link: [http://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/](http://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ radarr.subdomain + "." + tor_domain }}/](http://{{ radarr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set radarr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=radarr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set radarr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=radarr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set radarr.domain radarr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  domain: radarr.com
```

##### Finalising changes:

run: **`vlab update_one service=radarr`**

### SUBDOMAIN
*Default: radarr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set radarr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=radarr`**

### VERSION
*Default: {{  radarr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set radarr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
radarr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=radarr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
