# Home Assistant

[Home Assistant](https://www.home-assistant.io/) can automate just about any part of your home.

![tested](https://img.shields.io/badge/{{ if homeassistant. }}not_tested{{ else }}{{ homeassistant.tested }}{{ endif }}-None_Arm-{{ if homeassistant. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if homeassistant. }}not_tested{{ else }}{{ homeassistant.tested_arm }}{{ endif }}-Arm-{{ if homeassistant. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ homeassistant.version }}
{% endif %}

The docker image comes from [homeassistant/home-assistant](https://hub.docker.com/r/homeassistant/home-assistant) and should support arm devices.

## Access

It is available at [https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/) or [http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ homeassistant.subdomain + "." + tor_domain }}/](http://{{ homeassistant.subdomain + "." + tor_domain }}/)
{% endif %}
