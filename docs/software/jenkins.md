# Jenkins

[Jenkins](https://www.jenkins.io/) The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project.

![amd64](https://img.shields.io/badge/{% if not jenkins.amd64 %}untested{% else %}{{ jenkins.amd64 }}{% endif %}-amd64-{% if not jenkins.amd64 %}inactive{% elif jenkins.amd64 == "verified" %}success{% elif jenkins.amd64 == "supported" %}informational{% elif jenkins.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not jenkins.arm64 %}untested{% else %}{{ jenkins.arm64 }}{% endif %}-arm64-{% if not jenkins.arm64 %}inactive{% elif jenkins.arm64 == "verified" %}success{% elif jenkins.arm64 == "supported" %}informational{% elif jenkins.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not jenkins.armv7 %}untested{% else %}{{ jenkins.armv7 }}{% endif %}-armv7-{% if not jenkins.armv7 %}inactive{% elif jenkins.armv7 == "verified" %}success{% elif jenkins.armv7 == "supported" %}informational{% elif jenkins.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ jenkins.version }}

## SETUP

### Enabling jenkins

#### Command:

**`vlab set jenkins.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=jenkins`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ jenkins.domain }}/admin*

Create an account with your desired username; as this is the first user, jenkins makes this account the administrator.

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

3. run **`vlab update_one service=jenkins`** to complete the changes


## ACCESS

jenkins (HTTPS) link: [https://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/](https://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/)
jenkins (HTTP) link: [http://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/](http://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ jenkins.subdomain + "." + tor_domain }}/](http://{{ jenkins.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jenkins.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=jenkins`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set jenkins.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=jenkins`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set jenkins.domain jenkins.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  domain: jenkins.com
```

##### Finalising changes:

run: **`vlab update_one service=jenkins`**

### SUBDOMAIN
*Default: jenkins*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set jenkins.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=jenkins`**

### VERSION
*Default: {{  jenkins.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set jenkins.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
jenkins
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=jenkins`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
