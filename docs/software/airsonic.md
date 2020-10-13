# Airsonic

[Airsonic](https://airsonic.github.io/) is a free, web-based media streamer, providing ubiquitous access to your music.

![tested](https://img.shields.io/badge/{{ if airsonic.tested_text == "no" }}not_tested{{ else }}{{ airsonic.tested_text }}{{ endif }}-None_Arm-{{ if airsonic.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if airsonic.tested_text_arm == "no" }}not_tested{{ else }}{{ airsonic.tested_text_arm }}{{ endif }}-Arm-{{ if airsonic.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ airsonic.version }}
{% endif %}

The docker image comes from [linuxserver/airsonic](https://hub.docker.com/search?q=linuxserver%2Fairsonic&type=image) and should support arm devices.

## Access

It is available at [https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](https://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/) or [http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/](http://{% if airsonic.domain %}{{ airsonic.domain }}{% else %}{{ airsonic.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ airsonic.subdomain + "." + tor_domain }}/](http://{{ airsonic.subdomain + "." + tor_domain }}/)
{% endif %}
