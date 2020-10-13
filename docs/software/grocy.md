# Grocy

[Grocy](https://grocy.info) ERP beyond your fridge - grocy is a web-based self-hosted groceries & household management solution for your home

![tested](https://img.shields.io/badge/{{ if grocy.tested_text == "no" }}not_tested{{ else }}{{ grocy.tested_text }}{{ endif }}-None_Arm-{{ if grocy.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if grocy.tested_text_arm == "no" }}not_tested{{ else }}{{ grocy.tested_text_arm }}{{ endif }}-Arm-{{ if grocy.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ grocy.version }}
{% endif %}

The docker image comes from [linuxserver/grocy](https://hub.docker.com/r/linuxserver/grocy) and should support arm devices.

## Access

Default login is user admin with password admin, please change the password immediately (see user menu).

It is available at [https://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/](https://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/) or [http://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/](http://{% if grocy.domain %}{{ grocy.domain }}{% else %}{{ grocy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ grocy.subdomain + "." + tor_domain }}/](http://{{ grocy.subdomain + "." + tor_domain }}/)
{% endif %}
