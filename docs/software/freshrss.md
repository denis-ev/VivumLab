# FreshRSS

[FreshRSS](https://freshrss.org) is a free, self-hostable aggregator.

The docker image comes from [freshrss/freshrss:alpine](https://hub.docker.com/r/freshrss/freshrss)
and currently does not support arm (using alpine) or arm 64 devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=freshrss&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](https://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/) or [http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/](http://{% if freshrss.domain %}{{ freshrss.domain }}{% else %}{{ freshrss.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ freshrss.subdomain + "." + tor_domain }}/](http://{{ freshrss.subdomain + "." + tor_domain }}/)
{% endif %}
