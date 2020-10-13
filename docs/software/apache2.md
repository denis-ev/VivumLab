# Apache 2

[Apache 2](https://httpd.apache.org/) is a free web server.

![tested](https://img.shields.io/badge/{{ if apache2.tested }}not_tested{{ else }}{{ apache2.tested }}{{ endif }}-None_Arm-{{ if apache2.tested }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if apache2.tested_arm }}not_tested{{ else }}{{ apache2.tested_arm }}{{ endif }}-Arm-{{ if apache2.tested_arm }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ apache2.version }}
{% endif %}

It is included with VivumLab to serve directory listings or static sites.

After enabling apache2 and running `make`, just place the files you want to
server in `{{ volumes_root }}/apache2/root/` on your server.

You can set the `apache2.subdomain` config setting to change the subdomain
from `apache2` to something else.

The docker image comes from [httpd:2.4](https://hub.docker.com/_/httpd) and should support arm devices.

## Access

It is available at [https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](https://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/) or [http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/](http://{% if apache2.domain %}{{ apache2.domain }}{% else %}{{ apache2.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ apache2.subdomain + "." + tor_domain }}/](http://{{ apache2.subdomain + "." + tor_domain }}/)
{% endif %}
