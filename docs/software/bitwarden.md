# Bitwarden

[Bitwarden](https://bitwarden.com/) is an open source password manager. VivumLab utilizes an Open Source clone of the Bitwarden API server, [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs). This is primarily due to performance and complexity reasons. `bitwarden_rs` requires just one Docker container, whereas the official `Bitwarden` install requires something like six different containers.

The docker image comes from [bitwardenrs/server:latest](https://hub.docker.com/r/bitwardenrs/server)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://hub.docker.com/search?q=bitwarden&type=image&architecture=arm%2Carm64)),
 [please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)
and test your idea using the [documentation](https://vivumlab.com/development/adding_services/).

## Security Note

Password managers like Bitwarden should only be used over HTTPS. Ensure you have valid certificates in place before beginning to use this service. You have been warned. :)

## Access

It is available at [https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](https://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/) or [http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/](http://{% if bitwarden.domain %}{{ bitwarden.domain }}{% else %}{{ bitwarden.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ bitwarden.subdomain + "." + tor_domain }}/](http://{{ bitwarden.subdomain + "." + tor_domain }}/)
{% endif %}
