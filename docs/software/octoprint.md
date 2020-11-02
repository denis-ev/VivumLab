# OctoPrint

[OctoPrint](https://octoprint.org/) The snappy web interface for your 3D printer.

## Setup
To find the serial port and connect to your printer run
```
ls /dev/serial/by-id/*
```
then, set the value that corresponds to the 3D printer by going into the config file and under octoprint (in the devices array) add the address that you recieved in the previous step.
Using the pattern:
```
  devices: ['/dev/device1', '/dev/device2']
```

![amd64](https://img.shields.io/badge/{% if not octoprint.amd64 %}untested{% else %}{{ octoprint.amd64 }}{% endif %}-amd64-{% if not octoprint.amd64 %}inactive{% elif octoprint.amd64 == "verified" %}success{% elif octoprint.amd64 == "supported" %}informational{% elif octoprint.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not octoprint.arm64 %}untested{% else %}{{ octoprint.arm64 }}{% endif %}-arm64-{% if not octoprint.arm64 %}inactive{% elif octoprint.arm64 == "verified" %}success{% elif octoprint.arm64 == "supported" %}informational{% elif octoprint.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not octoprint.armv7 %}untested{% else %}{{ octoprint.armv7 }}{% endif %}-armv7-{% if not octoprint.armv7 %}inactive{% elif octoprint.armv7 == "verified" %}success{% elif octoprint.armv7 == "supported" %}informational{% elif octoprint.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ octoprint.version }}

## SETUP

### Enabling octoprint

#### Command:

**`vlab set octoprint.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=octoprint`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ octoprint.domain }}/admin*

Create an account with your desired username; as this is the first user, octoprint makes this account the administrator.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


##### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=octoprint`** to complete the changes


## ACCESS

octoprint (HTTPS) link: [https://{% if octoprint.domain %}{{ octoprint.domain }}{% else %}{{ octoprint.subdomain + "." + domain }}{% endif %}/](https://{% if octoprint.domain %}{{ octoprint.domain }}{% else %}{{ octoprint.subdomain + "." + domain }}{% endif %}/)
octoprint (HTTP) link: [http://{% if octoprint.domain %}{{ octoprint.domain }}{% else %}{{ octoprint.subdomain + "." + domain }}{% endif %}/](http://{% if octoprint.domain %}{{ octoprint.domain }}{% else %}{{ octoprint.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ octoprint.subdomain + "." + tor_domain }}/](http://{{ octoprint.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set octoprint.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=octoprint`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set octoprint.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=octoprint`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set octoprint.domain octoprint.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  domain: octoprint.com
```

##### Finalising changes:

run: **`vlab update_one service=octoprint`**

### SUBDOMAIN
*Default: octoprint*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set octoprint.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=octoprint`**

### VERSION
*Default: {{  octoprint.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set octoprint.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
octoprint
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=octoprint`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
