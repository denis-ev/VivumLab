# Keycloak

[Keycloak](https://www.keycloak.org/) Open Source Identity and Access Management

![tested](https://img.shields.io/badge/{{ if keycloak. }}not_tested{{ else }}{{ keycloak.tested }}{{ endif }}-None_Arm-{{ if keycloak. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if keycloak. }}not_tested{{ else }}{{ keycloak.tested_arm }}{{ endif }}-Arm-{{ if keycloak. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ keycloak.version }}
{% endif %}

## Access

It is available at [https://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/](https://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/) or [http://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/](http://{% if keycloak.domain %}{{ keycloak.domain }}{% else %}{{ keycloak.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ keycloak.subdomain + "." + tor_domain }}/](http://{{ keycloak.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
keycloak:
  https_only: True
  auth: True
```

## Information

[Tutorial on how to setup Keycloak for a Service](https://github.com/ibuetler/docker-keycloak-traefik-workshop)
