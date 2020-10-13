# DuckDNS

[DuckDNS](http://duckdns.org/) is free dynamic DNS hosted on AWS. This provides a client to update the IP pointed to by DuckDNS.

![tested](https://img.shields.io/badge/{{ if duckdns. }}not_tested{{ else }}{{ duckdns.tested }}{{ endif }}-None_Arm-{{ if duckdns. }}red{{ else }}informational{{ endif }}?style=flat)
![arm_tested](https://img.shields.io/badge/{{ if duckdns. }}not_tested{{ else }}{{ duckdns.tested_arm }}{{ endif }}-Arm-{{ if duckdns. }}red{{ else }}informational{{ endif }}?style=flat)

## Information

{% if tested %}
Current Version of the image is {{ duckdns.version }}
{% endif %}

The docker image comes from [linuxserver/duckdns](https://hub.docker.com/r/linuxserver/duckdns) and should support arm devices.

## Access

This service does not provide an interface

## Configuration

By default this service is disabled. It can be enabled via ```make set duckdns.enable True```

Before enabling it create an account at http://duckdns.org/.
Set the token to the one available in the DuckDNS interface via ```make set duckdns.token $TOKEN```

The service will then update your IP every 5 minutes
