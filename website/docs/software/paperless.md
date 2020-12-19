---
id: paperless
title: Paperless
hide_title: true
hide_table_of_contents: false
sidebar_label: Paperless
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Paperless

[Paperless](https://github.com/danielquinn/paperless) is a document management server. Point it at a folder on your NAS that your scanner is set to scan to, scan all your paper docs, have a searchable secure document archive.

![amd64](https://img.shields.io/badge/{% if not paperless.amd64 %}untested{% else %}{{ paperless.amd64 }}{% endif %}-amd64-{% if not paperless.amd64 %}inactive{% elif paperless.amd64 == "verified" %}success{% elif paperless.amd64 == "supported" %}informational{% elif paperless.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not paperless.arm64 %}untested{% else %}{{ paperless.arm64 }}{% endif %}-arm64-{% if not paperless.arm64 %}inactive{% elif paperless.arm64 == "verified" %}success{% elif paperless.arm64 == "supported" %}informational{% elif paperless.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not paperless.armv7 %}untested{% else %}{{ paperless.armv7 }}{% endif %}-armv7-{% if not paperless.armv7 %}inactive{% elif paperless.armv7 == "verified" %}success{% elif paperless.armv7 == "supported" %}informational{% elif paperless.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ paperless.version }}

## SETUP

### Enabling paperless

#### Command:

**`vlab set paperless.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=paperless`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

To create a user, ssh into your server and run the following: `docker exec -it paperless ./manage.py createsuperuser`

You will be prompted to enter a username, email (optional) and password.  Once the user has been created successfully, you may need to break (Ctrl+C)  This is the login info that can be used at [https://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/](https://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/) or [http://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/](http://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/)

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

3. run **`vlab update_one service=paperless`** to complete the changes


## ACCESS

paperless (HTTPS) link: [https://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/](https://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/)
paperless (HTTP) link: [http://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/](http://{% if paperless.domain %}{{ paperless.domain }}{% else %}{{ paperless.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ paperless.subdomain + "." + tor_domain }}/](http://{{ paperless.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set paperless.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=paperless`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set paperless.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=paperless`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set paperless.domain paperless.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  domain: paperless.com
```

##### Finalising changes:

run: **`vlab update_one service=paperless`**

### SUBDOMAIN
*Default: paperless* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set paperless.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=paperless`**

### VERSION
*Default: {{  paperless.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set paperless.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
paperless
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=paperless`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
