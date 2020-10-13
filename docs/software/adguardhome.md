# AdGuard Home

[AdGuard Home](https://adguard.com/en/adguard-home/overview.html) Network-wide software for blocking ads and tracking.

![tested](https://img.shields.io/badge/{{ if adguardhome.tested }}not_tested{{ else }}{{ adguardhome.tested }}{{ endif }}-None_Arm-{{ if adguardhome.tested }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if adguardhome.tested_arm }}not_tested{{ else }}{{ adguardhome.tested_arm }}{{ endif }}-Arm-{{ if adguardhome.tested_arm }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ adguardhome.version }}
{% endif %}

## Access

It is available at [https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](https://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/) or [http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/](http://{% if adguardhome.domain %}{{ adguardhome.domain }}{% else %}{{ adguardhome.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ adguardhome.subdomain + "." + tor_domain }}/](http://{{ adguardhome.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
adguardhome:
  https_only: True
  auth: True
```
