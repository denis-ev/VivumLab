# matterbridge

[matterbridge](https://github.com/42wim/matterbridge) A program that allows users to link multiple chat platforms.

![tested](https://img.shields.io/badge/{{ if matterbridge.tested_text == "no" }}not_tested{{ else }}{{ matterbridge.tested_text }}{{ endif }}-None_Arm-{{ if matterbridge.tested_text == "no" }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if matterbridge.tested_text_arm == "no" }}not_tested{{ else }}{{ matterbridge.tested_text_arm }}{{ endif }}-Arm-{{ if matterbridge.tested_text_arm == "no" }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ matterbridge.version }}
{% endif %}

## Access

Edit the matterbridge.toml file according to the instructions at:
[Matterbridge how-to](https://github.com/42wim/matterbridge/wiki/How-to-create-your-config)
