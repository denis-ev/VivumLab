# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) Barcode system for Grocy

![tested](https://img.shields.io/badge/{{ if barcodebuddy.tested_text == "no" }}not_tested{{ else }}{{ barcodebuddy.tested_text }}{{ endif }}-None_Arm-{{ if barcodebuddy.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if barcodebuddy.tested_text_arm == "no" }}not_tested{{ else }}{{ barcodebuddy.tested_text_arm }}{{ endif }}-Arm-{{ if barcodebuddy.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ barcodebuddy.version }}
{% endif %}

The docker image comes from [f0rc3/barcodebuddy-docker](https://hub.docker.com/r/f0rc3/barcodebuddy-docker) and should support arm devices.

## Access

It is available at [https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](https://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/) or [http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/](http://{% if barcodebuddy.domain %}{{ barcodebuddy.domain }}{% else %}{{ barcodebuddy.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ barcodebuddy.subdomain + "." + tor_domain }}/](http://{{ barcodebuddy.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only, auth, and image\_tag

To enable https_only or auth set the service config to True
`settings/config.yml`

If you want to specifiy an image tag, set `image_tag` to specified tag.
Available tag at [https://hub.docker.com/r/f0rc3/barcodebuddy-docker/tags](https://hub.docker.com/r/f0rc3/barcodebuddy-docker/tags)

```
barcodebuddy:
  https_only: True
  auth: True
  image_tag: latest
```
