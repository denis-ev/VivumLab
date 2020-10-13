# Duplicati

[Duplicati](https://www.duplicati.com/) Free backup software to store encrypted backups online
For Windows, macOS and Linux.

![tested](https://img.shields.io/badge/{{ if duplicati. }}not_tested{{ else }}{{ duplicati.tested }}{{ endif }}-None_Arm-{{ if duplicati. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if duplicati. }}not_tested{{ else }}{{ duplicati.tested_arm }}{{ endif }}-Arm-{{ if duplicati. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ duplicati.version }}
{% endif %}

The docker image comes from [linuxserver/duplicati](https://hub.docker.com/r/linuxserver/duplicati) and should support arm devices.

## Access

> Note: The password for Duplicati is configured to use the `default_password` set during the initail `make config` (which is then subsequently stored in vault.yml)

It is available at [https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/) or [http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ duplicati.subdomain + "." + tor_domain }}/](http://{{ duplicati.subdomain + "." + tor_domain }}/)
{% endif %}
