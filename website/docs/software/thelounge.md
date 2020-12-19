---
id: thelounge
title: TheLounge
hide_title: true
hide_table_of_contents: false
sidebar_label: TheLounge
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# TheLounge

[TheLounge](https://thelounge.chat/) is a web based IRC client that syncs nicely across devices, and stays online
when you aren't.

![amd64](https://img.shields.io/badge/{% if not thelounge.amd64 %}untested{% else %}{{ thelounge.amd64 }}{% endif %}-amd64-{% if not thelounge.amd64 %}inactive{% elif thelounge.amd64 == "verified" %}success{% elif thelounge.amd64 == "supported" %}informational{% elif thelounge.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not thelounge.arm64 %}untested{% else %}{{ thelounge.arm64 }}{% endif %}-arm64-{% if not thelounge.arm64 %}inactive{% elif thelounge.arm64 == "verified" %}success{% elif thelounge.arm64 == "supported" %}informational{% elif thelounge.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not thelounge.armv7 %}untested{% else %}{{ thelounge.armv7 }}{% endif %}-armv7-{% if not thelounge.armv7 %}inactive{% elif thelounge.armv7 == "verified" %}success{% elif thelounge.armv7 == "supported" %}informational{% elif thelounge.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ thelounge.version }}

## SETUP

### Enabling thelounge

#### Command:

**`vlab set thelounge.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=thelounge`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

To turn TheLounge from a public instance to a private (highly recommended) run the following commands
on your server. Run `sed -i 's/public: true/public: false/' {{ volumes_root }}/thelounge/config.js`, then
restart the container with `docker restart vivumlab_thelounge_1`, then create a user with
`docker exec -it vivumlab_thelounge_1 thelounge add <username>` and follow the prompts.

Now you should be able to login with the username and password you created at the URLs below,
and have your session automatically sync between multiple devices.

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

3. run **`vlab update_one service=thelounge`** to complete the changes


## ACCESS

thelounge (HTTPS) link: [https://{% if thelounge.domain %}{{ thelounge.domain }}{% else %}{{ thelounge.subdomain + "." + domain }}{% endif %}/](https://{% if thelounge.domain %}{{ thelounge.domain }}{% else %}{{ thelounge.subdomain + "." + domain }}{% endif %}/)
thelounge (HTTP) link: [http://{% if thelounge.domain %}{{ thelounge.domain }}{% else %}{{ thelounge.subdomain + "." + domain }}{% endif %}/](http://{% if thelounge.domain %}{{ thelounge.domain }}{% else %}{{ thelounge.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ thelounge.subdomain + "." + tor_domain }}/](http://{{ thelounge.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set thelounge.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=thelounge`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set thelounge.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=thelounge`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set thelounge.domain thelounge.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  domain: thelounge.com
```

##### Finalising changes:

run: **`vlab update_one service=thelounge`**

### SUBDOMAIN
*Default: thelounge* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set thelounge.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=thelounge`**

### VERSION
*Default: {{  thelounge.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set thelounge.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
thelounge
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=thelounge`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
