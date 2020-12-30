---
id: hubzilla
title: Hubzilla
hide_title: true
hide_table_of_contents: false
sidebar_label: Hubzilla
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Hubzilla

[Hubzilla](https://framagit.org/hubzilla) is a powerful platform for creating interconnected websites featuring a [decentralized/nomadic identity](https://zotlabs.org/page/hubzilla/hubzilla-project).

![amd64](https://img.shields.io/badge/{% if not hubzilla.amd64 %}untested{% else %}{{ hubzilla.amd64 }}{% endif %}-amd64-{% if not hubzilla.amd64 %}inactive{% elif hubzilla.amd64 == "verified" %}success{% elif hubzilla.amd64 == "supported" %}informational{% elif hubzilla.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not hubzilla.arm64 %}untested{% else %}{{ hubzilla.arm64 }}{% endif %}-arm64-{% if not hubzilla.arm64 %}inactive{% elif hubzilla.arm64 == "verified" %}success{% elif hubzilla.arm64 == "supported" %}informational{% elif hubzilla.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not hubzilla.armv7 %}untested{% else %}{{ hubzilla.armv7 }}{% endif %}-armv7-{% if not hubzilla.armv7 %}inactive{% elif hubzilla.armv7 == "verified" %}success{% elif hubzilla.armv7 == "supported" %}informational{% elif hubzilla.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ hubzilla.version }}

## SETUP

### Enabling hubzilla

#### Command:

**`vlab set hubzilla.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=hubzilla`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

The first time you access Hubzilla, you will need to **set up the admin account BEFORE** you set any other user account.

To do this:
1. go to your Hubzilla instance, and on the login screen, click `register`
2. create an account using the admin email that was set during installation.
```
Unless you modified the docker-compose file, the default admin email will be admin@your.domain.com
check out the **Access** part of these docs, if you're unsure, which domain you used.
```
3. Unless you have some immediate administration tasks that need finishing, log out and create your own user account using your own email address.
4. Now you can log back into the admin account, and play around. I suggest setting the verify email option, or closing registrations to your hub.
```
Step 4 is a suggestion/ reminder from VivumLab. It is beyond the scope of VivumLab to provide 'how-to' specifics to Hubzilla.
Hubzilla isn't new, so there is plenty of information out there.
```

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes

Hubzilla makes pretty good use of a mail server. If you don't want to run your own, sign up for a service like [mailgun](https://www.mailgun.com/).

Setting up such a service is beyond the scope of the VivumLab documentation, however there is plenty of information out there.

Once you have access to a mail server, or a mail service provide Hubzilla with the necessary information.

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

3. run **`vlab update_one service=hubzilla`** to complete the changes


## ACCESS

hubzilla (HTTPS) link: [https://{% if hubzilla.domain %}{{ hubzilla.domain }}{% else %}{{ hubzilla.subdomain + "." + domain }}{% endif %}/](https://{% if hubzilla.domain %}{{ hubzilla.domain }}{% else %}{{ hubzilla.subdomain + "." + domain }}{% endif %}/)
hubzilla (HTTP) link: [http://{% if hubzilla.domain %}{{ hubzilla.domain }}{% else %}{{ hubzilla.subdomain + "." + domain }}{% endif %}/](http://{% if hubzilla.domain %}{{ hubzilla.domain }}{% else %}{{ hubzilla.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ hubzilla.subdomain + "." + tor_domain }}/](http://{{ hubzilla.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set hubzilla.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=hubzilla`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set hubzilla.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=hubzilla`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set hubzilla.domain hubzilla.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  domain: hubzilla.com
```

##### Finalising changes:

run: **`vlab update_one service=hubzilla`**

### SUBDOMAIN
*Default: hubzilla* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set hubzilla.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=hubzilla`**

### VERSION
*Default: {{  hubzilla.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set hubzilla.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=hubzilla`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
