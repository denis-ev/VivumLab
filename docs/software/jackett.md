# Jackett

[Jackett](https://github.com/Jackett/Jackett) provides API Support for your favorite torrent trackers.

![amd64](https://img.shields.io/badge/{% if not jackett.amd64 %}untested{% else %}{{ jackett.amd64 }}{% endif %}-amd64-{% if not jackett.amd64 %}inactive{% elif jackett.amd64 == "verified" %}success{% elif jackett.amd64 == "supported" %}informational{% elif jackett.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not jackett.arm64 %}untested{% else %}{{ jackett.arm64 }}{% endif %}-arm64-{% if not jackett.arm64 %}inactive{% elif jackett.arm64 == "verified" %}success{% elif jackett.arm64 == "supported" %}informational{% elif jackett.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not jackett.armv7 %}untested{% else %}{{ jackett.armv7 }}{% endif %}-armv7-{% if not jackett.armv7 %}inactive{% elif jackett.armv7 == "verified" %}success{% elif jackett.armv7 == "supported" %}informational{% elif jackett.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ jackett.version }}

## SETUP

### Enabling jackett

#### Command:

**`vlab set jackett.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=jackett`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

It is important to secure Jackett! Access the Jackett dashboard with the links below,
scroll down to the `Jackett Configuration` section, and set a value for `Admin Password`.
Hit `Set Password` and you should be good to go.

Set up some indexers in the interface, and now in [Sonarr](sonarr.md) and
[Radarr](radarr.md) you can setup the link to Jackett.

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

3. run **`vlab update_one service=jackett`** to complete the changes


## ACCESS

jackett (HTTPS) link: [https://{% if jackett.domain %}{{ jackett.domain }}{% else %}{{ jackett.subdomain + "." + domain }}{% endif %}/](https://{% if jackett.domain %}{{ jackett.domain }}{% else %}{{ jackett.subdomain + "." + domain }}{% endif %}/)
jackett (HTTP) link: [http://{% if jackett.domain %}{{ jackett.domain }}{% else %}{{ jackett.subdomain + "." + domain }}{% endif %}/](http://{% if jackett.domain %}{{ jackett.domain }}{% else %}{{ jackett.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ jackett.subdomain + "." + tor_domain }}/](http://{{ jackett.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jackett.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=jackett`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jackett.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=jackett`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set jackett.domain jackett.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  domain: jackett.com
```

##### Finalising changes:

run: **`vlab update_one service=jackett`**

### SUBDOMAIN
*Default: jackett*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set jackett.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=jackett`**

### VERSION
*Default: {{  jackett.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set jackett.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jackett
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=jackett`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
