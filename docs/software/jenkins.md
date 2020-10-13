# Jenkins

[Jenkins](https://www.jenkins.io/) The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project.

![tested](https://img.shields.io/badge/{{ if jenkins. }}not_tested{{ else }}{{ jenkins.tested }}{{ endif }}-None_Arm-{{ if jenkins. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if jenkins. }}not_tested{{ else }}{{ jenkins.tested_arm }}{{ endif }}-Arm-{{ if jenkins. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ jenkins.version }}
{% endif %}

## Access

It is available at [https://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/](https://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/) or [http://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/](http://{% if jenkins.domain %}{{ jenkins.domain }}{% else %}{{ jenkins.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ jenkins.subdomain + "." + tor_domain }}/](http://{{ jenkins.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
jenkins:
  https_only: True
  auth: True
```
