# Chowdown

[Chowdown](https://hub.docker.com/r/gregyankovoy/chowdown)  Simple recipes in Markdown format

The docker image comes from [gregyankovoy/chowdown:latest](https://hub.docker.com/r/gregyankovoy/chowdown)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement,
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](https://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/) or [http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/](http://{% if chowdown.domain %}{{ chowdown.domain }}{% else %}{{ chowdown.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ chowdown.subdomain + "." + tor_domain }}/](http://{{ chowdown.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
chowdown:
  https_only: True
  auth: True
```
