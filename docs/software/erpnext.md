# ERPNext

[ERPNext](https://github.com/frappe/frappe_docker) Open Source ERP for Everyone.

![amd64](https://img.shields.io/badge/{% if not erpnext.amd64 %}untested{% else %}{{ erpnext.amd64 }}{% endif %}-amd64-{% if not erpnext.amd64 %}inactive{% elif erpnext.amd64 == "verified" %}success{% elif erpnext.amd64 == "supported" %}informational{% elif erpnext.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not erpnext.arm64 %}untested{% else %}{{ erpnext.arm64 }}{% endif %}-arm64-{% if not erpnext.arm64 %}inactive{% elif erpnext.arm64 == "verified" %}success{% elif erpnext.arm64 == "supported" %}informational{% elif erpnext.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not erpnext.armv7 %}untested{% else %}{{ erpnext.armv7 }}{% endif %}-armv7-{% if not erpnext.armv7 %}inactive{% elif erpnext.armv7 == "verified" %}success{% elif erpnext.armv7 == "supported" %}informational{% elif erpnext.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information

**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ erpnext.version }}

## SETUP

### Enabling erpnext

#### Command:

**`vlab set erpnext.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=erpnext`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

On your server run:

```
chmod -R 777 {{ volumes_root }}/erpnext/
```

then

```
docker exec -it -e "SITE_NAME={% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}" -e "SITES={% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}" -e "ADMIN_PASSWORD=PASS" -e "INSTALL_APPS=erpnext" -e "FORCE=1" erpnext_erpnext-python_1 docker-entrypoint.sh new
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

3. run **`vlab update_one service=erpnext`** to complete the changes


## ACCESS

erpnext (HTTPS) link: [https://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/](https://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/)
erpnext (HTTP) link: [http://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/](http://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ erpnext.subdomain + "." + tor_domain }}/](http://{{ erpnext.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set erpnext.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=erpnext`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set erpnext.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=erpnext`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set erpnext.domain erpnext.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  domain: erpnext.com
```

##### Finalising changes:

run: **`vlab update_one service=erpnext`**

### SUBDOMAIN
*Default: erpnext*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set erpnext.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=erpnext`**

### VERSION
*Default: {{  erpnext.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set erpnext.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
erpnext
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=erpnext`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
