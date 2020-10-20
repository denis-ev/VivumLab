# Gitea

[Gitea](https://gitea.io/en-US/) is a Git hosting platform.

![amd64_verified](https://img.shields.io/badge/{{ if gitea.tested_amd64 }}not_tested{{ else }}{{ gitea.tested_amd64 }}{{ endif }}-amd64-{{ if gitea.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if gitea.tested_arm64 }}not_tested{{ else }}{{ gitea.tested_arm64 }}{{ endif }}-arm64-{{ if gitea.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if gitea.tested_armv8 }}not_tested{{ else }}{{ gitea.tested_armv8 }}{{ endif }}-armv8-{{ if gitea.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ gitea.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling gitea

#### Command:

**`vlab set gitea.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=gitea`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

##### MariaDB
{% if gitea.use_mariadb %}
- Defaults true
- False allows for SQLite option without database in separate container
{% endif %}

##### SSH Port
{{ gitea.gitea_ssh_port }} - defaults to 2222, can be adjusted
- Default is 2222
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

3. run **`vlab update_one service=gitea`** to complete the changes


## ACCESS

gitea (HTTPS) link: [https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/)
gitea (HTTP) link: [http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ gitea.subdomain + "." + tor_domain }}/](http://{{ gitea.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gitea.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set gitea.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set gitea.domain gitea.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  domain: gitea.com
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### SUBDOMAIN
*Default: gitea*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set gitea.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

### VERSION
*Default: {{gitea.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set gitea.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
gitea
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=gitea`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
