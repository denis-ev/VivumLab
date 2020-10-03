# Homedash

[Homedash](https://lamarios.github.io/Homedash2/) is a simple dashboard that allows to monitor and interact with many different services.

The docker image comes from [gonzague/homedash](https://hub.docker.com/r/gonzague/homedash)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=homedash&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](https://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/) or [http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/](http://{% if homedash.domain %}{{ homedash.domain }}{% else %}{{ homedash.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ homedash.subdomain + "." + tor_domain }}/](http://{{ homedash.subdomain + "." + tor_domain }}/)
{% endif %}
