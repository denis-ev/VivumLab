# Jackett

[Jackett](https://github.com/Jackett/Jackett) provides API Support for your favorite torrent trackers.

![amd64_verified](https://img.shields.io/badge/{{ if PackageFileName.tested_amd64 }}not_tested{{ else }}{{ PackageFileName.tested_amd64 }}{{ endif }}-amd64-{{ if PackageFileName.tested_amd64 }}red{{ else }}informational{{ endif }}?style=flat)
![arm64_verified](https://img.shields.io/badge/{{ if PackageFileName.tested_arm64 }}not_tested{{ else }}{{ PackageFileName.tested_arm64 }}{{ endif }}-arm64-{{ if PackageFileName.tested_arm64 }}red{{ else }}informational{{ endif }}?style=flat)
![armv8_verified](https://img.shields.io/badge/{{ if PackageFileName.tested_armv8 }}not_tested{{ else }}{{ PackageFileName.tested_armv8 }}{{ endif }}-armv8-{{ if PackageFileName.tested_armv8 }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested_amd64 or tested_arm64 or tested_armv8 %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ PackageFileName.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling PackageFileName

#### Command:

**`vlab set PackageFileName.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

It is important to secure Jackett! Access the Jackett dashboard with the links below,
scroll down to the `Jackett Configuration` section, and set a value for `Admin Password`.
Hit `Set Password` and you should be good to go.

Set up some indexers in the interface, and now in [Sonarr](sonarr.md) and
[Radarr](radarr.md) you can setup the link to Jackett.

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

3. run **`vlab update_one service=PackageFileName`** to complete the changes


## ACCESS

PackageFileName (HTTPS) link: [https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)
PackageFileName (HTTP) link: [http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ PackageFileName.subdomain + "." + tor_domain }}/](http://{{ PackageFileName.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set PackageFileName.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set PackageFileName.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

### DOMAIN
*Default: {{domain}}*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set PackageFileName.domain PackageFileName.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  domain: PackageFileName.com
```

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

### SUBDOMAIN
*Default: PackageFileName*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set PackageFileName.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

### VERSION
*Default: {{PackageFileName.version}}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set PackageFileName.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
PackageFileName
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
