# Radarr

[Radarr](https://radarr.video/) (Automated movie downloading

## Configuration

To make Radarr work, you need to configure an Indexer and a Download Client.

### Indexer: Jackett

The Download Client will be [Jackett](/software/jackett.md), you should make sure that you have it installed and configured to follow these instructions.
Then, in Radarr, go to `Settings` then the `Indexers` tab, and click the Plus button.
Select the `Custom` button undernear `Torznab` and enter `Jackett` for the name, for the URL enter `http://jackett:9117/api/v2.0/indexers/all/results/torznab/` and for the API Key, enter the API key that Jackett displays on its Dashboard.

### Download client: Transmission

The Download Client will be [Transmission](/software/transmission.md), you should make sure
that you have it installed and configured to follow these instructions.
Then, in Radarr, go to the `Download Client` tab, toggle the `Advanced Settings` toggle in the top right to `Shown`, then click the Plus button,
select `Transmission`.
In the form that popped up, enter `transmission` for host, `9091` for port, and your transmission username and password in their respective fields.

Indicate the following value for the `Directory` field:
* `/data/complete/movies`

Click `Save` to close the modal window. Back in the `Advanced settings` screen,
add a "**Remote Path Mappings**" with the following values:
* Host: `transmission`
* Local Path:  `/downloads`
* (Radarr) Remote Path: `/data/complete/movies`

## Usage

We recommend that you make sure you point Radarr to `/movies`when you add a movie.

Now if you add some content, either a movie to Radarr, they will automatically be searched and downloaded according to your settings.

## Access
Radarr available at [https://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/](https://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/) or [http://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/](http://{% if radarr.domain %}{{ radarr.domain }}{% else %}{{ radarr.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
It is also available via Tor at [http://{{ radarr.subdomain + "." + tor_domain }}/](http://{{ radarr.subdomain + "." + tor_domain }}/)
{% endif %}
