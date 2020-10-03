# Beets

[Beets](https://beets.io) Beets is the media library management system for obsessive-compulsive music geeks.

The docker image comes from [linuxserver/beets](https://hub.docker.com/r/linuxserver/beets/tags) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

It is available at [https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](https://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/) or [http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/](http://{% if beets.domain %}{{ beets.domain }}{% else %}{{ beets.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ beets.subdomain + "." + tor_domain }}/](http://{{ beets.subdomain + "." + tor_domain }}/)
{% endif %}
