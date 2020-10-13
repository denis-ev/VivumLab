# BulletNotes

[BulletNotes](https://github.com/Vivumlab/BulletNotes/) is an open source note taking app.

![tested](https://img.shields.io/badge/{{ if bulletnotes.tested_text == "no" }}not_tested{{ else }}{{ bulletnotes.tested_text }}{{ endif }}-None_Arm-{{ if bulletnotes.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if bulletnotes.tested_text_arm == "no" }}not_tested{{ else }}{{ bulletnotes.tested_text_arm }}{{ endif }}-Arm-{{ if bulletnotes.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ bulletnotes.version }}
{% endif %}

The docker image comes from [nickbusey/bulletnotes](https://hub.docker.com/r/nickbusey/bulletnotes/tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at [https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/) or [http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ bulletnotes.subdomain + "." + tor_domain }}/](http://{{ bulletnotes.subdomain + "." + tor_domain }}/)
{% endif %}
