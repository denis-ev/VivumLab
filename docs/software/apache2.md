# Apache 2

[Apache 2](https://httpd.apache.org/) is a free web server.

![amd64_verified](https://img.shields.io/badge/{{ if apache2.tested_amd64 }}not_tested{{ else }}{{ apache2.tested_amd64 }}{{ endif }}-amd64-{{ if apache2.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if apache2.tested_arm64 }}not_tested{{ else }}{{ apache2.tested_arm64 }}{{ endif }}-arm64-{{ if apache2.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if apache2.tested_armv8 }}not_tested{{ else }}{{ apache2.tested_armv8 }}{{ endif }}-armv8-{{ if apache2.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ apache2.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling apache2

#### Command:

**`vlab set apache2.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=apache2`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ apache2.domain }}/admin*

Create an account with your desired username; as this is the first user, apache2 makes this account the administrator.

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

3. run **`vlab update_one service=apache2`** to complete the changes


## ACCESS

Apache2 (HTTPS) link: [https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)
Apache2 (HTTP) link: [http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ apache2.subdomain + "." + tor_domain }}/](http://{{ apache2.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set apache2.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set apache2.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set apache2.domain apache2.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  domain: apache2.com
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### SUBDOMAIN
*Default: apache2*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set apache2.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

### VERSION
*Default: {{apache2.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set apache2.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
apache2
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=apache2`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
