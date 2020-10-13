# Darksky

[darksky-influxdb](https://github.com/ErwinSteffens/darksky-influxdb) pulls in weather data for your location every 2 minutes from [Darksky](http://darksky.net/) and saves it to your [InfluxDB](software/influxdb) instance.

![tested](https://img.shields.io/badge/{{ if dark_sky. }}not_tested{{ else }}{{ dark_sky.tested }}{{ endif }}-None_Arm-{{ if dark_sky. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if dark_sky. }}not_tested{{ else }}{{ dark_sky.tested_arm }}{{ endif }}-Arm-{{ if dark_sky. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ dark_sky.version }}
{% endif %}

You need to get an API key first from [Darksky](http://darksky.net/dev/)

The docker image comes from [erwinsteffens/darksky-influxdb:latest](https://hub.docker.com/r/erwinsteffens/darksky-influxdb)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=darksky&type=image&architecture=arm%2Carm64)) and test your idea using the [documentation](dev/Adding-Services.md).

## Access

There is no direct access to it, but you can create graphs via [Grafana](software/grafana) to visualize it.
