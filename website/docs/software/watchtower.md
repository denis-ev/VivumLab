---
id: watchtower
title: Watchtower
hide_title: true
hide_table_of_contents: false
sidebar_label: Watchtower
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Watchtower

[Watchtower](https://containrrr.github.io/watchtower/) A process for automating Docker container base image updates

![amd64](https://img.shields.io/badge/{% if not watchtower.amd64 %}untested{% else %}{{ watchtower.amd64 }}{% endif %}-amd64-{% if not watchtower.amd64 %}inactive{% elif watchtower.amd64 == "verified" %}success{% elif watchtower.amd64 == "supported" %}informational{% elif watchtower.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not watchtower.arm64 %}untested{% else %}{{ watchtower.arm64 }}{% endif %}-arm64-{% if not watchtower.arm64 %}inactive{% elif watchtower.arm64 == "verified" %}success{% elif watchtower.arm64 == "supported" %}informational{% elif watchtower.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not watchtower.armv7 %}untested{% else %}{{ watchtower.armv7 }}{% endif %}-armv7-{% if not watchtower.armv7 %}inactive{% elif watchtower.armv7 == "verified" %}success{% elif watchtower.armv7 == "supported" %}informational{% elif watchtower.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ watchtower.version }}

## SETUP

### Enabling watchtower

#### Command:

**`vlab set watchtower.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=watchtower`**

## FIRST RUN

### Default

By default, watchtower will watch all containers. However, sometimes only some containers should be updated.

If you need to exclude some containers, set the `com.centurylinklabs.watchtower.enable` label to `false`.

Example:
go to `{{ volumes_root }}/watchtower/` and run `cp docker-compose.yml docker-compose.override.yml` (This creates the override file for you.).
Then edit the file and delete everything that is already in the docker-compose.yml file that you don't want to customize.

from this
```
---
version: '3'

services:
  watchtower:
    image: containrrr/watchtower
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      #- "{{ volumes_root }}/watchtower/config.json:/config.json:rw" # Only needed for Private registries
    command: --schedule "0 2 * * *" --cleanup --stop-timeout 30s
    environment:
      - TZ=Europe/Berlin
```

to this
```
---
version: '3'

services:
  watchtower:
```

next you want to add a label

```
---
version: '3'

services:
  watchtower:
    labels:
      - com.centurylinklabs.watchtower.enable=false
```

Run `systemctl restart watchtower`

Now the automatic update for the watchtower image is disabled.

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

3. run **`vlab update_one service=watchtower`** to complete the changes

## Access

Watchtower has no web interface.

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set watchtower.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=watchtower`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set watchtower.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=watchtower`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set watchtower.domain watchtower.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  domain: watchtower.com
```

##### Finalising changes:

run: **`vlab update_one service=watchtower`**

### SUBDOMAIN
*Default: watchtower* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set watchtower.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=watchtower`**

### VERSION
*Default: {{  watchtower.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set watchtower.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
watchtower
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=watchtower`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
