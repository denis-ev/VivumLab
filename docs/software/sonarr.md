# Sonarr

[Sonarr](https://sonarr.tv/) Automated TV show downloading

## Configuration

You will need to configure an Indexer and a Download Client for Sonarr to work.

### Indexer: Jackett

The Download Client will be [Jackett](/software/jackett.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Sonarr, go to `Settings` then the `Indexers` tab, and click the Plus button.
Select the `Custom` button undernear `Torznab` and enter `Jackett` for the name, for the URL enter `http://jackett:9117/api/v2.0/indexers/all/results/torznab/` and for the API Key, enter the API key that Jackett displays on its Dashboard.

### Download client: Transmission

The Download Client will be [Transmission](/software/transmission.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Sonarr, go to the `Download Client` tab, toggle the `Advanced Settings` toggle in the top right to `Shown`, then click the Plus button, select `Transmission`.
In the form that popped up, enter `transmission` for host, `9091` for port, and your transmission username and password in their respective fields. Indicate the following value for the `Directory` field:

* `/data/complete/tv`

Click `Save` to close the modal window. Back in the `Advanced settings` screen, add a "**Remote Path Mappings**" with the following values:
* Host: `transmission`
* Local Path:  `/downloads`
* Remote Path: `/data/complete/tv`

## Usage

We recommend that you make sure you point Sonarr to `/tv`, when you add a TV show.

Now if you add some content to Sonarr, they will automatically be searched and downloaded according to your settings.

## Access

Sonarr available at [https://{% if sonarr.domain %}{{ sonarr.domain }}{% else %}{{ service_domain }}{% endif %}/

{% if enable_tor %}
It is also available via Tor at [http://{{ sonarr.subdomain + "." + tor_domain }}/](http://{{ sonarr.subdomain + "." + tor_domain }}/)
{% endif %}
