---
id: authelia
title: Authelia
hide_title: true
hide_table_of_contents: false
sidebar_label: Authelia
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Authelia

[Authelia](https://www.Authelia.com) is an open-source full-featured authentication server.

![amd64](https://img.shields.io/badge/{% if not authelia.amd64 %}untested{% else %}{{ authelia.amd64 }}{% endif %}-amd64-{% if not authelia.amd64 %}inactive{% elif authelia.amd64 == "verified" %}success{% elif authelia.amd64 == "supported" %}informational{% elif authelia.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not authelia.arm64 %}untested{% else %}{{ authelia.arm64 }}{% endif %}-arm64-{% if not authelia.arm64 %}inactive{% elif authelia.arm64 == "verified" %}success{% elif authelia.arm64 == "supported" %}informational{% elif authelia.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not authelia.armv7 %}untested{% else %}{{ authelia.armv7 }}{% endif %}-armv7-{% if not authelia.armv7 %}inactive{% elif authelia.armv7 == "verified" %}success{% elif authelia.armv7 == "supported" %}informational{% elif authelia.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! <br />
**Current Image Version:** {{ authelia.version }}

## SETUP

### What is this?

Authelia is a multi-factor, authentication proxy. Used in conjunction with traefik (which vivumlab already uses) it secures your vivumlab services behind authentication. By default you must authenticate with username and password, and at least one other 'factor' ie:

- one-time password from, say, google authenticator
- a registered security key, for instance a YubiKey or something similar
- A Push message to your mobile device through the Duo service

When enabled, Traefik will forward most requests (more on this later) to Authelia for authentication. Once you login to Authelia, it will redirect you to the service you requested. For instance, if you navigate to firefly.yourdomain.com, traefik will auto-redirect you to auth.yourname.com for authentication. Once you authenticate, it will redirect you back to firefly.yourdomain.com.

On the backend, Authelia authenticates users against a userdb.yml file. The passwords in this file are hashed with sha512. If you need to manually edit the userdb.yml file, you'll need to create new password hashes with this command:

```bash
docker run authelia/authelia:latest authelia hash-password 'YOUR NEW PASSWORD' | awk '{print $3}''Your new Password Here'
```

The docker image comes from [authelia/authelia:latest](https://hub.docker.com/r/authelia/authelia) and should support arm devices.

### Prerequisites

> Note: Authelia is written in GO, and there is a known GO issue with certain Linux Kernel Versions. Specifically, Ubuntu 20.04 ships with a default kernel of 5.3.0-46 (as of 4/28/2020) Using this kernel will result in a constantly-dying-and-restarting Authelia container with a note that shows Runtime: mlock of signal stack failed.... Update your kernel to 5.3.15+, 5.4.2+, or 5.5+ You *must* upgrade your docker hosts' kernel to one of those versions for Authelia to work

1. Authelia requires a working SMTP server to authenticate new users and register devices.

### Configuration

VivumLab ships with intelligent defaults for Authelia. However, there are some choices you must make. In config.yml, there is an Authelia section. The configuration options are explained below:

#### Authelia configuration options

- log_level: defaults to debug, you can set to 'error' as well
- use_username: Defaults to true. if true, your authellia login name is your config.yml's default username: `{{default_username}}`.

- max:
  - retries: this is the maximum number of times someone can _fail_ to authenticate within a given time frame before being locked out. (defaults 5)
  - retries_in_time: this is the time frame that a user has to fail X times in before they're banned. (Defaults to 2min.)
  - retries_ban_time: How long a user is prohibited from logging in after failing X times in Y mintes, per the first two variables. (defaults to 5 minutes) These three combined (as defaulted), means that a user who fails to authenticate 5 times within 2 minutes is banned for 5 minutes.
- default:
  - factor_count: The number of authentication factors required to login. Options are:
    1. `bypass` - Authelia will not require authentication.
    2. `one_factor` - only a user/pass is required.
    3. `two_factor` - (_default_) Username/password as well as a second factor is required.
    4. `deny` - Authelia will prevent login and access to the services.
  - cookie*expiration: How long the authentication cookie is good for. (\_default: 1hr*)
  - cookie*inactivity: How long the cookie can sit, without being refreshed (ie: user is active) before expiring. (\_Defaults to 5min*)
  - policy: This is the default policy for any un-named service. This is the policy for everything unless overriten by other service rules.

### Overriding the default policy

`{{ volumes_root }}/Authelia/Authelia_config.yml` file is the source of truth for post-deployment configuration settings. If you wish to override the default policy, stated in config.yml, you'll need to hand edit this configuration file and restart Authelia. You probably only need to do this if there is a service that you want to excempt from two-factor authentication, or excempt from Authelia all together. About 100 lines into the config you'll find a section that looks like this:

```yml
rules:
  - domain: portainer.{{ domain }}
    policy: one_factor

  - domain: auth.{{ domain }}
    policy: bypass

  - domain: "*.{{ domain }}"
    policy: { { Authelia.default.factor_count } }
```

> Right above this section in your config file is a well documented explination of how this works.

Out of the box, the standard config bypasses Authelia for Authelia itself, and drops portainer down to a single-factor. All other subdomains are locked to the default factor-count, with the final rule. Note, the order of rules matters. The first matching rule wins. If you wish to set a subdomain/service to use something other than your configured default, simply add a clause to the rules section containing at least the following:

```yml
- domain: YourExampleSubdomainHere.{{domain}}
  policy: Whatever Policy You'd like for this domain.
```

> Note, Authelia does understand the concept of groups, and can limit some services to particular groups, ie: administarators. You might use this to limit say, portainer, to admins.

### Enabling authelia

#### Command:

**`vlab set authelia.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=authelia`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!! <br />
!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ authelia.domain }}/admin*

Create an account with your desired username; as this is the first user, authelia makes this account the administrator.

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

3. run **`vlab update_one service=authelia`** to complete the changes


## ACCESS

Authelia (HTTPS) link: [https://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/](https://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/)
Authelia (HTTP) link: [http://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/](http://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ authelia.subdomain + "." + tor_domain }}/](http://{{ authelia.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set authelia.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=authelia`**

### AUTH
*Default: False* <br />
*Options: True/False*

#### Command:

**`vlab set authelia.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=authelia`**

### DOMAIN
*Default: False* <br />
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set authelia.domain authelia.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  domain: authelia.com
```

##### Finalising changes:

run: **`vlab update_one service=authelia`**

### SUBDOMAIN
*Default: authelia* <br />
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set authelia.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=authelia`**

### VERSION
*Default: {{  authelia.version  }}* <br />
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set authelia.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
authelia
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=authelia`**

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://docs.vivumlab.com). <br />
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
