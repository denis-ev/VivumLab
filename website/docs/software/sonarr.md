---
id: sonarr
title: Sonarr
hide_title: true
hide_table_of_contents: false
sidebar_label: Sonarr
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Sonarr

[Sonarr](https://sonarr.tv/) Automated TV show downloading

![amd64](https://img.shields.io/badge/{% if not sonarr.amd64 %}untested{% else %}{{ sonarr.amd64 }}{% endif %}-amd64-{% if not sonarr.amd64 %}inactive{% elif sonarr.amd64 == "verified" %}success{% elif sonarr.amd64 == "supported" %}informational{% elif sonarr.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not sonarr.arm64 %}untested{% else %}{{ sonarr.arm64 }}{% endif %}-arm64-{% if not sonarr.arm64 %}inactive{% elif sonarr.arm64 == "verified" %}success{% elif sonarr.arm64 == "supported" %}informational{% elif sonarr.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not sonarr.armv7 %}untested{% else %}{{ sonarr.armv7 }}{% endif %}-armv7-{% if not sonarr.armv7 %}inactive{% elif sonarr.armv7 == "verified" %}success{% elif sonarr.armv7 == "supported" %}informational{% elif sonarr.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ sonarr.version }}

## SETUP

### Enabling sonarr

#### Command:

**`vlab set sonarr.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=sonarr`**

## FIRST RUN

You will need to configure an Indexer and a Download Client for Sonarr to work.

### Indexer: Jackett

The Download Client will be [Jackett](jackett.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Sonarr, go to `Settings` then the `Indexers` tab, and click the Plus button.
Select the `Custom` button undernear `Torznab` and enter `Jackett` for the name, for the URL enter `http://jackett:9117/api/v2.0/indexers/all/results/torznab/` and for the API Key, enter the API key that Jackett displays on its Dashboard.

### Download client: Transmission

The Download Client will be [Transmission](transmission.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Sonarr, go to the `Download Client` tab, toggle the `Advanced Settings` toggle in the top right to `Shown`, then click the Plus button, select `Transmission`.
In the form that popped up, enter `transmission` for host, `9091` for port, and your transmission username and password in their respective fields. Indicate the following value for the `Directory` field:

* `/data/complete/tv`

Click `Save` to close the modal window. Back in the `Advanced settings` screen, add a "**Remote Path Mappings**" with the following values:
* Host: `transmission`
* Local Path:  `/downloads`
* Remote Path: `/data/complete/tv`

### Usage

We recommend that you make sure you point Sonarr to `/tv`, when you add a TV show.

Now if you add some content to Sonarr, they will automatically be searched and downloaded according to your settings.

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

3. run **`vlab update_one service=sonarr`** to complete the changes


## ACCESS

sonarr (HTTPS) link: [https://{% if sonarr.domain %}{{ sonarr.domain }}{% else %}{{ sonarr.subdomain + "." + domain }}{% endif %}/](https://{% if sonarr.domain %}{{ sonarr.domain }}{% else %}{{ sonarr.subdomain + "." + domain }}{% endif %}/)
sonarr (HTTP) link: [http://{% if sonarr.domain %}{{ sonarr.domain }}{% else %}{{ sonarr.subdomain + "." + domain }}{% endif %}/](http://{% if sonarr.domain %}{{ sonarr.domain }}{% else %}{{ sonarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ sonarr.subdomain + "." + tor_domain }}/](http://{{ sonarr.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sonarr.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=sonarr`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set sonarr.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=sonarr`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set sonarr.domain sonarr.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  domain: sonarr.com
```

##### Finalising changes:

run: **`vlab update_one service=sonarr`**

### SUBDOMAIN
*Default: sonarr* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set sonarr.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=sonarr`**

### VERSION
*Default: {{  sonarr.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set sonarr.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sonarr
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=sonarr`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
