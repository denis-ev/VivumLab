---
id: lychee
title: Lychee
hide_title: true
hide_table_of_contents: false
sidebar_label: Lychee
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Lychee

[Lychee](https://lycheeorg.github.io/) Lightweight, self-hosted, easy-to-use photo management

![amd64](https://img.shields.io/badge/{% if not lychee.amd64 %}untested{% else %}{{ lychee.amd64 }}{% endif %}-amd64-{% if not lychee.amd64 %}inactive{% elif lychee.amd64 == "verified" %}success{% elif lychee.amd64 == "supported" %}informational{% elif lychee.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not lychee.arm64 %}untested{% else %}{{ lychee.arm64 }}{% endif %}-arm64-{% if not lychee.arm64 %}inactive{% elif lychee.arm64 == "verified" %}success{% elif lychee.arm64 == "supported" %}informational{% elif lychee.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not lychee.armv7 %}untested{% else %}{{ lychee.armv7 }}{% endif %}-armv7-{% if not lychee.armv7 %}inactive{% elif lychee.armv7 == "verified" %}success{% elif lychee.armv7 == "supported" %}informational{% elif lychee.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** https://hub.docker.com/r/lycheeorg/lychee <br />
**Current Image Version:** {{ lychee.version }}

## SETUP

### Enabling lychee

#### Command:

**`vlab set lychee.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=lychee`**

## FIRST RUN

###### COMPLETING INSTANCE SETUP
Login as the administrator account, to complete setting up your PeerTube instance. It is highly recommended that the administrator account is not used for uploading videos/ enjoying the instance; **create a separate 'main' account for this purpose.**

A wizard will prompt the user through the required steps upon logging as an administrator for the first time. Use the `admin email` and `admin password` you provided when setting up VivumLab.

###### CHANGE THE DEFAULT ADMIN PASSWORD
It is highly suggested by the VivumLab team that the user change the administrator password, as soon as possible. The `admin password` provided when setting up VivumLab should only be used as a placeholder to access the administrator account for the first time; it is not advised to edit the docker-compose file.

###### LIVE STREAMING
If you wish to live stream, make sure that port `1935` is forwarded on the network of the machine that serves Peertube. If you are deploying to your own infrastructure/machine, this may involve accessing the router/modem connected to the aforementioned machine and portforwarding manually; if you are using a provider such as digital ocean, you may need to contact support, and organise the port to be forwarded for you.

Please note that the above is advice only; 'Portforwarding' is currently outside the scope of VivumLab, due to this scope VivumLab will not be able to provide any support regarding portforwarding. Just like with most things, a quick internet search will get you started.

#### ADMINISTRATOR SETUP

The administrator details are set by the user during VivumLab setup; these are the answers that the user provided for the default `admin email` and `admin password`. These details can be changed in the administrator UI; it is highly recommended to change the administrator password.

Please note that the administrator password is stored in plain text on the server, in the local docker-compose file that VivumLab has templated onto the server and can also be accessed via the docker inspect command, eg. `docker inspect peertube`. VivumLab assumes that the default `admin password` is only a placeholder; if you have provided a password that you intended to keep, please take immediate steps to rectify this.

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

3. run **`vlab update_one service=lychee`** to complete the changes


## ACCESS

lychee (HTTPS) link: [https://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/](https://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/)
lychee (HTTP) link: [http://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/](http://{% if lychee.domain %}{{ lychee.domain }}{% else %}{{ lychee.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ lychee.subdomain + "." + tor_domain }}/](http://{{ lychee.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lychee.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set lychee.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set lychee.domain lychee.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  domain: lychee.com
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### SUBDOMAIN
*Default: lychee* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set lychee.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

### VERSION
*Default: {{  lychee.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set lychee.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
lychee
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=lychee`**

## Need more help?
Further information regarding services can be
 found. \
General Information can be found in the [documentation](https://vivumlab.com/docs). \
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.