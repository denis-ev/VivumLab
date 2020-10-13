# Lazylibrarian

[Lazylibrarian](https://lazylibrarian.gitlab.io/) LazyLibrarian is a program to follow authors and grab metadata for all your digital reading needs.

![tested](https://img.shields.io/badge/{{ if lazylibrarian. }}not_tested{{ else }}{{ lazylibrarian.tested }}{{ endif }}-None_Arm-{{ if lazylibrarian. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if lazylibrarian. }}not_tested{{ else }}{{ lazylibrarian.tested_arm }}{{ endif }}-Arm-{{ if lazylibrarian. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ lazylibrarian.version }}
{% endif %}

## Access

It is available at [https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](https://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/) or [http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/](http://{% if lazylibrarian.domain %}{{ lazylibrarian.domain }}{% else %}{{ lazylibrarian.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ lazylibrarian.subdomain + "." + tor_domain }}/](http://{{ lazylibrarian.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
lazylibrarian:
  https_only: True
  auth: True
```
