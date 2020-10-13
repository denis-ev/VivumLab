# Digikam

[Digikam](https://www.digikam.org/) Professional Photo Management with the Power of Open Source

![tested](https://img.shields.io/badge/{{ if digikam. }}not_tested{{ else }}{{ digikam.tested }}{{ endif }}-None_Arm-{{ if digikam. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if digikam. }}not_tested{{ else }}{{ digikam.tested_arm }}{{ endif }}-Arm-{{ if digikam. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ digikam.version }}
{% endif %}

The docker image comes from [rpufky/digikam](https://hub.docker.com/r/rpufky/digikam)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=digikam&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](../dev/Adding-Services.md).

## Access

It is available at [https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/) or [http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ digikam.subdomain + "." + tor_domain }}/](http://{{ digikam.subdomain + "." + tor_domain }}/)
{% endif %}
