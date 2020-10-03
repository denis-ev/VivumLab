# Guacamole

[Guacamole](https://guacamole.apache.org) is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.

The docker images come from multiple sources and currently does not support arm devices.
If you are aware of a suitable substitution or replacement,
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Access

It is available at [https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/guacamole](https://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/) or [http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/](http://{% if guacamole.domain %}{{ guacamole.domain }}{% else %}{{ guacamole.subdomain + "." + domain }}{% endif %}/guacamole)

{% if enable_tor %}
It is also available via Tor at [http://{{ guacamole.subdomain + "." + tor_domain }}/guacamole](http://{{ guacamole.subdomain + "." + tor_domain }}/guacamole)
{% endif %}

## Default user and password
Use "guacadmin" for both user and password when logging in initially.
