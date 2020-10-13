# HomeBridge

[HomeBridge](https://homebridge.io/) HomeKit support for the impatient

![tested](https://img.shields.io/badge/{{ if homebridge.tested_text == "no" }}not_tested{{ else }}{{ homebridge.tested_text }}{{ endif }}-None_Arm-{{ if homebridge.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if homebridge.tested_text_arm == "no" }}not_tested{{ else }}{{ homebridge.tested_text_arm }}{{ endif }}-Arm-{{ if homebridge.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ homebridge.version }}
{% endif %}

The docker image comes from [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge) and should support arm devices.

## Access

It is available at [https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](https://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/) or [http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/](http://{% if homebridge.domain %}{{ homebridge.domain }}{% else %}{{ homebridge.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ homebridge.subdomain + "." + tor_domain }}/](http://{{ homebridge.subdomain + "." + tor_domain }}/)
{% endif %}
