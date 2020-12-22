---
id: drone
title: Drone
hide_title: true
hide_table_of_contents: false
sidebar_label: Drone
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Drone

[Drone](https://drone.io) is a self-service continuous delivery platform

![amd64](https://img.shields.io/badge/{% if not drone.amd64 %}untested{% else %}{{ drone.amd64 }}{% endif %}-amd64-{% if not drone.amd64 %}inactive{% elif drone.amd64 == "verified" %}success{% elif drone.amd64 == "supported" %}informational{% elif drone.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not drone.arm64 %}untested{% else %}{{ drone.arm64 }}{% endif %}-arm64-{% if not drone.arm64 %}inactive{% elif drone.arm64 == "verified" %}success{% elif drone.arm64 == "supported" %}informational{% elif drone.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not drone.armv7 %}untested{% else %}{{ drone.armv7 }}{% endif %}-armv7-{% if not drone.armv7 %}inactive{% elif drone.armv7 == "verified" %}success{% elif drone.armv7 == "supported" %}informational{% elif drone.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ drone.version }}

## SETUP

### Enabling drone

#### Command:

**`vlab set drone.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=drone`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ drone.domain }}/admin*

Create an account with your desired username; as this is the first user, drone makes this account the administrator.

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

3. run **`vlab update_one service=drone`** to complete the changes


## ACCESS

drone (HTTPS) link: [https://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/](https://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/)
drone (HTTP) link: [http://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/](http://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ drone.subdomain + "." + tor_domain }}/](http://{{ drone.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set drone.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set drone.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set drone.domain drone.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  domain: drone.com
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

### SUBDOMAIN
*Default: drone* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set drone.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

### VERSION
*Default: {{  drone.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set drone.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

### Enable Gitea

[Official Drone Docs Gitea](https://docs.drone.io/server/provider/gitea/)

*Default: False*

#### Commands:

**`vlab set gitea_id {id}`**
**`vlab set gitea_secret {secret}`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
drone
  gitea_id: giteaid
  gitea_secret: giteasecret
```

##### Finalising changes:

run: **`vlab update_one service=drone`**

#### Build and Push Docker image

Use the official [Drone Documentation](https://docs.drone.io/) to Setup your Environment, if not using Gitea.

Example:
To build and push your own VivumLab Image migrate and sync the [official Repo](https://github.com/Vivumlab/VivumLab/) with Gitea.
Then activate it in Drone and create three secrets (repo, docker_username, docker_password).
Your own VivumLab Image will be build and published to Docker on the next commit.

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
