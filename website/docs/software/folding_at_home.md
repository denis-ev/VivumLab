---
id: folding_at_home
title: Folding@home
hide_title: true
hide_table_of_contents: false
sidebar_label: Folding@home
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Folding@home

[Folding@home](https://hub.docker.com/r/johnktims/folding-at-home) Folding@home software allows you to share your unused computer power with scientists researching diseases.

![amd64](https://img.shields.io/badge/{% if not folding_at_home.amd64 %}untested{% else %}{{ folding_at_home.amd64 }}{% endif %}-amd64-{% if not folding_at_home.amd64 %}inactive{% elif folding_at_home.amd64 == "verified" %}success{% elif folding_at_home.amd64 == "supported" %}informational{% elif folding_at_home.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not folding_at_home.arm64 %}untested{% else %}{{ folding_at_home.arm64 }}{% endif %}-arm64-{% if not folding_at_home.arm64 %}inactive{% elif folding_at_home.arm64 == "verified" %}success{% elif folding_at_home.arm64 == "supported" %}informational{% elif folding_at_home.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not folding_at_home.armv7 %}untested{% else %}{{ folding_at_home.armv7 }}{% endif %}-armv7-{% if not folding_at_home.armv7 %}inactive{% elif folding_at_home.armv7 == "verified" %}success{% elif folding_at_home.armv7 == "supported" %}informational{% elif folding_at_home.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ folding_at_home.version }}

## SETUP

### Enabling folding_at_home

#### Command:

**`vlab set folding_at_home.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

In `settings/config.yml` you can edit several settings included `power` which says how hard it will work.

The `team` setting defaults to the [VivumLab Folding@home team](https://stats.foldingathome.org/team/261443). Join us in the fight against disease!


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

3. run **`vlab update_one service=folding_at_home`** to complete the changes


## Access

A dashboard is available at http://{{ vlab_ip }}:7396

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set folding_at_home.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set folding_at_home.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set folding_at_home.domain folding_at_home.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  domain: folding_at_home.com
```

##### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

### SUBDOMAIN
*Default: folding_at_home* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set folding_at_home.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

### VERSION
*Default: {{  folding_at_home.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set folding_at_home.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
folding_at_home
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=folding_at_home`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
