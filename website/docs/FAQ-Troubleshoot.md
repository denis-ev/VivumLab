---
id: faq
title: FAQ / Troubleshoot
hide_title: true
hide_table_of_contents: false
sidebar_label: FAQ / Troubleshoot
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Troubleshooting / FAQ

This is the Frequently Asked Questions section.

Navigate it quickly by using the Table of Contents or the search bar; searching is easy, and makes you look cool.. Just saying.

> Note: VivumLab does assume some prior knowledge on behalf of the user, if you do not have this knowledge using VivumLab will not be impossible but you may find it hard to troubleshoot any issues you may have.

We assume you know or understand the basics of:
1. your server operating system (where VivumLab will store your services)
2. your client operating system (the computer that you use VivumLab from)
3. Access via SSH
4. Pointing your domain ('A' record) to the required IP address

## FAQs

### Does VivumLab cost anything?

No, and as long as it remains open source, it never will. If you paid money for this service, get your money back.

### Why did we fork HomeLabOS?
HomeLabOS is a great project, and while we are very similar, we differ in some core values and (general) project direction. VivumLab is an alternative to HomeLabOS, not a replacement; We would like to suggest that you test both projects and see which one suits you; everyone is different and deserves the freedom to choose. If you decide to stick with VivumLab, then Welcome to the community; lets do some amazing things together.

### VivumLab and Open Source
We just want to start by saying open source is very important, a free (as in freedom) internet, is something worth protecting. That being said, you may have noticed that some of the services we provide are open source, and some are not; while VivumLab advocates for and prefers open source projects, we undestand that sometimes a closed source project is required or desired by the user. The least we can do is keep VivumLab open source and free for further generations to come.

### VivumLab and supported software
VivumLab supports deploying to Debian and CentOS based systems; since RaspberryPI OS is based on Debian, VivumLab should work. While it is theortically possible to deploy to other systems with some code changes, supporting niche or closed source systems are not a great priority for VivumLab. Changes to support such systems are welcome, should a developer wish to provide the code and support for the system.

Currently, VivumLab can be run from a Linux PC or a Macintosh PC: VivumLab currently does not officially support Windows. For the more tech savvy users, it is possible to run VivumLab on a windows machine using [Windows Subsystem for Linux](https://duckduckgo.com/?q=windows+subsystem+for+linux). However support is not official, and it is beyond the scope of this document to provide instructions; as such, your results may vary.

## Troubleshooting - Access/ Web

### I have pointed my domain at my IP but accessing the domain returns nothing

* If you [ping](https://duckduckgo.com/?q=how+to+ping+a+domain+from+my+OS) your domain, do you get the [IP](https://duckduckgo.com/?q=whats+my+ip) you expect?
    * If not you have [DNS issues](core/installation/#dns-settings). Get those resolved before moving on.
* If you ping your subdomain, do you get the IP you expect?
    * If not you have [DNS issues](core/installation/#dns-settings). You probably don't have a wildcard set up.
    * If you're still having issues with your domain, contact your domain registrar (whom you purchased your domain from); there is a good chance that they have their own documentation regarding this.
* Does the IP you expect actually lead to port 80 on your server?
    * You may need to set up port forwarding on your router, unblock some ports on your modem, or contact your ISP to see if they are being blocked. If these aren't an option for you, try the [bastion host](core/bastion) set up.
* Does the domain you're trying to access match what is listed in the Traefik dashboard?
    * If you don't see your domain under the 'HTTP' section in Traefik, then you have something configured wrong.
* Are your services running?
    * Check **`docker ps`** and **`systemctl status SERVICENAME`** on the server.
        * E.g. **`systemctl status jellyfin`**
* Are your services listed in the Traefik dashboard?
    * Check http://{{ vlab_ip }}:8181/

If you have followed these instructions and you are STILL having issues, ask in the VivumLab [Zulip chat](https://vivumlab.zulipchat.com/) or open an issue on [Github](https://github.com/Vivumlab/VivumLab/issues).
    !!! Note: The documentation for VivumLab represents hours of work by the developers. Do not be offended if you ask a question, and are redirected back to the documentation. It is entirely for your own benefit; no one elses'.

### I get a 404

If you're up and running, but accessing the server returns a 404, check the Traefik [dashboard](http://{{ vlab_ip }}:8181/).

Each service under the `Http` page has a section. The hostname inside `Host()` in the rule column is the hostname that Traefik is listening to for that particular service. You need to be able to [ping](https://duckduckgo.com/?q=how+to+ping+a+domain+from+my+OS) that hostname from your computer, and you should get back the IP address of your server. Once that is the case, accessing the domain name in a browser should load the respective service.

Traefik serves based on domain names, not IP addresses. It has to know what service you want to return. You need to be able to access the domain name in order for Traefik to serve the correct service.

### No Traefik Dashboard

If you can't even access the dashboard at http://{{ vlab_ip }}:8181, check the status of the VivumLab service to give you some insight into what the issue is.
e.g:
>**`systemctl status vivumlab`**

or:
>**`docker ps | grep traefik`**

which should provide similar output to this:
>8f00f6b3cdb6        traefik                        "/traefik"               13 hours ago        Up 13 hours                     0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:8181->8080/tcp           vivumlab_traefik_1

If there is no obvious issue, contact the community on [Zulip](https://vivumlab.zulipchat.com)

### Services Not Appearing in Traefik, Bad Gateway, or Services Restarting

If you don't see the services listed in the Traefik dash, or if Traefik returns a page that just says `Bad Gateway`, that usually means DNS and everything is correct, but the service itself is having problems.
SSH into the server and run **`systemctl status SERVICE_NAME`**
>e.g: **`systemctl status jellyfin`**

This should show you any Docker logs relevant to that service. In the case of a service running multiple containers, you may want more detail from a specific container.
Find the container name with **`docker ps | grep SERVICENAME`** then access the logs with **`docker logs -f --tail 500 CONTAINERNAME`**.
>E.g: **`docker ps | grep jellyfin`**
and: **`docker logs -f --tail 500 jellyfin_jellyfin_1`**

### SSL Not working

Traefik generates SSL certs via LetsEncrypt, and LetsEncrypt has rate limiting. So it may take several days before all of your services get valid SSL certs generated for them.
You can tail the logs of the traefik container (as mentioned previously) to see the status of its generation.

## Troubleshooting - Server/ config

### `vlab` command throws a docker related error

1. Make sure VivumLab successfully installed docker on the server. If its not installed, try installing it manually.

2. Make sure you are running the latest docker and docker compose on both your client and server. The versions installed via your Operating Systems' package manager may be outdated; [here](https://docs.docker.com/get-docker/) is some information to help you get started. *VivumLab may attempt to do this for you, in a future release.*

3. Check VivumLab status on the server and make sure it is loaded and active.
>e.g: **`systemctl status vivumlab`**

4. Make sure the admin user specified during `vlab config` is created.
>e.g: **`compgen -u`**

5. If the user isn't listed, run the following commands (on the server) to make one and add it to the sudo and docker groups.
>**`sudo adduser <username>`**
**`sudo usermod -aG sudo <username>`**
**`sudo usermod -aG docker <username>`**

### What config values are available, and what do they do?

#### HTTPS_ONLY

Stops the specified service from serving any access over an unsecure (HTTP) connection.

Most services deployed with VivumLab will redirect wherever possible, to a secure (HTTPS) connection without any intervention from the user.
As such, this option is available only for unique cases. Most users will never have to use this.

#### AUTH

Allows third party services to assume control of authentication for a specified service.

Some, if not most services deployed with VivumLab, make use of their own authentication system to protect the information stored therein; you may need to enter a username/email and password to access it. This option allows Authelia to control authentication for services that otherwise may not have any.

For example, the dashboard used for VivumLab is called SUI, and typical does not have authentication. Setting auth to True, allows SUI to be protected.
This is completely optional, but available if you want it.

#### DOMAIN

Sets a different, custom domain.

All services (by default) are served on `servicename.domain.tld`; assuming that you are serving VivumLab services on the domain 'magicfinger.com', and you were deploying the awesome open source media center 'Jellyfin', the default URL would look like this: `jellyfin.magicfinger.com`.

The 'domain' option for Jellyfin can be changed if the user desires Jellyfin to be served on another domain, eg. magictoe.com. VivumLab allows the change of the sitename, but no subdomains (future releases may support this). In this example, once the domain option is changed Jellyfin will be served on `magictoe.com` not `jellyfin.magictoe.com`.

The domain option is also useful if the user wants a specific service served on the top level domain, and not on it's default subdomain. Using the same example, if the domain option is set to `magicfinger.com`, Jellyfin will be served on `magicfinger.com`, instead of the default `jellyfin.magicfinger.com`

#### SUBDOMAIN

Sets a different, custom subdomain.

Similarly to the domain option, the subdomain option allows the user to customise the subdomain for their service. Unlike the domain, it is simple, not complex. The subdomain option defaults to the servicename; using the previous example, the default subdomain is `jellyfin`, making the default URL `jellyfin.magicfinger.com`.

Changing the subdomain option to `media` would allow jellyfin to be reached on `media.magicfinger.com` instead.


#### VERSION

Sets the image version of the docker image used.

VivumLab acknowledges that some versions of specific softwares may be more desirable than others; this option allows the user to specify another version. Please note that the default value is the version that VivumLab has been tested with, and has shown to work the best at the time of testing. if the user decides to change the version, VivumLab can not guarantee that the adjusted version will work.

### I can't find certain config values like Authelia

Check your `config/vault.yml` file. If it's encrypted just run `vlab decrypt`, and attempt to access it again.

### Is it OK to manually edit my `settings/` files?

Yes, but note that isn't specifically necessary to edit the `config/` files directly, or worry about where the config values are.
Use of **`vlab get`** will access the variable correctly regardless of which config file it lives in.
>eg. **`vlab get jellyfin.domain`**

Use of **`vlab set`** will set the variable correctly,regardless of which config file
>eg. **`vlab set jellyfin.domain=magicfinger.com`**

### I get a exec user process caused 'exec format' error

You may be trying to run AMD code on ARM infrastructure.
Make sure you have set `arm` to True. e.g: **`vlab get arm`**

You can set it with **`vlab set arm=True`**,
or you can edit your config file.

e.g:
># Set this to true if you are deploying to an ARM infrastructure, such as a Raspberry Pi.
arm: True


### How do I tell if a service is enabled?

On your server, run **`systemctl status servicename`**, as root, or
**`sudo systemctl status servicename`** as another user.
E.g:
>**`systemctl status jellyfin`**

### I get `Unit servicename.service could not be found.`

The service was not deployed.
Enable the desired service. eg. **`vlab set jellyfin enable=True`**
Alternatively, edit your `settings/` files, and set `enable` to true for the respective service. e.g:

>jellyfin:
  enable: True


### If I don't have a domain, what do I enter for the domain field?

You can use Vivumlab fully inside your network, without an external domain. Simply make up a domain that ends in `.local` and enter that as your domain in `host_vars/myserver`, for example `myvivumlab.local` will work just fine, but there are some small changes that you will need to make.

VivumLab will generate a file called `vivumlab_hosts`on the server, located in the VivumLab root folder; You can use the entries in this file to add to your computer's hosts override file (`/etc/hosts` on *nix based OS'), or to map on your router or DNS server as DNS overrides.

Ultimately, if you used the example fake domain given above and you enabled the Jellyfin service, you can access it at `jellyfin.myvivumlab.local` once you have your DNS overrides set up.

### Can I use a 32 bit OS?

Yes, but you shouldn't. A quick Google search will return some options for you; however VivumLab does not officially support it.

Older version of Raspberry Pi OS (previously Raspbian) are 32 bit and in theory it is possible to use this OS; but again, VivumLab does not officially support it.
