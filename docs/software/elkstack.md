# ELK Stack

[ELK Stack](https://github.com/deviantony/docker-elk) Elastic Search, Logstash and Kibana

![tested](https://img.shields.io/badge/{{ if elkstack.tested_text == "no" }}not_tested{{ else }}{{ elkstack.tested_text }}{{ endif }}-None_Arm-{{ if elkstack.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if elkstack.tested_text_arm == "no" }}not_tested{{ else }}{{ elkstack.tested_text_arm }}{{ endif }}-Arm-{{ if elkstack.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ elkstack.version }}
{% endif %}

The docker image comes from [sebp/elk](https://hub.docker.com/r/sebp/elk)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=elk&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/](https://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/) or [http://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/](http://{% if elkstack.domain %}{{ elkstack.domain }}{% else %}{{ elkstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ elkstack.subdomain + "." + tor_domain }}/](http://{{ elkstack.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

elkstack:
  https_only: True
  auth: True
