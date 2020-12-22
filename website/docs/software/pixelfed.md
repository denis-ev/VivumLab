---
id: pixelfed
title: Pixelfed
hide_title: true
hide_table_of_contents: false
sidebar_label: Pixelfed
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Pixelfed

[Pixelfed](https://pixelfed.org/) is a free and ethical photo sharing platform, powered by ActivityPub federation.

![amd64](https://img.shields.io/badge/{% if not pixelfed.amd64 %}untested{% else %}{{ pixelfed.amd64 }}{% endif %}-amd64-{% if not pixelfed.amd64 %}inactive{% elif pixelfed.amd64 == "verified" %}success{% elif pixelfed.amd64 == "supported" %}informational{% elif pixelfed.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not pixelfed.arm64 %}untested{% else %}{{ pixelfed.arm64 }}{% endif %}-arm64-{% if not pixelfed.arm64 %}inactive{% elif pixelfed.arm64 == "verified" %}success{% elif pixelfed.arm64 == "supported" %}informational{% elif pixelfed.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not pixelfed.armv7 %}untested{% else %}{{ pixelfed.armv7 }}{% endif %}-armv7-{% if not pixelfed.armv7 %}inactive{% elif pixelfed.armv7 == "verified" %}success{% elif pixelfed.armv7 == "supported" %}informational{% elif pixelfed.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ pixelfed.version }}

## SETUP

### Enabling pixelfed

#### Command:

**`vlab set pixelfed.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=pixelfed`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

### Environment variables

Adjust the environment variables (roles/pixelfed/templates/pixelfed.env.j2) to match your needs.

More information about the possible options are available here: [Pixelfed Configuration](https://docs.pixelfed.org/master/)

### Setup

This once requires some manual setup, unfortunately.

- Connect to the server with ssh
- As soon as the **db and the app started completely** run `docker exec pixelfed_pixelfed_1 gosu www-data:www-data php artisan migrate --force`. This will do the database migrations.
  - **Note:** When you start the service for the first time, the mariadb container needs to do some initial configuration and thus needs a bit longer to start completely.
- Now the configuration is complete and the service is available

### Post Install work

You'll want to create a user, and import city data. To do that ssh to your server and execute these commands

- `docker exec pixelfed_pixelfed_1 /bin/bash' - This will give you a shell to run the following commands
- `php artisan user:create` - follow the prompts, ensure it's an admin user
- `php artisan import:cities'
- 'exit' - To exit the docker shell

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

3. run **`vlab update_one service=pixelfed`** to complete the changes


## ACCESS

pixelfed (HTTPS) link: [https://{% if pixelfed.domain %}{{ pixelfed.domain }}{% else %}{{ pixelfed.subdomain + "." + domain }}{% endif %}/](https://{% if pixelfed.domain %}{{ pixelfed.domain }}{% else %}{{ pixelfed.subdomain + "." + domain }}{% endif %}/)
pixelfed (HTTP) link: [http://{% if pixelfed.domain %}{{ pixelfed.domain }}{% else %}{{ pixelfed.subdomain + "." + domain }}{% endif %}/](http://{% if pixelfed.domain %}{{ pixelfed.domain }}{% else %}{{ pixelfed.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ pixelfed.subdomain + "." + tor_domain }}/](http://{{ pixelfed.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pixelfed.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=pixelfed`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set pixelfed.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=pixelfed`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set pixelfed.domain pixelfed.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  domain: pixelfed.com
```

##### Finalising changes:

run: **`vlab update_one service=pixelfed`**

### SUBDOMAIN
*Default: pixelfed* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set pixelfed.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=pixelfed`**

### VERSION
*Default: {{  pixelfed.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set pixelfed.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
pixelfed
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=pixelfed`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
