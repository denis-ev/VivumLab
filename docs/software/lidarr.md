# Lidarr

[Lidarr](https://lidarr.audio/) Sonarr but for Music.

![tested](https://img.shields.io/badge/{{ if lidarr.tested_text == "no" }}not_tested{{ else }}{{ lidarr.tested_text }}{{ endif }}-None_Arm-{{ if lidarr.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if lidarr.tested_text_arm == "no" }}not_tested{{ else }}{{ lidarr.tested_text_arm }}{{ endif }}-Arm-{{ if lidarr.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ lidarr.version }}
{% endif %}

## Access

It is available at [https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](https://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/) or [http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/](http://{% if lidarr.domain %}{{ lidarr.domain }}{% else %}{{ lidarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ lidarr.subdomain + "." + tor_domain }}/](http://{{ lidarr.subdomain + "." + tor_domain }}/)
{% endif %}
