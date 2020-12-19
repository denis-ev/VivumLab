---
id: getting-started
title: Next Step
hide_title: true
hide_table_of_contents: false
sidebar_label: Getting Started
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Next Step

Once you are all setup and ready to go you should be able to load SUI at [https://{% if sui.domain %}{{ sui.domain }}{% else %}{{ sui.subdomain + "." + domain }}{% endif %}/].

## Securing Services

If you want to add an extra layer of authentication to a service, all you have to do is set **`vlab set <service>.auth=true`**. Once this is set, authentication will be handled outside of the service.

This is useful, if the service doesn't provide authentication, eg. SUI. and you would like it to be protected.

By default `Traefik` handles authentication, if the `<service>.auth` is set to true. More specialised and full featured options are available, check out your options [here](../welcome).

## File locations

VivumLab sets up `{{ volumes_root }}` on your server, which maps to `/var/vivumlab` by default. All data used to set up your services, can be found here.

If you can't find what you are looking for there; large databases, media collections (audio and video) are typically stored in the "{{ storage_dir }}", which defaults to `/mnt/nas`. Using NAS storage? see [NAS](Storage) for more information.

## HTTPS via LetsEncrypt

VivumLab will use Traefik's built in LetsEncrypt integration to automatically generate SSL certificates for your various services.

If initially some of the certificates don't appear valid, you have likely run into [LetsEncrypt rate limits](https://letsencrypt.org/docs/rate-limits/).

This is LetsEncrypts way of keeping LetsEncrypt usage fair, and as such does not have a fix. Limits will reset in a week. [see here](https://letsencrypt.org/docs/rate-limits/#a-id-overrides-a-overrides)

## SMTP

In order for your applications to be able to utilise email (confirmation emails, etc), you need an SMTP server. A nice free one is [Mailgun](http://mailgun.com/).

Create an account, and follow their steps to register your domain.

Once that is completed, you can plug the settings they provide into your `settings/vault.yml` file.
To do this:

1. run the **`vlab decrypt`** command
2. find and edit the `vault.yml` file
    > NOTE: editing this file may require superuser/ root permissions
3. Set the following settings to what you have been provided

```
# SMTP Settings
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

4. Now, edit the `settings/config.yml` file, and set:
```
mailu:
  forward_to_smtp: False
```
to ...

```
mailu:
  forward_to_smtp: True
```

This will allow mailu (and every other VivumLab service) to use the mail gun SMTP server

5. Save, and run **`vlab deploy`** to finalise any changes.
