---
id: dockercache
title: Docker Registry Proxy
hide_title: true
hide_table_of_contents: false
sidebar_label: Docker Registry Proxy
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Docker Registry Proxy

[Docker Registry Proxy](https://github.com/rpardini/docker-registry-proxy) A caching proxy for Docker; allows centralised management of (multiple) registries and their authentication; caches images from any registry. Caches the potentially huge blob/layer requests (for bandwidth/time savings), and optionally caches manifest requests ("pulls") to avoid rate-limiting.

![amd64](https://img.shields.io/badge/{% if not dockercache.amd64 %}untested{% else %}{{ dockercache.amd64 }}{% endif %}-amd64-{% if not dockercache.amd64 %}inactive{% elif dockercache.amd64 == "verified" %}success{% elif dockercache.amd64 == "supported" %}informational{% elif dockercache.amd64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![arm64](https://img.shields.io/badge/{% if not dockercache.arm64 %}untested{% else %}{{ dockercache.arm64 }}{% endif %}-arm64-{% if not dockercache.arm64 %}inactive{% elif dockercache.arm64 == "verified" %}success{% elif dockercache.arm64 == "supported" %}informational{% elif dockercache.arm64 == "unsupported" %}critical{% endif %}?style=flat) <br />
![armv7](https://img.shields.io/badge/{% if not dockercache.armv7 %}untested{% else %}{{ dockercache.armv7 }}{% endif %}-armv7-{% if not dockercache.armv7 %}inactive{% elif dockercache.armv7 == "verified" %}success{% elif dockercache.armv7 == "supported" %}informational{% elif dockercache.armv7 == "unsupported" %}critical{% endif %}?style=flat) <br />

## Information


**Docker Image:** rpardini/docker-registry-proxy <br />
**Current Image Version:** {{ dockercache.version }}

## SETUP

### Enabling and customizing dockercache

#### Command:

**`vlab service setup -s dockercache`**

##### File alteration (not recommended):

- edit config via cli `vlab config edit_raw --dev`
- set the appropriate service settings in `settings/decrypted.yml` to true, after running `vlab config decrypt --dev`

eg.
```
dockercache
  enable: {{ dockercache.version }}
  version: {{ dockercache.version }}
```

#### Finalising changes:

run: **`vlab update -s dockercache`**

## FIRST RUN

### Get the CA certificate from the proxy and make it a trusted root.
curl http://127.0.0.1:3128/ca.crt > /usr/share/ca-certificates/docker_registry_proxy.crt
echo "docker_registry_proxy.crt" >> /etc/ca-certificates.conf
update-ca-certificates --fresh

### Reload systemd
systemctl daemon-reload

### Restart dockerd
systemctl restart docker.service

## ACCESS

dockercache (HTTPS) link: [https://{% if dockercache.domain %}{{ dockercache.domain }}{% else %}{{ dockercache.subdomain + "." + domain }}{% endif %}/](https://{% if dockercache.domain %}{{ dockercache.domain }}{% else %}{{ dockercache.subdomain + "." + domain }}{% endif %}/)
dockercache (HTTP) link: [http://{% if dockercache.domain %}{{ dockercache.domain }}{% else %}{{ dockercache.subdomain + "." + domain }}{% endif %}/](http://{% if dockercache.domain %}{{ dockercache.domain }}{% else %}{{ dockercache.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ dockercache.subdomain + "." + tor_domain }}/](http://{{ dockercache.subdomain + "." + tor_domain }}/)
{% endif %}

## Need more help?
Further information regarding services can be found. <br />
General Information can be found in the [documentation](https://vivumlab.com/docs). <br />
Additional assistance can be found on our [Contact Us](https://vivumlab.com/docs/contact) page.
