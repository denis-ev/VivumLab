# Heimdall

[Heimdall](https://heimdall.site/) Heimdall Application Dashboard is a dashboard for all your web applications.

![tested](https://img.shields.io/badge/{{ if heimdall.tested_text == "no" }}not_tested{{ else }}{{ heimdall.tested_text }}{{ endif }}-None_Arm-{{ if heimdall.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if heimdall.tested_text_arm == "no" }}not_tested{{ else }}{{ heimdall.tested_text_arm }}{{ endif }}-Arm-{{ if heimdall.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ heimdall.version }}
{% endif %}

The docker image comes from [linuxserver/heimdall](https://hub.docker.com/r/linuxserver/heimdall) and should support arm devices.

## Access

It is available at [https://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/](https://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/) or [http://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/](http://{% if heimdall.domain %}{{ heimdall.domain }}{% else %}{{ heimdall.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ heimdall.subdomain + "." + tor_domain }}/](http://{{ heimdall.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
heimdall:
  https_only: True
  auth: True
```
