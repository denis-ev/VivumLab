# Gitlab

[Gitlab](https://docs.gitlab.com/) "the single application for the entire DevOps lifecycle".

![amd64_verified](https://img.shields.io/badge/{{ if gitlab.tested_amd64 }}not_tested{{ else }}{{ gitlab.tested_amd64 }}{{ endif }}-amd64-{{ if gitlab.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if gitlab.tested_arm64 }}not_tested{{ else }}{{ gitlab.tested_arm64 }}{{ endif }}-arm64-{{ if gitlab.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if gitlab.tested_armv8 }}not_tested{{ else }}{{ gitlab.tested_armv8 }}{{ endif }}-armv8-{{ if gitlab.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ gitlab.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling gitlab

#### Command:

**`vlab set gitlab.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=gitlab`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

##### SSH Port
{{ gitlab.ssh_port }} - defaults to 223, can be adjusted
- Default is 223
- Adjust in settings/config.yml

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

3. run **`vlab update_one service=gitlab`** to complete the changes


## ACCESS

gitlab (HTTPS) link: [https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/)
gitlab (HTTP) link: [http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ gitlab.subdomain + "." + tor_domain }}/](http://{{ gitlab.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gitlab.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gitlab.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set gitlab.domain gitlab.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  domain: gitlab.com
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### SUBDOMAIN
*Default: gitlab*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set gitlab.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

### VERSION
*Default: {{gitlab.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set gitlab.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitlab
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=gitlab`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
