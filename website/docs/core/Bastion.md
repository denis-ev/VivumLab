---
id: bastion
title: Cloud Bastion Server
hide_title: true
hide_table_of_contents: false
sidebar_label: Cloud Bastion Server
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Cloud Bastion Server

VivumLab can optionally configure a cloud based bastion server, which will route
traffic to your VivumLab instance without needing to forward ports on your home router.

This is desirable for three reasons.

1. Less configuration - No need to configure your routers or firewalls, no port forwarding to mess with.
2. Enhanced security - Your home IP address will not be exposed to the internet via DNS
3. Email - Most ISPs block the ports necessary for email, this circumvents that

## Setup

First you need a cloud server through a provider such as AWS or Digital Ocean.

You can use the [VivumLab Terraform feature](terraform), or set it up manually.

Set any `bastion` config values to their correct settings.

Run **`vlab deploy`** as usual, and VivumLab will take care of everything else.

Now point your domain name ('A' record) to your cloud server's IP address rather than your home IP address.

## Access

You can SSH port 22 on your cloud server to access the cloud server itself. Or you can
SSH to port 2222 and you will be accessing the home server directly.

## sshuttle

You can also use [sshuttle](https://github.com/sshuttle/sshuttle) to access your server via a VPN. Install sshuttle on your client then run **`sshuttle -r USER@CLOUD_SERVER_DOMAIN 0/0`**

You can now ssh directly to 10.0.0.1 or visit http://10.0.0.1:8181 with a browser to access the Traefik dashboard for example.
