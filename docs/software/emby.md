# Emby

[Emby](https://emby.media/) is a media server. Just point it at your NAS collections of Movies and TV and you're off to the races.

![tested](https://img.shields.io/badge/{{ if emby. }}not_tested{{ else }}{{ emby.tested }}{{ endif }}-None_Arm-{{ if emby. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if emby. }}not_tested{{ else }}{{ emby.tested_arm }}{{ endif }}-Arm-{{ if emby. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ emby.version }}
{% endif %}

The docker image comes from [emby/embyserver](https://hub.docker.com/r/emby/embyserver)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=embyserver&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](https://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/) or [http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/](http://{% if emby.domain %}{{ emby.domain }}{% else %}{{ emby.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ emby.subdomain + "." + tor_domain }}/](http://{{ emby.subdomain + "." + tor_domain }}/)
{% endif %}
