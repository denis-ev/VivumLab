# Keycloak

[Keycloak](https://www.keycloak.org/) Open Source Identity and Access Management

![amd64](https://img.shields.io/badge/{% if not keycloak.amd64 %}untested{% else %}{{ keycloak.amd64 }}{% endif %}-amd64-{% if not keycloak.amd64 %}inactive{% elif keycloak.amd64 == "verified" %}success{% elif keycloak.amd64 == "supported" %}informational{% elif keycloak.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not keycloak.arm64 %}untested{% else %}{{ keycloak.arm64 }}{% endif %}-arm64-{% if not keycloak.arm64 %}inactive{% elif keycloak.arm64 == "verified" %}success{% elif keycloak.arm64 == "supported" %}informational{% elif keycloak.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not keycloak.armv7 %}untested{% else %}{{ keycloak.armv7 }}{% endif %}-armv7-{% if not keycloak.armv7 %}inactive{% elif keycloak.armv7 == "verified" %}success{% elif keycloak.armv7 == "supported" %}informational{% elif keycloak.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ keycloak.version }}

## SETUP

### Enabling keycloak

#### Command:

**`vlab set keycloak.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=keycloak`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

[Tutorial on how to setup Keycloak for a Service](https://github.com/ibuetler/docker-keycloak-traefik-workshop)

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

3. run **`vlab update_one service=keycloak`** to complete the changes


## ACCESS

keycloak (HTTPS) link: [https://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/](https://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/)
keycloak (HTTP) link: [http://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/](http://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ keycloak.subdomain + "." + tor_domain }}/](http://{{ keycloak.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set keycloak.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=keycloak`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set keycloak.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=keycloak`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set keycloak.domain keycloak.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  domain: keycloak.com
```

##### Finalising changes:

run: **`vlab update_one service=keycloak`**

### SUBDOMAIN
*Default: keycloak*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set keycloak.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=keycloak`**

### VERSION
*Default: {{  keycloak.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set keycloak.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
keycloak
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=keycloak`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
