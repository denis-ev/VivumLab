---
id: tips
title: Developer Tips
hide_title: true
hide_table_of_contents: false
sidebar_label: Developer Tips
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Developer Tips

## Labels
`bug` - is for bugs. :)  <br />
`chore` - describes necessary, though possibly annoying changes  <br />
`cleanup` - cleaning or consolidating code  <br />
`documentation` - improvements or changes to documentation  <br />
`duplicate` - may be a duplicate/ may previously exist. The core team will review these, regularly <br />
`enhancement` - new feature or request; not necessarily relating to a service <br />
`future release` - this should only be used by the Core team <br />
`good first issue` - this should only be used by the Core team <br />
`help wanted` - use this if you are working on something and you need help. Want to contribute? look for this label <br />
`invalid` - this should only be used by the Core team <br />
`needs testing` - testing is required <br />
`priority` - fix ASAP!! all hands on deck. Confused on how to contribute? look for this label <br />
`question` - use this if further information is requuired <br />
`ready for review` - tells the Core team, that its ready for review <br />
`ready to merge` - tells the Core team, that its ready to be merged <br />
`security` - anything that helps make VivumLab more secure <br />
`service` - should only be placed on a service/ new service <br />
`WIP` - acronym for Work in progress. Use this if you are working on something but don't need help <br />

## Creating migrations

If something needs to change, create a migration by creating Ansible tasks to perform the migration. <br />
Then tag those tasks as with a `# MIGRATION vX.X` comment.

The next tagged release after the version in the comment, these tasks will be removed.

#### Example

Gitea had an incorrect path in it's docker-compose yml file. It was pointing the `/data` <br />
mount at `/var/lab/vivumlab/gitea` instead of `{{ volumes_root }}/gitea` where it should have been.

So two tasks were created, one to copy the folder to it's proper place, the next to make sure the <br />
old folder was absent. The first task will fail if the folder to be copied doesn't exist, which <br />
will be the case for new users, or users who have already ran the migration once. So `ignore_errors: <br />
true` is included.

```
# MIGRATION v0.5
- name: Migrate old folders if needed
  shell: mv /var/lab/vivumlab/gitea {{ volumes_root }}/gitea
  ignore_errors: true

# END MIGRATION
```

## Code/PR like a Boss
PRs are easy, follow these suggestions for a smooth experience: <br />
1. **Fork the right repo**: make sure you forked the *'dev'* branch
2. **Label the PR appropriately**:
  * Add the label *'needs testing'*, if the code requires testing that you are unable to perform yourself. This is common, and it is good to let others test and give feedback.
  * Add the label *'WIP'* if the code isn't quite finished (Work in Progress). This would be applicable if you had small (or large) amounts of code that is missing, doesn't work as expected, or maybe just isn't quite right. Use this label.
    * It is expected that if collaboration or suggestions are offered, they are received and handled well; *keep the community healthy*.
  * Add the label *'help wanted'*, if you want help with the PR. Everyone needs help at some point, so use the community; It's why we are here.
3. **Update the documentation**: If the code requires the user to interact differently with either VivumLab or the service, then educate them; irrespective of their technical skill level. *This is a REQUIREMENT, and will be ENFORCED*
4. **Make sure your code lints**: simply speaking, make your code neat and make sure it is formatted correctly.
5. **Issue the pull request**: As mentioned before, creating a corresponding issue assists with tracking changes and keeps the code focused. It is extremely rare that a PR is accepted without a corresponding issue.
6. **Use consistent coding style**: At times this will be unavoidable (eg. YAML files); irrespective of this, to ensure ease of updating and future contribution of code from other community members. it is expected that:
* any contributed code: <br />
  * employs a responsible use of whitespace <br />
  * is appropriately commented <br />
* Names (of variables, functions etc.): <br />
  * should be formatted appropriately <br />
  * mindfully designed <br />
  * relevant to VivumLab, and its pre-existing codebase

## Pre-commit
Pre-commit assists the developer in producing readable, auditable code. See the following quote from the developers of pre-commit

##### Quote from Pre-Commit
> Git hook scripts are useful for identifying simple issues before submission to code review. We run our hooks on every commit to automatically point out issues in code such as missing semicolons, trailing whitespace, and debug statements. By pointing these issues out before code review, this allows a code reviewer to focus on the architecture of a change while not wasting time with trivial style nitpicks.

### Installing Pre-commit

Before you can run hooks, you need to have the pre-commit package manager installed.

Using pip: <br />
**`pip install pre-commit`**

Using [homebrew](https://brew.sh/): <br />
**`brew install pre-commit`**

#### Set up the git hook scripts.
From the VivumLab root folder (where you run the **`vlab`** commands from), run: <br />
**`pre-commit install`**

Run against all the files (optional) <br />
**`pre-commit run --all-files`**

## Supporting multiple architectures
Some, if not most, docker images will support more than the typical 64 bit architecture; this is very relevant, and very welcome in VivumLab. With the growing popularity of more compact hardware, such as the Raspberry PI, using VivumLab with this cost effective, and compact option is obvious and desirable for users.

You may notice that in the config.yml file, there are three options, relating to three different architectures, for almost every service;

example:
```
 amd64: False
 arm64: False
 armv7: False
```
These exist, as to tell the user which architecture the service is supported on. AMD64 may be relevant to the standard home server install of Debian or CentOS, ARM64 for older 64 bit versions of Raspberry PI (former known as Raspbian), and ARMv7 for the newer versions (possibly known as Raspberry PI OS).
For example, if the current image for Jellyfin supports ARMv7, but you have only tested AMD64 (and it works), then make the following changes to the config.yml file:
```
jellyfin:
  ('enable' <-> 'version' options here, as usual)
  amd64: Verfied
  arm64: Unsupported
  armv7: Supported
```
If an architecture is not supported, either 'Unsupported' or 'False' can be used.

As a developer, when you add a service or otherwise verify a service, make sure you edit the config.yml file, and add the relevent information, before pushing your changes to Github.
