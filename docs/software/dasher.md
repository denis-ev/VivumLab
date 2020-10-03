# Dasher

[Dasher](https://github.com/maddox/dasher) provides support for triggering things when you press one of those free Amazon Dash buttons.

Follow [the directions on how to find your Dash button's MAC address](https://github.com/maddox/dasher#find-dash-button). Then plug that MAC address into `roles/vivumlab/templates/dasher.config.json`. Edit the URL, headers and body as needed for your use case. The default example shown causes [Home Assistant](/software/homeassistant) to toggle the Living Room lights.

The docker image comes from [hijinx/dasher](https://hub.docker.com/r/hijinx/dasher)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=dasher&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

No direct access, but like all the images you can tail the logs in [Portainer](/software/portainer)
