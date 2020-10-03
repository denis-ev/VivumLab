# Gitea

[Gitea](https://gitea.io/en-US/) is a Git hosting platform.

The docker image comes from [gitea/gitea:1.8.3](https://hub.docker.com/r/gitea/gitea)
and currently does not support arm devices **BUT MAY IN THE FUTURE**. [Please see issue 478](https://gitlab.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

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
