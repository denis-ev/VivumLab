# bookstack

[Bookstack](https://www.bookstackapp.com/) Simple & Free Wiki Software

The docker image comes from [solidnerd/bookstack:0.29.2](https://hub.docker.com/r/solidnerd/bookstack/tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=bookstack&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](https://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/) or [http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/](http://{% if bookstack.domain %}{{ bookstack.domain }}{% else %}{{ bookstack.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ bookstack.subdomain + "." + tor_domain }}/](http://{{ bookstack.subdomain + "." + tor_domain }}/)
{% endif %}
