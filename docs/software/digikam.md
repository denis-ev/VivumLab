# Digikam

[Digikam](https://www.digikam.org/) Professional Photo Management with the Power of Open Source

The docker image comes from [rpufky/digikam](https://hub.docker.com/r/rpufky/digikam)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=digikam&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](https://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/) or [http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/](http://{% if digikam.domain %}{{ digikam.domain }}{% else %}{{ digikam.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ digikam.subdomain + "." + tor_domain }}/](http://{{ digikam.subdomain + "." + tor_domain }}/)
{% endif %}
