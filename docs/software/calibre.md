# Calibre

[Calibre](https://calibre-ebook.com) Ebook management system.

[Calibre Web](https://github.com/janeczku/calibre-web) Web app for accessing ebook library

The docker image comes from [lmorel3/calibre-alpine](https://hub.docker.com/r/lmorel3/calibre-alpine/tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=calibre&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](https://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/) or [http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/](http://{% if calibre.domain %}{{ calibre.domain }}{% else %}{{ calibre.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ calibre.subdomain + "." + tor_domain }}/](http://{{ calibre.subdomain + "." + tor_domain }}/)
{% endif %}
