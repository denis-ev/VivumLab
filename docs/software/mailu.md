# Mailu

[Mailu](https://mailu.io/1.7/general.html) is a simple yet full-featured mail server as a set of Docker images.

![tested](https://img.shields.io/badge/{{ if mailu. }}not_tested{{ else }}{{ mailu.tested }}{{ endif }}-None_Arm-{{ if mailu. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if mailu. }}not_tested{{ else }}{{ mailu.tested_arm }}{{ endif }}-Arm-{{ if mailu. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ mailu.version }}
{% endif %}

## Access

It is available at [https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](https://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/) or [http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/](http://{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ mailu.subdomain + "." + tor_domain }}/](http://{{ mailu.subdomain + "." + tor_domain }}/)
{% endif %}

## Admin Access

It is available at [https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](https://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/) or [http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/](http://admin.{% if mailu.domain %}{{ mailu.domain }}{% else %}{{ mailu.subdomain + "." + domain }}{% endif %}/ui/)

{% if enable_tor %}
It is also available via Tor at [http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/](http://admin.{{ mailu.subdomain + "." + tor_domain }}/ui/)
{% endif %}

You can login using admin@{{ domain }} and the password found on your server in `/var/vivumlab/mailu/.env` under INITIAL_ADMIN_PW, or in `settings/passwords/mailu_admin_password` from your deploy location.

## Creating Users

You can create users in the admin interface, by clicking `Mail Domains` on the main menu, then the envelope icon next to your mail domain.

Users can then also login to the admin interface, but will only be able to adjunt their password and spam settings.
