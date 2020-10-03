# Firefly III

[Firefly III](https://firefly-iii.org/) is a money management app.

The docker image comes from [jc5x/firefly-iii](https://hub.docker.com/r/jc5x/firefly-iii) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

It is available at [https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](https://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/) or [http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/](http://{% if firefly_iii.domain %}{{ firefly_iii.domain }}{% else %}{{ firefly_iii.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ firefly_iii.subdomain + "." + tor_domain }}/](http://{{ firefly_iii.subdomain + "." + tor_domain }}/)
{% endif %}
