# Bitwarden

[Bitwarden](https://bitwarden.com/) is an open source password manager. VivumLab utilizes an Open Source clone of the Bitwarden API server, [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs). This is primarily due to performance and complexity reasons. `bitwarden_rs` requires just one Docker container, whereas the official `Bitwarden` install requires something like six different containers.

![amd64_verified](https://img.shields.io/badge/{{ if bitwarden.tested_amd64 }}not_tested{{ else }}{{ bitwarden.tested_amd64 }}{{ endif }}-amd64-{{ if bitwarden.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if bitwarden.tested_arm64 }}not_tested{{ else }}{{ bitwarden.tested_arm64 }}{{ endif }}-arm64-{{ if bitwarden.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if bitwarden.tested_armv8 }}not_tested{{ else }}{{ bitwarden.tested_armv8 }}{{ endif }}-armv8-{{ if bitwarden.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ bitwarden.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Security Note

>Password managers like Bitwarden should only be used over HTTPS. Ensure you have valid certificates in place before beginning to use this service. You have been warned. :)

### Enabling bitwarden

#### Command:

**`vlab set bitwarden.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=bitwarden`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ bitwarden.domain }}/admin*

Create an account with your desired username; as this is the first user, bitwarden makes this account the administrator.

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

3. run **`vlab update_one service=bitwarden`** to complete the changes


## ACCESS

Bitwarden (HTTPS) link: [https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)
Bitwarden (HTTP) link: [http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ bitwarden.subdomain + "." + tor_domain }}/](http://{{ bitwarden.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bitwarden.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set bitwarden.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set bitwarden.domain bitwarden.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  domain: bitwarden.com
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### SUBDOMAIN
*Default: bitwarden*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set bitwarden.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

### VERSION
*Default: {{bitwarden.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set bitwarden.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
bitwarden
  version: 2.7
```
s
##### Finalising changes:

run: **`vlab update_one service=bitwarden`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
