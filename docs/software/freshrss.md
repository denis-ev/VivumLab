# FreshRSS

[FreshRSS](https://freshrss.org) is a free, self-hostable aggregator.

![tested](https://img.shields.io/badge/{{ if freshrss. }}not_tested{{ else }}{{ freshrss.tested }}{{ endif }}-None_Arm-{{ if freshrss. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if freshrss. }}not_tested{{ else }}{{ freshrss.tested_arm }}{{ endif }}-Arm-{{ if freshrss. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ freshrss.version }}
{% endif %}

The docker image comes from [freshrss/freshrss:alpine](https://hub.docker.com/r/freshrss/freshrss)
and currently does not support arm (using alpine) or arm 64 devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=freshrss&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/) or [http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ freshrss.subdomain + "." + tor_domain }}/](http://{{ freshrss.subdomain + "." + tor_domain }}/)
{% endif %}
