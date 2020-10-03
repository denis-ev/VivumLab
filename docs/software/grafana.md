# Grafana

[Grafana](https://grafana.com/) is a Time Series Database graphing application.

The docker image comes from [grafana/grafana](https://hub.docker.com/r/grafana/grafana) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

You can use it to visualize the Weather data imported by [influxdb_darksky](software/influxdb_darksky),
power, activity, and other data from [Home Assistant](software/homeassistant), and general server
information via Telegraf.

Grafana comes configured with a Dashboard and Datasource connected for you out of the box. This default
dash and datasource will only with if you have the [TICK](software/tick) stack enabled.

You can login with the default user and pass you setup for VivumLab.

To reset the admin password run `docker exec -it grafana_grafana_1 grafana-cli admin reset-admin-password 12345`.

## Access

It is available at [https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](https://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/) or [http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/](http://{% if grafana.domain %}{{ grafana.domain }}{% else %}{{ grafana.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ grafana.subdomain + "." + tor_domain }}/](http://{{ grafana.subdomain + "." + tor_domain }}/)
{% endif %}
