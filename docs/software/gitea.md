# Gitea

[Gitea](https://gitea.io/en-US/) is a Git hosting platform.

![tested](https://img.shields.io/badge/{{ if gitea.tested_text == "no" }}not_tested{{ else }}{{ gitea.tested_text }}{{ endif }}-None_Arm-{{ if gitea.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if gitea.tested_text_arm == "no" }}not_tested{{ else }}{{ gitea.tested_text_arm }}{{ endif }}-Arm-{{ if gitea.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ gitea.version }}
{% endif %}

The docker image comes from [gitea/gitea:1.8.3](https://hub.docker.com/r/gitea/gitea)
and currently does not support arm devices **BUT MAY IN THE FUTURE**.

## Access

It is available at [https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](https://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/) or [http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/](http://{% if gitea.domain %}{{ gitea.domain }}{% else %}{{ gitea.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ gitea.subdomain + "." + tor_domain }}/](http://{{ gitea.subdomain + "." + tor_domain }}/)
{% endif %}

### MariaDB
{% if gitea.use_mariadb %}
- Defaults true
- False allows for SQLite option without database in separate container
{% endif %}

### SSH Port
{{ gitea.gitea_ssh_port }} - defaults to 222, can be adjusted
- Default is 222
- Adjust in settings/config.yml
