# DuckDNS

[DuckDNS](http://duckdns.org/) is free dynamic DNS hosted on AWS. This provides a client to update the IP pointed to by DuckDNS.

The docker image comes from [linuxserver/duckdns](https://hub.docker.com/r/linuxserver/duckdns) and should support arm devices.
If you attempt to run it on arm and encounter issues,
[please see issue 478](https://github.com/Vivumlab/VivumLab/-/issues/478)

## Access

This service does not provide an interface

## Configuration

By default this service is disabled. It can be enabled via ```make set duckdns.enable True```

Before enabling it create an account at http://duckdns.org/.
Set the token to the one available in the DuckDNS interface via ```make set duckdns.token $TOKEN```

The service will then update your IP every 5 minutes
