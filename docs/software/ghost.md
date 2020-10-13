# Ghost

[Ghost](http://ghost.org/) is a fully open source, adaptable platform for building and running a modern online publication.

![tested](https://img.shields.io/badge/{{ if ghost.tested_text == "no" }}not_tested{{ else }}{{ ghost.tested_text }}{{ endif }}-None_Arm-{{ if ghost.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if ghost.tested_text_arm == "no" }}not_tested{{ else }}{{ ghost.tested_text_arm }}{{ endif }}-Arm-{{ if ghost.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ ghost.version }}
{% endif %}

The docker image comes from [ghost:3-alpine](ghost:3-alpine)
and currently **CAN** support arm devices but currently does not.

## Configuration

It is important to secure Ghost! Access the Ghost admin with [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/), and create an account.

## Access

The dashboard is available at [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/) or [http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ ghost.subdomain + "." + tor_domain }}/](http://{{ ghost.subdomain + "." + tor_domain }}/)
{% endif %}
