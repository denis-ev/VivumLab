---
id: pleroma
title: Pleroma
hide_title: true
hide_table_of_contents: false
sidebar_label: Pleroma
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Pleroma

[Pleroma](https://github.com/angristan/docker-pleroma) Pleroma is a federated social networking platform, compatible with GNU social and other OStatus implementations. It is free software licensed under the AGPLv3.

![amd64](https://img.shields.io/badge/{% if not pleroma.amd64 %}untested{% else %}{{ pleroma.amd64 }}{% endif %}-amd64-{% if not pleroma.amd64 %}inactive{% elif pleroma.amd64 == "verified" %}success{% elif pleroma.amd64 == "supported" %}informational{% elif pleroma.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not pleroma.arm64 %}untested{% else %}{{ pleroma.arm64 }}{% endif %}-arm64-{% if not pleroma.arm64 %}inactive{% elif pleroma.arm64 == "verified" %}success{% elif pleroma.arm64 == "supported" %}informational{% elif pleroma.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not pleroma.armv7 %}untested{% else %}{{ pleroma.armv7 }}{% endif %}-armv7-{% if not pleroma.armv7 %}inactive{% elif pleroma.armv7 == "verified" %}success{% elif pleroma.armv7 == "supported" %}informational{% elif pleroma.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ pleroma.version }}

## SETUP

### Enabling pleroma

#### Command:

**`vlab set pleroma.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=pleroma`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### Additional Installation Steps

* Pleroma requires you to interactively create the first user using docker exec, or something similar. Here's a templated version for you to run. You'll need to do this from your vivumlab server's /var/vivumlab/pleroma directory.

```sh
docker-compose exec web /opt/pleroma/bin/pleroma_ctl user new {{default_username}} {{admin_email}} --name {{default_username}} --password {{default_password}} --admin --moderator -y
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

3. run **`vlab update_one service=pleroma`** to complete the changes


## ACCESS

pleroma (HTTPS) link: [https://{% if pleroma.domain %}{{ pleroma.domain }}{% else %}{{ pleroma.subdomain + "." + domain }}{% endif %}/](https://{% if pleroma.domain %}{{ pleroma.domain }}{% else %}{{ pleroma.subdomain + "." + domain }}{% endif %}/)
pleroma (HTTP) link: [http://{% if pleroma.domain %}{{ pleroma.domain }}{% else %}{{ pleroma.subdomain + "." + domain }}{% endif %}/](http://{% if pleroma.domain %}{{ pleroma.domain }}{% else %}{{ pleroma.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ pleroma.subdomain + "." + tor_domain }}/](http://{{ pleroma.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pleroma.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=pleroma`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pleroma.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=pleroma`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set pleroma.domain pleroma.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  domain: pleroma.com
```

##### Finalising changes:

run: **`vlab update_one service=pleroma`**

### SUBDOMAIN
*Default: pleroma* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set pleroma.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=pleroma`**

### VERSION
*Default: {{  pleroma.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set pleroma.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pleroma
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=pleroma`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
