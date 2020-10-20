# Codeserver

[Codeserver](https://github.com/cdr/code-server) Run VS Code on a remote server.

![amd64_verified](https://img.shields.io/badge/{{ if codeserver.tested_amd64 }}not_tested{{ else }}{{ codeserver.tested_amd64 }}{{ endif }}-amd64-{{ if codeserver.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if codeserver.tested_arm64 }}not_tested{{ else }}{{ codeserver.tested_arm64 }}{{ endif }}-arm64-{{ if codeserver.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if codeserver.tested_armv8 }}not_tested{{ else }}{{ codeserver.tested_armv8 }}{{ endif }}-armv8-{{ if codeserver.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ codeserver.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling codeserver

#### Command:

**`vlab set codeserver.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=codeserver`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ codeserver.domain }}/admin*

Create an account with your desired username; as this is the first user, codeserver makes this account the administrator.

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

3. run **`vlab update_one service=codeserver`** to complete the changes


## ACCESS

Codeserver (HTTPS) link: [https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)
Codeserver (HTTP) link: [http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ codeserver.subdomain + "." + tor_domain }}/](http://{{ codeserver.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codeserver.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  https_only: True
````

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set codeserver.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set codeserver.domain codeserver.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  domain: codeserver.com
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### SUBDOMAIN
*Default: codeserver*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set codeserver.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

### VERSION
*Default: {{codeserver.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set codeserver.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
codeserver
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=codeserver`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
