# Beets

[Beets](https://beets.io) Beets is the media library management system for obsessive-compulsive music geeks.

![tested](https://img.shields.io/badge/{{ if beets.tested_text == "no" }}not_tested{{ else }}{{ beets.tested_text }}{{ endif }}-None_Arm-{{ if beets.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if beets.tested_text_arm == "no" }}not_tested{{ else }}{{ beets.tested_text_arm }}{{ endif }}-Arm-{{ if beets.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ beets.version }}
{% endif %}

The docker image comes from [linuxserver/beets](https://hub.docker.com/r/linuxserver/beets/tags) and should support arm devices.

## Access

It is available at [https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/) or [http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ beets.subdomain + "." + tor_domain }}/](http://{{ beets.subdomain + "." + tor_domain }}/)
{% endif %}
