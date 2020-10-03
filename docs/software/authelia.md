# Authelia

[Authelia](https://www.Authelia.com) is an open-source full-featured authentication server.

## What is this?

Authelia is a multi-factor, authentication proxy. Used in conjuction with traefik (which vivumlab already uses) it secures your vivumlab services behind authentication. By default you must authenticate with username and password, and at least one other 'factor' ie:

- one-time password from, say, google authenticator
- a registered security key, for instance a YubiKey or something similar
- A Push message to your mobile device throuh the Duo service

When enabled, Traefik will forward most requests (more on this later) to Authelia for authentication. Once you login to Authelia, it will redirect you to the service you requested. For instance, if you navigate to firefly.yourdomain.com, traefik will auto-redirect you to auth.yourname.com for authentication. Once you authenticate, it will redirect you back to firefly.yourdomain.com.

On the backend, Authelia authenticates users against a userdb.yml file. The passwords in this file are hashed with sha512. If you need to manually edit the userdb.yml file, you'll need to create new password hashes with this command:

```bash
docker run authelia/authelia:latest authelia hash-password 'YOUR NEW PASSWORD' | awk '{print $3}''Your new Password Here'
```

The docker image comes from [authelia/authelia:latest](https://hub.docker.com/r/authelia/authelia) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Prerequisites

> Note: Authelia is written in GO, and there is a known GO issue with certain Linux Kernel Versions. Specifically, Ubuntu 20.04 ships with a default kernel of 5.3.0-46 (as of 4/28/2020) Using this kernel will result in a constantly-dying-and-restarting Authelia container with a note that shows Runtime: mlock of signal stack failed.... Update your kernel to 5.3.15+, 5.4.2+, or 5.5+ You *must* upgrade your docker hosts' kerenl to one of those versions for Authelia to work

1. Authelia requires a working SMTP server to authenticate new users and register devices.

## Configuration

VivumLab ships with intelligent defaults for Authelia. However, there are some choices you must make. In config.yml, there is an Authelia section. The configuration options are explained below:

### Authelia configuration options

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

## Overriding the default policy

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

## Access

It is available at [https://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/](https://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/) or [http://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/](http://{% if authelia.domain %}{{ authelia.domain }}{% else %}{{ authelia.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ authelia.subdomain + "." + tor_domain }}/](http://{{ authelia.subdomain + "." + tor_domain }}/)
{% endif %}
