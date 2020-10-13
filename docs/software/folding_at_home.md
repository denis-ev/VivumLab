# Folding@home

[Folding@home](https://hub.docker.com/r/johnktims/folding-at-home) Folding@home software allows you to share your unused computer power with scientists researching diseases.

![tested](https://img.shields.io/badge/{{ if folding_at_home. }}not_tested{{ else }}{{ folding_at_home.tested }}{{ endif }}-None_Arm-{{ if folding_at_home. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if folding_at_home. }}not_tested{{ else }}{{ folding_at_home.tested_arm }}{{ endif }}-Arm-{{ if folding_at_home. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ folding_at_home.version }}
{% endif %}

The docker image comes from [johnktims/folding-at-home](https://hub.docker.com/r/johnktims/folding-at-home)
and currently does not support arm devices.
If you are aware of a suitable substitution or replacement ([good place to start](https://foldforcovid.io/#get-started)) and test your idea using the [documentation](../dev/Adding-Services.md).

## Install

make set folding_at_home.enable true
make

## Access

A dashboard is available at http://{{ vlab_ip }}:7396

## Settings

In `settings/config.yml` you can edit several settings included `power` which says how hard it will work.

The `team` setting defaults to the [VivumLab Folding@home team](https://stats.foldingathome.org/team/261443). Join us in the fight against disease!
