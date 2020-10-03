# Minio

Minio is an S3 storage utility.

## Configuration

Refer to the [Backup Guide](../core/Backup.md) for configuration details.

## Access

The dashboard is available at [https://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/](https://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/) or [http://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/](http://{% if minio.domain %}{{ minio.domain }}{% else %}{{ minio.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ minio.subdomain + "." + tor_domain }}/](http://{{ minio.subdomain + "." + tor_domain }}/)
{% endif %}
