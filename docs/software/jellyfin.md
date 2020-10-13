# Jellyfin

[Jellyfin](https://github.com/jellyfin/jellyfin) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![tested](https://img.shields.io/badge/{{ if jellyfin.tested_text == "no" }}not_tested{{ else }}{{ jellyfin.tested_text }}{{ endif }}-None_Arm-{{ if jellyfin.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if jellyfin.tested_text_arm == "no" }}not_tested{{ else }}{{ jellyfin.tested_text_arm }}{{ endif }}-Arm-{{ if jellyfin.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ jellyfin.version }}
{% endif %}

## Access

It is available at [https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](https://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/) or [http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/](http://{% if jellyfin.domain %}{{ jellyfin.domain }}{% else %}{{ jellyfin.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ jellyfin.subdomain + "." + tor_domain }}/](http://{{ jellyfin.subdomain + "." + tor_domain }}/)
{% endif %}
