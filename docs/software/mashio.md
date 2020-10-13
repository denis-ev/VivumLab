# Mashio

[Mashio](https://gitlab.com/NickBusey/mashio) is a home brewery management software.

![tested](https://img.shields.io/badge/{{ if mashio. }}not_tested{{ else }}{{ mashio.tested }}{{ endif }}-None_Arm-{{ if mashio. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if mashio. }}not_tested{{ else }}{{ mashio.tested_arm }}{{ endif }}-Arm-{{ if mashio. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ mashio.version }}
{% endif %}

## Access

It is available at [https://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/](https://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/) or [http://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/](http://{% if mashio.domain %}{{ mashio.domain }}{% else %}{{ mashio.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ mashio.subdomain + "." + tor_domain }}/](http://{{ mashio.subdomain + "." + tor_domain }}/)
{% endif %}
