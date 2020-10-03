# Hubzilla

[Hubzilla](https://framagit.org/hubzilla) is a powerful platform for creating interconnected websites featuring a [decentralized/nomadic identity](https://zotlabs.org/page/hubzilla/hubzilla-project).

The docker image comes from [voryzen/hubzilla:4.6](https://hub.docker.com/r/gonzague/homedash)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=hubzilla&type=image&architecture=arm%2Carm64%2Camd64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Setup

To enable Hubzilla, run the following command:

**`make set hubzilla.enable true`**

then run **`make update_one hubzilla`** to finalise the changes

alternatively, you can set the appropriate service settings in `settings/config.yml` to True, and then run **``make update_one hubzilla``**

eg.
```
hubzilla:
  enable: True
```
## First Run
The first time you access Hubzilla, you will need to **set up the admin account BEFORE** you set any other user account.

To do this:
1. go to your Hubzilla instance, and on the login screen, click `register`
2. create an account using the admin email that was set during installation.
```
Unless you modified the docker-compose file, the default admin email will be admin@your.domain.com
check out the **Access** part of these docs, if you're unsure, which domain you used.
```
3. Unless you have some immediate administration tasks that need finishing, log out and create your own user account using your own email address.
4. Now you can log back into the admin account, and play around. I suggest setting the verify email option, or closing registrations to your hub.
```
Step 4 is a suggestion/ reminder from VivumLab. It is beyond the scope of VivumLab to provide 'how-to' specifics to Hubzilla.
Hubzilla isn't new, so there is plenty of information out there.
```

## SMTP/ Mail

Hubzilla makes pretty good use of a mail server. If you don't want to run your own, sign up for a service like [mailgun](https://www.mailgun.com/).

Setting up such a service is beyond the scope of the VivumLab documentation, however there is plenty of information out there.

Once you have access to a mail server, or a mail service provide Hubzilla with the necessary information.

1. run **`make decrypt`** to decrypt the `vault.yml` file, located in your vivumlab `settings` folder.

2. Access that file (you might need superuser/root/administrator permissions) and change the following options to reflect your own credentials

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
3. Then run **`make update_one hubzilla`** to update Hubzilla; VivumLab will automatically re-encrypt your vault.yml file

## Access

It is available at [https://hubzilla.{{ domain }}/](https://hubzilla.{{ domain }}/) or [http://hubzilla.{{ domain }}/](http://hubzilla.{{ domain }}/)

{% if enable_tor %}
It is also available via Tor at [http://hubzilla.{{ tor_domain }}/](http://hubzilla.{{ tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth, run the appropriate command:

**`make set hubzilla.https_only true`**

**`make set hubzilla.auth true`**

then run **`make update_one hubzilla`** to finalise the changes

alternatively, you can set the appropriate service settings in `settings/config.yml` to True, and then run **``make update_one hubzilla``**

eg.
```
hubzilla:
  https_only: True
  auth: True
```
