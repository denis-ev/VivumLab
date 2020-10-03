# EtherCalc

[EtherCalc](https://ethercalc.net) EtherCalc is a web spreadsheet

The docker image comes from [audreyt/ethercalc](https://hub.docker.com/search?q=audreyt%2Fethercalc&type=image)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement,
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/](https://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/) or [http://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/](http://{% if ethercalc.domain %}{{ ethercalc.domain }}{% else %}{{ ethercalc.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ ethercalc.subdomain + "." + tor_domain }}/](http://{{ ethercalc.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
ethercalc:
  https_only: True
  auth: True
```
