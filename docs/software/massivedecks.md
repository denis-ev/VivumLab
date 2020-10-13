# MassiveDecks

[MassiveDecks](https://github.com/Lattyware/massivedecks/blob/master/README.md) Massive Decks is a comedy party game based on Cards against Humanity. Play with friends! It works great with a bunch of people in the same room on phones, or on voice chat online.

![tested](https://img.shields.io/badge/{{ if massivedecks.tested_text == "no" }}not_tested{{ else }}{{ massivedecks.tested_text }}{{ endif }}-None_Arm-{{ if massivedecks.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if massivedecks.tested_text_arm == "no" }}not_tested{{ else }}{{ massivedecks.tested_text_arm }}{{ endif }}-Arm-{{ if massivedecks.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ massivedecks.version }}
{% endif %}

## Access

It is available at [https://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/](https://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/) or [http://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/](http://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ massivedecks.subdomain + "." + tor_domain }}/](http://{{ massivedecks.subdomain + "." + tor_domain }}/)
{% endif %}

## Security enable/disable https_only and auth

To enable https_only or auth set the service config to True
`settings/config.yml`

```
massivedecks:
  https_only: True
  auth: True
```
