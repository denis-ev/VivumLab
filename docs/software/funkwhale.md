# Funkwhale

[Funkwhale](https://Funkwhale.audio/en_US/) A social platform to enjoy and share music

![amd64_verified](https://img.shields.io/badge/{{ if funkwhale.tested_amd64 }}not_tested{{ else }}{{ funkwhale.tested_amd64 }}{{ endif }}-amd64-{{ if funkwhale.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if funkwhale.tested_arm64 }}not_tested{{ else }}{{ funkwhale.tested_arm64 }}{{ endif }}-arm64-{{ if funkwhale.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if funkwhale.tested_armv8 }}not_tested{{ else }}{{ funkwhale.tested_armv8 }}{{ endif }}-armv8-{{ if funkwhale.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ funkwhale.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling funkwhale

#### Command:

**`vlab set funkwhale.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=funkwhale`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Once your funkwhale instance is running, you'll need to SSH into your server and run:

```
docker exec -it funkwhale_app_1 python /app/api/manage.py createsuperuser
```

Now login to your funkwhale instance, and create a Library at [http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/content/libraries](http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/content/libraries)

Get the library ID by grabbing the last bit of the URL for the new library. It should look like `e42019fe-14fe-475c-a5e6-a84dea4184cd`

Now import your music with:

```
export LIBRARY_ID="<YOUR_LIBRARY_ID>"
docker exec -it funkwhale_app_1 python /app/api/manage.py import_files $LIBRARY_ID "/data/music/" --recursive --noinput
```

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

3. run **`vlab update_one service=funkwhale`** to complete the changes


## ACCESS

funkwhale (HTTPS) link: [https://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/](https://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/)
funkwhale (HTTP) link: [http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/](http://{% if funkwhale.domain %}{{ funkwhale.domain }}{% else %}{{ funkwhale.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ funkwhale.subdomain + "." + tor_domain }}/](http://{{ funkwhale.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set funkwhale.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set funkwhale.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set funkwhale.domain funkwhale.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  domain: funkwhale.com
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### SUBDOMAIN
*Default: funkwhale*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set funkwhale.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

### VERSION
*Default: {{funkwhale.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set funkwhale.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
funkwhale
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=funkwhale`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
