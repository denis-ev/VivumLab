# CodiMD

[CodiMD](https://demo.codimd.org/) The best platform to write and share markdown

The docker image comes from [quay.io/codimd/server:latest](https://quay.io/repository/codimd/server?tag=latest&tab=tags)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=codimd&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://codimd.{{ domain }}/](https://codimd.{{ domain }}/) or [http://codimd.{{ domain }}/](http://codimd.{{ domain }}/)

{% if enable_tor %}
It is also available via Tor at [http://codimd.{{ tor_domain }}/](http://codimd.{{ tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

codimd:
  https_only: True
  auth: True
