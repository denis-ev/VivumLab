# HealthChecks

[HealthChecks](https://HealthChecks.io) A Cron Monitoring Tool written in Python & Django

![tested](https://img.shields.io/badge/{{ if healthchecks.tested_text == "no" }}not_tested{{ else }}{{ healthchecks.tested_text }}{{ endif }}-None_Arm-{{ if healthchecks.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if healthchecks.tested_text_arm == "no" }}not_tested{{ else }}{{ healthchecks.tested_text_arm }}{{ endif }}-Arm-{{ if healthchecks.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ healthchecks.version }}
{% endif %}

## Access

It is available at [https://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/](https://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/) or [http://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/](http://{% if healthchecks.domain %}{{ healthchecks.domain }}{% else %}{{ healthchecks.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ healthchecks.subdomain + "." + tor_domain }}/](http://{{ healthchecks.subdomain + "." + tor_domain }}/)
{% endif %}
