# PackageTitleCase

[PackageTitleCase](PackageURL) PackageOneLiner

![amd64](https://img.shields.io/badge/{% if not PackageFileName.amd64 %}untested{% else %}{{ PackageFileName.amd64 }}{% endif %}-amd64-{% if not PackageFileName.amd64 %}inactive{% elif PackageFileName.amd64 == "verified" %}success{% elif PackageFileName.amd64 == "supported" %}informational{% elif PackageFileName.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br>
![arm64](https://img.shields.io/badge/{% if not PackageFileName.arm64 %}untested{% else %}{{ PackageFileName.arm64 }}{% endif %}-arm64-{% if not PackageFileName.arm64 %}inactive{% elif PackageFileName.arm64 == "verified" %}success{% elif PackageFileName.arm64 == "supported" %}informational{% elif PackageFileName.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br>
![armv7](https://img.shields.io/badge/{% if not PackageFileName.armv7 %}untested{% else %}{{ PackageFileName.armv7 }}{% endif %}-armv7-{% if not PackageFileName.armv7 %}inactive{% elif PackageFileName.armv7 == "verified" %}success{% elif PackageFileName.armv7 == "supported" %}informational{% elif PackageFileName.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br>

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br>
**Current Image Version:** {{ PackageFileName.version }}

## SETUP

### Enabling PackageTitleCase

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

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br>
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ PackageFileName.domain }}/admin*

Create an account with your desired username; as this is the first user, PackageFileName makes this account the administrator.

### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file
2. make some changes


#### SMTP Settings
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
*Default: False* <br>
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

### AUTH
*Default: False* <br>
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

### DOMAIN
*Default: False* <br>
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

### SUBDOMAIN
*Default: PackageFileName* <br>
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

### VERSION
*Default: {{  PackageFileName.version  }}* <br>
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

### Finalising changes:

run: **`vlab update_one service=PackageFileName`**

## Need more help?
Further information regarding services can be found. <br>
General Information can be found in the [documentation](https://docs.vivumlab.com). <br>
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
