---
id: gitlab
title: Gitlab
hide_title: true
hide_table_of_contents: false
sidebar_label: Gitlab
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Gitlab

[Gitlab](https://docs.gitlab.com/) "the single application for the entire DevOps lifecycle".

![amd64](https://img.shields.io/badge/{% if not gitlab.amd64 %}untested{% else %}{{ gitlab.amd64 }}{% endif %}-amd64-{% if not gitlab.amd64 %}inactive{% elif gitlab.amd64 == "verified" %}success{% elif gitlab.amd64 == "supported" %}informational{% elif gitlab.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not gitlab.arm64 %}untested{% else %}{{ gitlab.arm64 }}{% endif %}-arm64-{% if not gitlab.arm64 %}inactive{% elif gitlab.arm64 == "verified" %}success{% elif gitlab.arm64 == "supported" %}informational{% elif gitlab.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not gitlab.armv7 %}untested{% else %}{{ gitlab.armv7 }}{% endif %}-armv7-{% if not gitlab.armv7 %}inactive{% elif gitlab.armv7 == "verified" %}success{% elif gitlab.armv7 == "supported" %}informational{% elif gitlab.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ gitlab.version }}

## SETUP

### Enabling gitlab

#### Command:

**`vlab set gitlab.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=gitlab`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

##### SSH Port
{{ gitlab.ssh_port }} - defaults to 223, can be adjusted
- Default is 223
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

3. run **`vlab update_one service=gitlab`** to complete the changes


## ACCESS

gitlab (HTTPS) link: [https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/)
gitlab (HTTP) link: [http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ gitlab.subdomain + "." + tor_domain }}/](http://{{ gitlab.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set gitlab.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set gitlab.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set gitlab.domain gitlab.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  domain: gitlab.com
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### SUBDOMAIN
*Default: gitlab* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set gitlab.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### VERSION
*Default: {{  gitlab.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set gitlab.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
