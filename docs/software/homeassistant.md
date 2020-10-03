# Home Assistant

[Home Assistant](https://www.home-assistant.io/) can automate just about any part of your home.

The docker image comes from [homeassistant/home-assistant](https://hub.docker.com/r/homeassistant/home-assistant) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

It is available at [https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](https://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/) or [http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/](http://{% if homeassistant.domain %}{{ homeassistant.domain }}{% else %}{{ homeassistant.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ homeassistant.subdomain + "." + tor_domain }}/](http://{{ homeassistant.subdomain + "." + tor_domain }}/)
{% endif %}
