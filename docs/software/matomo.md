# Matomo

[Matomo](https://matomo.org) Google Analytics alternative that protects your data and your customers' privacy.

![tested](https://img.shields.io/badge/{{ if matomo. }}not_tested{{ else }}{{ matomo.tested }}{{ endif }}-None_Arm-{{ if matomo. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if matomo. }}not_tested{{ else }}{{ matomo.tested_arm }}{{ endif }}-Arm-{{ if matomo. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ matomo.version }}
{% endif %}

## Setup

During the setup wizard, your database connection information should all be autopopulated. Just click `Next`.

## Access

It is available via [https://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/](https://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/) or [http://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/](http://{% if matomo.domain %}{{ matomo.domain }}{% else %}{{ matomo.subdomain + "." + domain }}{% endif %}/).

{% if enable_tor %}
It is also available via Tor at [http://{{ matomo.subdomain + "." + tor_domain }}/](http://{{ matomo.subdomain + "." + tor_domain }}/)
{% endif %}
