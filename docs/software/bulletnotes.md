# BulletNotes

[BulletNotes](https://github.com/Vivumlab/BulletNotes/) is an open source note taking app.

The docker image comes from [nickbusey/bulletnotes](https://hub.docker.com/r/nickbusey/bulletnotes/tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement,
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](https://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/) or [http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/](http://{% if bulletnotes.domain %}{{ bulletnotes.domain }}{% else %}{{ bulletnotes.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ bulletnotes.subdomain + "." + tor_domain }}/](http://{{ bulletnotes.subdomain + "." + tor_domain }}/)
{% endif %}
