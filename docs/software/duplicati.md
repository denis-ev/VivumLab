# Duplicati

[Duplicati](https://www.duplicati.com/) Free backup software to store encrypted backups online
For Windows, macOS and Linux.

The docker image comes from [linuxserver/duplicati](https://hub.docker.com/r/linuxserver/duplicati) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

> Note: The password for Duplicati is configured to use the `default_password` set during the initail `make config` (which is then subsequently stored in vault.yml)

It is available at [https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](https://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/) or [http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/](http://{% if duplicati.domain %}{{ duplicati.domain }}{% else %}{{ duplicati.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ duplicati.subdomain + "." + tor_domain }}/](http://{{ duplicati.subdomain + "." + tor_domain }}/)
{% endif %}
