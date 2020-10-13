# Gitlab

[Gitlab](https://docs.gitlab.com/) "the single application for the entire DevOps lifecycle".

![tested](https://img.shields.io/badge/{{ if gitlab.tested_text == "no" }}not_tested{{ else }}{{ gitlab.tested_text }}{{ endif }}-None_Arm-{{ if gitlab.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if gitlab.tested_text_arm == "no" }}not_tested{{ else }}{{ gitlab.tested_text_arm }}{{ endif }}-Arm-{{ if gitlab.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ gitlab.version }}
{% endif %}

The docker image comes from [gitlab/gitlab-ce:latest](https://hub.docker.com/r/gitlab/gitlab-ce)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=%20gitlab&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](https://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/) or [http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/](http://{% if gitlab.domain %}{{ gitlab.domain }}{% else %}{{ gitlab.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ gitlab.subdomain + "." + tor_domain }}/](http://{{ gitlab.subdomain + "." + tor_domain }}/)
{% endif %}

After the initial setup, for your first access, you can login with the default username `root` and the password has been created in your `settings/passwords/gitlab_root_password`

### SSH Port
{{ gitlab.ssh_port }} - defaults to 223, can be adjusted
- Default is 223
- Adjust in settings/config.yml
