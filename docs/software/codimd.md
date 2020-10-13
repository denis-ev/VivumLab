# CodiMD

[CodiMD](https://demo.codimd.org/) The best platform to write and share markdown

![tested](https://img.shields.io/badge/{{ if codimd. }}not_tested{{ else }}{{ codimd.tested }}{{ endif }}-None_Arm-{{ if codimd. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if codimd. }}not_tested{{ else }}{{ codimd.tested_arm }}{{ endif }}-Arm-{{ if codimd. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ codimd.version }}
{% endif %}

The docker image comes from [quay.io/codimd/server:latest](https://quay.io/repository/codimd/server?tag=latest&tab=tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=codimd&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](../dev/Adding-Services.md).

## Access

It is available at [https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](https://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/) or [http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/](http://{% if codimd.domain %}{{ codimd.domain }}{% else %}{{ codimd.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ codimd.subdomain + "." + tor_domain }}/](http://{{ codimd.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

codimd:
  https_only: True
  auth: True
