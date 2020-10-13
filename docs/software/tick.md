# TICK

Enabling the TICK stack enables Telegraf, [InfluxDB](https://www.influxdata.com/time-series-platform/influxdb/), Chronograf, and Kapacitor.

[InfluxDB](https://www.influxdata.com/time-series-platform/influxdb/) is the Time Series Database that [Darksky](software/darksky) writes to and [Grafana](software/grafana) can visualize.

It can also take data from [Home Assistant](software/homeassistant) and many other sources.

## Access

For security reasons Chronograf is not exposed as a service with Traefik, as it has no authentication. It is served on port 8888.
