# Homedash

[Homedash](https://lamarios.github.io/Homedash2/) is a simple dashboard that allows to monitor and interact with many different services.

![tested](https://img.shields.io/badge/{{ if homedash. }}not_tested{{ else }}{{ homedash.tested }}{{ endif }}-None_Arm-{{ if homedash. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if homedash. }}not_tested{{ else }}{{ homedash.tested_arm }}{{ endif }}-Arm-{{ if homedash. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ homedash.version }}
{% endif %}

The docker image comes from [gonzague/homedash](https://hub.docker.com/r/gonzague/homedash)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=homedash&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/) or [http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ homedash.subdomain + "." + tor_domain }}/](http://{{ homedash.subdomain + "." + tor_domain }}/)
{% endif %}
