---
id: adding-services
title: Adding Services
hide_title: true
hide_table_of_contents: false
sidebar_label: Adding Services
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Before you begin

Before you begin, please familiarize yourself with the [Contribution Guidelines](/CONTRIBUTING.md).

# Using the add_package Task to add services to VivumLab

## What does the script do?

The add_package script, the creation of new service files.

## Before you run the task

You'll need three pieces of information:

- Package Name in Title case: This is used whenever we need a Title for the package.
  - eg. *Jellyfin*, not *jellyfin* or *JELLYFIN*
- The URL for the package: Used in documentation files to link to package website or source.
  - eg. https://jellyfin.org/ or https://github.com/jellyfin/jellyfin
- A one-line description of the package: Used in documention, etc.
  - eg. *The Free Software Media System*, or *An open source media system, forked from Emby*

When you have entered those three pieces of information, The script then does the following for you:

- Creates an issue on Gitlab.
- Creates a branch for, and tied to the issue.
- Creates an (empty) Merge Request, that resolves the issue.
- Fetches the new branch, and checks it out.
- Creates the Service Role Directory
  - Edits the role/PACKAGENAME/tasks/main.yml
- Creates the Documentation file
- Edits mkdocs.yml to include the new documentation file
- Edits the Readme, and Changelog files
- Edits the group_var/all file to include the new package in the Enabled Services list

## Running the script

From the root project directory run:
`vlab add_package` and answer the 3 questions.
Once the script has run, you must edit the `roles/PACKAGENAME/templates/docker-compose.PACKAGENAME.yml.j2` file.
  - eg. *roles/jellyfin/templates/docker-compose.jellyfin.yml.j2*

_Please review all other files, before pushing your changes to gitlab._

# How to Manually Add Services to Vivumlab

## Create Role Folder

Copy an existing role folder like 'inventario' from the `roles/` folder,
then adapt the values as needed.

### Use hardcoded volume paths

All mounted docker volumes should point to a folder named after the service that is using it, and located under `{{ volumes_root }}`.

## Add Service to Documentation

### Create a Documentation Page

Each service should have it's own page within the `docs/software/` folder.
Use existing docs as a template.

### Link to Documentation Page

Update the `mkdocs.yml` file with a reference to the newly created doc file.

## Add Service to Inventory File

The service needs to be added within
`group_vars/all`.

Place it in the `services:` section in alphabetical order.

## Add Service to README

The service should be added under the list of `Available Software`.

## Add Service to `config.yml.j2`

In the config template `roles/vivumlab_config/templates/config.yml.j2` the
service should be added in alphabetical order under the `# Services List` section.

# How to Debug a New Service

After a new service has been deployed, run `systemctl status SERVICE_NAME` to see
how it's doing.
  - eg. systemctl status jellyfin

If it's not running with an error like `(code=exited, status=1/FAILURE)`

Grab the value of the ExecStart line, and run it by hand. So if the ExecStart line looks like:
`ExecStart=/usr/bin/docker-compose up`
then manually change directory `cd {{ volumes_root }}/zulip` and run the bit after the =, `/usr/bin/docker-compose zulip up` to see the error output directly.
