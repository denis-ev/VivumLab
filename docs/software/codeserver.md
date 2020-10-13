# Codeserver

[Codeserver](https://github.com/cdr/code-server) Run VS Code on a remote server.

![tested](https://img.shields.io/badge/{{ if codeserver.tested }}not_tested{{ else }}{{ codeserver.tested }}{{ endif }}-None_Arm-{{ if codeserver.tested }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if codeserver.tested_arm }}not_tested{{ else }}{{ codeserver.tested_arm }}{{ endif }}-Arm-{{ if codeserver. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ codeserver.version }}
{% endif %}

The docker image comes from [codercom/code-server](https://hub.docker.com/r/codercom/code-server) and should support arm devices.

## Access

It is available at [https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](https://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/) or [http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/](http://{% if codeserver.domain %}{{ codeserver.domain }}{% else %}{{ codeserver.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ codeserver.subdomain + "." + tor_domain }}/](http://{{ codeserver.subdomain + "." + tor_domain }}/)
{% endif %}
