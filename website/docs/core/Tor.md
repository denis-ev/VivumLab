---
id: tor
title: Tor
hide_title: true
hide_table_of_contents: false
sidebar_label: Tor
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Tor

Tor is much more than privacy. Running a tor instance can fix some issues for you. Some such issues include:
* you don't have a domain
* issues with your DNS
* ports aren't mapped correctly somewhere in your network, and you can't access your services remotely

For more information on Tor, you can have a look [here](https://duckduckgo.com/?q=what+is+tor)

## Install Tor

Download Tor from the [Tor Project](https://www.torproject.org/) website, and follow their instructions.

## Web Access

Every service has the Tor URL, in its own documentation. VivumLab should deply your own copy of the software documentation. Try accessing them at 'docs.yourdomain'.

## SSH Access

SSH access via Tor is absolutely possible with [Torify](https://duckduckgo.com/?q=torify), and is typically bundled with the a 'Tor' installation,
To verify that you have 'Torify', and can connect to Tor with Torify, run `torify curl ifconfig.me`

Once that is verified, SSH (the normal way) into your server and append the following lines to your `~/.ssh/config` file:

```
Host *.onion
   ProxyCommand /usr/bin/nc -xlocalhost:9150 -X5 %h %p
```

Once that is done, you can ssh to your server with `torify ssh <your_ssh_user>@<your_tor_ssh_domain>`
