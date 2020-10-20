# Homedash

[Homedash](https://lamarios.github.io/Homedash2/) is a simple dashboard that allows to monitor and interact with many different services.

![amd64_verified](https://img.shields.io/badge/{{ if homedash.tested_amd64 }}not_tested{{ else }}{{ homedash.tested_amd64 }}{{ endif }}-amd64-{{ if homedash.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if homedash.tested_arm64 }}not_tested{{ else }}{{ homedash.tested_arm64 }}{{ endif }}-arm64-{{ if homedash.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if homedash.tested_armv8 }}not_tested{{ else }}{{ homedash.tested_armv8 }}{{ endif }}-armv8-{{ if homedash.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ homedash.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling homedash

#### Command:

**`vlab set homedash.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=homedash`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ homedash.domain }}/admin*

Create an account with your desired username; as this is the first user, homedash makes this account the administrator.

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

3. run **`vlab update_one service=homedash`** to complete the changes


## ACCESS

homedash (HTTPS) link: [https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)
homedash (HTTP) link: [http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ homedash.subdomain + "." + tor_domain }}/](http://{{ homedash.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homedash.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set homedash.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set homedash.domain homedash.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  domain: homedash.com
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### SUBDOMAIN
*Default: homedash*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set homedash.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

### VERSION
*Default: {{homedash.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set homedash.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
homedash
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=homedash`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
