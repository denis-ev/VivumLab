# Factorio

[Factorio](https://github.com/factoriotools/factorio-docker) Factorio headless server in a Docker container

![tested](https://img.shields.io/badge/{{ if factorio. }}not_tested{{ else }}{{ factorio.tested }}{{ endif }}-None_Arm-{{ if factorio. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if factorio. }}not_tested{{ else }}{{ factorio.tested_arm }}{{ endif }}-Arm-{{ if factorio. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ factorio.version }}
{% endif %}

The docker image comes from [factoriotools/factorio](https://hub.docker.com/r/factoriotools/factorio)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement and test your idea using the [documentation](dev/Adding-Services.md).

## Access

It is available at {{ domain }}. No subdomain needed since it works on exposed ports 34197 and 27015. A direct IP connection will also work.
