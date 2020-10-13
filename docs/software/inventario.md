# Inventario

[Inventario](https://gitlab.com/NickBusey/inventario) is a home inventory managament system.

![tested](https://img.shields.io/badge/{{ if beets.tested_text == "no" }}not_tested{{ else }}{{ beets.tested_text }}{{ endif }}-None_Arm-{{ if beets.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if beets.tested_text_arm == "no" }}not_tested{{ else }}{{ beets.tested_text_arm }}{{ endif }}-Arm-{{ if beets.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ beets.version }}
{% endif %}

## Access

It is available at [https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](https://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/) or [http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/](http://{% if inventario.domain %}{{ inventario.domain }}{% else %}{{ inventario.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ inventario.subdomain + "." + tor_domain }}/](http://{{ inventario.subdomain + "." + tor_domain }}/)
{% endif %}
