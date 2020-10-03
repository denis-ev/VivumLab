# Codeserver

[Codeserver](https://github.com/cdr/code-server) Run VS Code on a remote server.

The docker image comes from [codercom/code-server](https://hub.docker.com/r/codercom/code-server) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

It is available at [https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/) or [http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ codeserver.subdomain + "." + tor_domain }}/](http://{{ codeserver.subdomain + "." + tor_domain }}/)
{% endif %}
