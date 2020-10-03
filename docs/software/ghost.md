# Ghost

[Ghost](http://ghost.org/) is a fully open source, adaptable platform for building and running a modern online publication.

The docker image comes from [ghost:3-alpine](ghost:3-alpine)
and currently **CAN** support arm devices but currently does not. [Please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478) .

## Configuration

It is important to secure Ghost! Access the Ghost admin with [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/ghost/), and create an account.

## Access

The dashboard is available at [https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](https://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/) or [http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/](http://{% if ghost.domain %}{{ ghost.domain }}{% else %}{{ ghost.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ ghost.subdomain + "." + tor_domain }}/](http://{{ ghost.subdomain + "." + tor_domain }}/)
{% endif %}
