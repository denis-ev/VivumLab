# Readarr

[Readarr](https://readarr.com/) Readarr is a ebook collection manager for Usenet and BitTorrent users.

**Supported Architectures:** amd64  !!! DEVELOPERS: please do your research, and populate this properly !!!

## Setup

To enable Readarr, run the following command:

**`vlab enable.readarr true`**

alternatively, you can set the appropriate service settings in `settings/config.yml` to true

eg.
```
readarr:
  enable: True
```

To finalise any changes made, please run:

**`vlab update_one.readarr`**

## First Run

!!! DEVELOPERS: make sure that you include any information that the user requires to get started here. !!!

!!! Below are some example headings (3 hashes), with some example instructions!!!

### ADMINISTRATOR SETUP

Navigate to *https://your.service.com/admin*

Create an account with your desired username, as this is the first user <SERVICE> makes this account admin.

### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes

```
# SMTP Settings
```
3. Then run **`vlab update_one <SERVICE>`** to complete the changes


## ACCESS

Readarr is available at [https://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/](https://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/) or [http://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/](http://{% if readarr.domain %}{{ readarr.domain }}{% else %}{{ readarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ readarr.subdomain + "." + tor_domain }}/](http://{{ readarr.subdomain + "." + tor_domain }}/)
{% endif %}

## SECURITY/ HTTPS_ONLY/ AUTH

To enable https_only or auth, run the appropriate command:

**`vlab set readarr.https_only true`**  or

**`vlab set readarr.auth true`**

then run **`vlab update_one readarr`** to finalise the changes

alternatively, you can set the appropriate service settings in `settings/config.yml` to true

eg.
```
hubzilla:
  https_only: true
  auth: true
```
To enable https_only or auth, run the corresponding example of either following command:

**`vlab https only`**
**`vlab auth enable`**

make either of the following changes to the `settings/config.yml` file:

```
readarr:
  https_only: True
  auth: True
```

 and then run **``vlab update_one readarr``** to finalize your changes.


More Information can be found in the [documentation](https://), additional assistance can be found in our [Zulip Chat]().
