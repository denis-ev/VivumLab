# PackageTitleCase

[PackageTitleCase](PackageURL) PackageOneLiner

![tested](https://img.shields.io/badge/{{ if PackageFileName.tested }}not_tested{{ else }}{{ PackageFileName.tested }}{{ endif }}-None_Arm-{{ if PackageFileName.tested }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if PackageFileName.tested_arm }}not_tested{{ else }}{{ PackageFileName.tested_arm }}{{ endif }}-Arm-{{ if PackageFileName.tested_arm }}red{{ else }}informational{{ endif }}?style=flat)

{% if tested %}
**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version:** {{ PackageFileName.version }}
{% endif %}
**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## SETUP

### Enabling PackageTitleCase

#### Command:

**`vlab set PackageFileName.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
>PackageFileName
  enable: True

#### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ PackageFileName.domain }}/admin*

Create an account with your desired username; as this is the first user, PackageTitleCase makes this account the administrator.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


># SMTP Settings
smtp:
  host: 
  port: 
  user: 
  pass: 
  from_email: 
  from_name: 
  
3. run **`vlab update_one service=PackageFileName`** to complete the changes


## ACCESS

PackageTitleCase (HTTPS) link: [https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](https://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)
PackageTitleCase (HTTP) link: [http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/](http://{% if PackageFileName.domain %}{{ PackageFileName.domain }}{% else %}{{ PackageFileName.subdomain + "." + domain }}{% endif %}/)

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
>PackageFileName
  https_only: True

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
>PackageFileName
  auth: True

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
>PackageFileName
  domain: PackageFileName.com 

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
>PackageFileName
  subdomain: media

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
>PackageFileName
  version: 2.7

##### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

## Need more help?
Further information regarding services can be found.
General Information can be found in the [documentation](https://docs.vivumlab.com).
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
