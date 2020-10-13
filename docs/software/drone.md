# Drone

[Drone](https://drone.io) is a self-service continuous delivery platform

![tested](https://img.shields.io/badge/{{ if drone.tested_text == "no" }}not_tested{{ else }}{{ drone.tested_text }}{{ endif }}-None_Arm-{{ if drone.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if drone.tested_text_arm == "no" }}not_tested{{ else }}{{ drone.tested_text_arm }}{{ endif }}-Arm-{{ if drone.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ drone.version }}
{% endif %}

The docker image comes from [drone/drone:1.0](https://hub.docker.com/r/drone/drone) and should support arm devices.

## Access

It is available at [https://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/](https://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/) or [http://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/](http://{% if drone.domain %}{{ drone.domain }}{% else %}{{ drone.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ drone.subdomain + "." + tor_domain }}/](http://{{ drone.subdomain + "." + tor_domain }}/)
{% endif %}

## Enable Gitea

[Drone Docs Gitea](https://docs.drone.io/server/provider/gitea/)

`make set gitea_id {id}`
`make set gitea_secret {secret}`

## Build and Push Docker image

Use the official [Drone Documentation](https://docs.drone.io/) to Setup your Environment, if not using Gitea.

Example:
To build and push your own VivumLab Image migrate and sync the [official Repo](https://github.com/Vivumlab/VivumLab/) with Gitea.
Then activate it in Drone and create three secrets (repo, docker_username, docker_password).
Your own VivumLab Image will be build and published to Docker on the next commit.
