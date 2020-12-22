---
id: funkwhale
title: Funkwhale
hide_title: true
hide_table_of_contents: false
sidebar_label: Funkwhale
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Funkwhale

[Funkwhale](https://Funkwhale.audio/en_US/) A social platform to enjoy and share music

![amd64](https://img.shields.io/badge/{% if not funkwhale.amd64 %}untested{% else %}{{ funkwhale.amd64 }}{% endif %}-amd64-{% if not funkwhale.amd64 %}inactive{% elif funkwhale.amd64 == "verified" %}success{% elif funkwhale.amd64 == "supported" %}informational{% elif funkwhale.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not funkwhale.arm64 %}untested{% else %}{{ funkwhale.arm64 }}{% endif %}-arm64-{% if not funkwhale.arm64 %}inactive{% elif funkwhale.arm64 == "verified" %}success{% elif funkwhale.arm64 == "supported" %}informational{% elif funkwhale.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not funkwhale.armv7 %}untested{% else %}{{ funkwhale.armv7 }}{% endif %}-armv7-{% if not funkwhale.armv7 %}inactive{% elif funkwhale.armv7 == "verified" %}success{% elif funkwhale.armv7 == "supported" %}informational{% elif funkwhale.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ funkwhale.version }}

## SETUP

### Enabling funkwhale

#### Command:

**`vlab set funkwhale.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=funkwhale`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Once your funkwhale instance is running, you'll need to SSH into your server and run:

```
docker exec -it funkwhale_app_1 python /app/api/manage.py createsuperuser
```

Now login to your funkwhale instance, and create a Library at [http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/content/libraries](http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/content/libraries)

Get the library ID by grabbing the last bit of the URL for the new library. It should look like `e42019fe-14fe-475c-a5e6-a84dea4184cd`

Now import your music with:

```
export LIBRARY_ID="<YOUR_LIBRARY_ID>"
docker exec -it funkwhale_app_1 python /app/api/manage.py import_files $LIBRARY_ID "/data/music/" --recursive --noinput
```

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

3. run **`vlab update_one service=funkwhale`** to complete the changes


## ACCESS

funkwhale (HTTPS) link: [https://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/](https://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/)
funkwhale (HTTP) link: [http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/](http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ funkwhale.subdomain + "." + tor_domain }}/](http://{{ funkwhale.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set funkwhale.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set funkwhale.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set funkwhale.domain funkwhale.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  domain: funkwhale.com
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### SUBDOMAIN
*Default: funkwhale* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set funkwhale.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### VERSION
*Default: {{  funkwhale.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set funkwhale.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
