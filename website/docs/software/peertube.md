---
id: peertube
title: PeerTube
hide_title: true
hide_table_of_contents: false
sidebar_label: PeerTube
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# PeerTube

[PeerTube](https://peertube.social) ActivityPub Video Sharing

![amd64](https://img.shields.io/badge/{% if not peertube.amd64 %}untested{% else %}{{ peertube.amd64 }}{% endif %}-amd64-{% if not peertube.amd64 %}inactive{% elif peertube.amd64 == "verified" %}success{% elif peertube.amd64 == "supported" %}informational{% elif peertube.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not peertube.arm64 %}untested{% else %}{{ peertube.arm64 }}{% endif %}-arm64-{% if not peertube.arm64 %}inactive{% elif peertube.arm64 == "verified" %}success{% elif peertube.arm64 == "supported" %}informational{% elif peertube.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not peertube.armv7 %}untested{% else %}{{ peertube.armv7 }}{% endif %}-armv7-{% if not peertube.armv7 %}inactive{% elif peertube.armv7 == "verified" %}success{% elif peertube.armv7 == "supported" %}informational{% elif peertube.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** https://hub.docker.com/r/chocobozzz/peertube <br />
**Current Image Version:** {{ peertube.version }}

## SETUP

### Enabling peertube

#### Command:

**`vlab set peertube.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=peertube`**

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

3. run **`vlab update_one service=peertube`** to complete the changes


## ACCESS

peertube (HTTPS) link: [https://{% if peertube.domain %}{{ peertube.domain }}{% else %}{{ peertube.subdomain + "." + domain }}{% endif %}/](https://{% if peertube.domain %}{{ peertube.domain }}{% else %}{{ peertube.subdomain + "." + domain }}{% endif %}/)
peertube (HTTP) link: [http://{% if peertube.domain %}{{ peertube.domain }}{% else %}{{ peertube.subdomain + "." + domain }}{% endif %}/](http://{% if peertube.domain %}{{ peertube.domain }}{% else %}{{ peertube.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ peertube.subdomain + "." + tor_domain }}/](http://{{ peertube.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set peertube.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=peertube`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set peertube.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=peertube`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set peertube.domain peertube.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  domain: peertube.com
```

##### Finalising changes:

run: **`vlab update_one service=peertube`**

### SUBDOMAIN
*Default: peertube* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set peertube.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=peertube`**

### VERSION
*Default: {{  peertube.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set peertube.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
peertube
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=peertube`**

## Need more help?
Further information regarding services can be
 found. \
General Information can be found in the [documentation](https://vivumlab.com/docs). \
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
