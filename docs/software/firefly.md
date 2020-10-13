# Firefly III

[Firefly III](https://firefly-iii.org/) is a money management app.

![tested](https://img.shields.io/badge/{{ if firefly_iii.tested_text == "no" }}not_tested{{ else }}{{ firefly_iii.tested_text }}{{ endif }}-None_Arm-{{ if firefly_iii.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if firefly_iii.tested_text_arm == "no" }}not_tested{{ else }}{{ firefly_iii.tested_text_arm }}{{ endif }}-Arm-{{ if firefly_iii.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ firefly_iii.version }}
{% endif %}

The docker image comes from [jc5x/firefly-iii](https://hub.docker.com/r/jc5x/firefly-iii) and should support arm devices.

## Access

It is available at [https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/) or [http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ firefly_iii.subdomain + "." + tor_domain }}/](http://{{ firefly_iii.subdomain + "." + tor_domain }}/)
{% endif %}
