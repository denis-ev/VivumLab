# Darksky

[darksky-influxdb](https://github.com/ErwinSteffens/darksky-influxdb) pulls in weather data for your location every 2 minutes from [Darksky](http://darksky.net/) and saves it to your [InfluxDB](/software/influxdb) instance.

You need to get an API key first from [Darksky](http://darksky.net/dev/)

The docker image comes from [erwinsteffens/darksky-influxdb:latest](https://hub.docker.com/r/erwinsteffens/darksky-influxdb)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=darksky&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

There is no direct access to it, but you can create graphs in [Grafana](/software/grafana) to visualize it.
