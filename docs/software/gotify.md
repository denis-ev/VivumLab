# Gotify

[Gotify](https://github.com/gotify/server) A simple server for sending and receiving messages in real-time per WebSocket. (Includes a sleek web-ui)

![tested](https://img.shields.io/badge/{{ if gotify. }}not_tested{{ else }}{{ gotify.tested }}{{ endif }}-None_Arm-{{ if gotify. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if gotify. }}not_tested{{ else }}{{ gotify.tested_arm }}{{ endif }}-Arm-{{ if gotify. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ gotify.version }}
{% endif %}

The docker image comes from [gotify/server](https://hub.docker.com/r/gotify/server))
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=gotify%2Fserver&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](../dev/Adding-Services.md).

## Access

It is available at [https://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/](https://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/) or [http://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/](http://{% if gotify.domain %}{{ gotify.domain }}{% else %}{{ gotify.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ gotify.subdomain + "." + tor_domain }}/](http://{{ gotify.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
gotify:
  https_only: True
  auth: True
```
