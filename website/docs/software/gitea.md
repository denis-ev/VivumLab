---
id: gitea
title: Gitea
hide_title: true
hide_table_of_contents: false
sidebar_label: Gitea
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Gitea

[Gitea](https://gitea.io/en-US/) is a Git hosting platform.

![amd64](https://img.shields.io/badge/{% if not gitea.amd64 %}untested{% else %}{{ gitea.amd64 }}{% endif %}-amd64-{% if not gitea.amd64 %}inactive{% elif gitea.amd64 == "verified" %}success{% elif gitea.amd64 == "supported" %}informational{% elif gitea.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not gitea.arm64 %}untested{% else %}{{ gitea.arm64 }}{% endif %}-arm64-{% if not gitea.arm64 %}inactive{% elif gitea.arm64 == "verified" %}success{% elif gitea.arm64 == "supported" %}informational{% elif gitea.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not gitea.armv7 %}untested{% else %}{{ gitea.armv7 }}{% endif %}-armv7-{% if not gitea.armv7 %}inactive{% elif gitea.armv7 == "verified" %}success{% elif gitea.armv7 == "supported" %}informational{% elif gitea.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ gitea.version }}

## SETUP

### Enabling gitea

#### Command:

**`vlab set gitea.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=gitea`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

##### MariaDB
{% if gitea.use_mariadb %}
- Defaults true
- False allows for SQLite option without database in separate container
{% endif %}

##### SSH Port
{{ gitea.gitea_ssh_port }} - defaults to 2222, can be adjusted
- Default is 2222
- Adjust in settings/config.yml

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

3. run **`vlab update_one service=gitea`** to complete the changes


## ACCESS

gitea (HTTPS) link: [https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/)
gitea (HTTP) link: [http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ gitea.subdomain + "." + tor_domain }}/](http://{{ gitea.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set gitea.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set gitea.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set gitea.domain gitea.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  domain: gitea.com
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### SUBDOMAIN
*Default: gitea* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set gitea.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### VERSION
*Default: {{  gitea.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set gitea.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
