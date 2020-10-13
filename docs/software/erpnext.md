# ERPNext

[ERPNext](https://github.com/frappe/frappe_docker) Open Source ERP for Everyone.

![tested](https://img.shields.io/badge/{{ if erpnext. }}not_tested{{ else }}{{ erpnext.tested }}{{ endif }}-None_Arm-{{ if erpnext. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if erpnext. }}not_tested{{ else }}{{ erpnext.tested_arm }}{{ endif }}-Arm-{{ if erpnext. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ erpnext.version }}
{% endif %}

The docker image comes from [multiple images](https://hub.docker.com/u/frapper)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement and test your idea using the [documentation](../dev/Adding-Services.md).

## Setup

On your server run:

```
chmod -R 777 {{ volumes_root }}/erpnext/
```

then

```
docker exec -it -e "SITE_NAME={% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}" -e "SITES={% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}" -e "ADMIN_PASSWORD=PASS" -e "INSTALL_APPS=erpnext" -e "FORCE=1" erpnext_erpnext-python_1 docker-entrypoint.sh new
```

## Access

It is available at [https://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/](https://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/) or [http://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/](http://{% if erpnext.domain %}{{ erpnext.domain }}{% else %}{{ erpnext.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ erpnext.subdomain + "." + tor_domain }}/](http://{{ erpnext.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
erpnext:
  https_only: True
  auth: True
```
