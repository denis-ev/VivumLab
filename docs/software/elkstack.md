# ELK Stack

[ELK Stack](https://github.com/deviantony/docker-elk) Elastic Search, Logstash and Kibana

The docker image comes from [sebp/elk](https://hub.docker.com/r/sebp/elk)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=elk&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://elkstack.{{ domain }}/](https://elkstack.{{ domain }}/) or [http://elkstack.{{ domain }}/](http://elkstack.{{ domain }}/)

{% if enable_tor %}
It is also available via Tor at [http://elkstack.{{ tor_domain }}/](http://elkstack.{{ tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

elkstack:
  https_only: True
  auth: True
