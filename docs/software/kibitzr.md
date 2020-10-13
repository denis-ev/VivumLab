# Kibitzr

[Kibitzr](https://kibitzr.github.io/) acts as a replacement for IFTTT.

![tested](https://img.shields.io/badge/{{ if kibitzr. }}not_tested{{ else }}{{ kibitzr.tested }}{{ endif }}-None_Arm-{{ if kibitzr. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if kibitzr. }}not_tested{{ else }}{{ kibitzr.tested_arm }}{{ endif }}-Arm-{{ if kibitzr. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ kibitzr.version }}
{% endif %}

## Setup

Create your `kibitzr.yml` and `kibitzr-creds.yml` in `roles/vivumlab/files/`.
You can find examples on the [Kibitzr website](https://kibitzr.github.io/).
