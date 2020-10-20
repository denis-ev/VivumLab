# Mailu

[Mailu](https://mailu.io/1.7/general.html) is a simple yet full-featured mail server as a set of Docker images.

![amd64_verified](https://img.shields.io/badge/{{ if mailu.tested_amd64 }}not_tested{{ else }}{{ mailu.tested_amd64 }}{{ endif }}-amd64-{{ if mailu.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if mailu.tested_arm64 }}not_tested{{ else }}{{ mailu.tested_arm64 }}{{ endif }}-arm64-{{ if mailu.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if mailu.tested_armv8 }}not_tested{{ else }}{{ mailu.tested_armv8 }}{{ endif }}-armv8-{{ if mailu.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ mailu.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling mailu

#### Command:

**`vlab set mailu.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=mailu`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ mailu.domain }}/admin*

Create an account with your desired username; as this is the first user, mailu makes this account the administrator.

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

3. run **`vlab update_one service=mailu`** to complete the changes

#### Creating Users

You can create users in the admin interface, by clicking `Mail Domains` on the main menu, then the envelope icon next to your mail domain.

Users can then also login to the admin interface, but will only be able to adjunt their password and spam settings.

## Access

It is available at [https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/) or [http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ mailu.subdomain + "." + tor_domain }}/](http://{{ mailu.subdomain + "." + tor_domain }}/)
{% endif %}

## Admin Access

It is available at [https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/) or [http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/)

{% if enable_tor %}
It is also available via Tor at [http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/](http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/)
{% endif %}

You can login using admin@{{ domain }} and the password found on your server in `/var/vivumlab/mailu/.env` under INITIAL_ADMIN_PW, or in `settings/passwords/mailu_admin_password` from your deploy location.

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set mailu.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set mailu.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set mailu.domain mailu.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  domain: mailu.com
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### SUBDOMAIN
*Default: mailu*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set mailu.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

### VERSION
*Default: {{mailu.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set mailu.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
mailu
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=mailu`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
