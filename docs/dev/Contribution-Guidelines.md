# Contributing to VivumLab

## Open source, VivumLab and You
VivumLab recognises that an open source project is only as strong as its community. For this reason we want to make contributing to this project as easy and transparent as possible, whether it is:

* Reporting a Bug
* Discussing the current state of the code
* Submitting a fix
* Proposing new features
* Testing (security or otherwise)
* Design (graphic, web or otherwise)
* Investing yourself, and becoming a recognised contributor

## VivumLab and GitHub
We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## Development Workflow Overview
VivumLab follows a common FOSS development workflow. A core group of maintainers handle the branching, merging and tagging of releases. While this core group shepherds the overall project, everyone is welcome to contribute. This document goes into detail on how you can contribute.

## Issues
Report bugs, offer suggestions, make requests, all by opening a new issue; it's that easy!
Here are some guidelines to make your issue submissions better for the community.

!!! NOTE: No change happens without a prefacing issue, simple.

### Detail
Write issues with detail, background information, and sample code if applicable.
Keep background information relevant to the issue, and do not share personal information.
Gather feedback from the community; have patience, wait a day or two before beginning work

### Bug Reports
Bug reports are a staple of software development. When submitting a bug report, make sure to include (where applicable):
* a quick summary and/or background information
* steps to reproduce (be specific)
* what you expected to happen
* what actually happens
* if appropriate, try to include:
  * sample code
  * installed software (include versions)
  * options you tried (but didn't work)

### Third Party Softwares
VivumLab acknowledges that sometimes bugs are not the fault of VivumLab code but rather the fault of the software used to make VivumLab possible. This is not a reason to debate or fault:
* persons
* companies
* communities

Instead, find a workaround and suggest it to the community. VivumLab may also be able to assist other users in automating your suggested workaround; pretty cool, right?

## Pull Requests
Pull requests, or PRs are the best way to propose changes to the codebase, though all PRs will need to be prefaced with an issue.
Also there are commit rules in place, that must be followed. Be sure to speak to a community leader, if you are unsure.

### Size matters
A good PR is small and changes as few lines of code as possible to resolve the issue. Multiple smaller separate PRs are ofter better than one big PR that touches multiple areas of the code.

A large PR with several unrelated fixes in it can contain code that may cause issues with the VivumLab codebase; effectively stopping the rest of the code from being merged.

Ultimately, smaller PRs are easier to review, test, track, and merge.

### Not just any PR
While we actively welcome your PRs, a successful contribution to the project is not guaranteed. The PR will be reviewed by VivumLab Community Leaders, discussions will ensue, and only after appropriate deliberation will the PR be merged. This is only to ensure the quality of code; it is nothing personal.

### Contribution: Preparing to fork VivumLab
To contribute to VivumLab, you'll need to:

1. Establish and maintain a mirrored Fork
2. Branch Dev in your fork
3. Develop your feature/fix
4. Commit to your branch on your fork
5. Create a Merge Request

Doing the above will require some prior knowledge; you'll need a working understanding of Git, and a GitHub account. [Understanding Git](https://duckduckgo.com/?q=learn+git) has a small learning curve and is unfortunately, beyond the scope of this document.

!!!NOTE: The following instructions are provided as a guideline, and is by no means, definitive, Follow the link, do some research.

### Contribution: Forking VivumLab
1. Create your own fork by clicking the "Fork" button at https://github.com/Vivumlab/VivumLab: ![Fork button location](fork.png)

2. In your fork, goto Settings/Repository -> "Mirroring repositories" and setup mirroring of Vivumlab/VivumLab
![Screen Shot of Mirror setup](mirror.png)

    Mirror direction = Pull
    Only mirror protected branches = enabled

3. Then set your Protected Branches in Settings/Repository -> "Protected Branches" like this
![Setting Protected Branches](protected-branches.png)
(you can ignore CODEOWNER though) you can even set push to "no one" so you can't accidentally push to that branch.

### Contribution: Forked VivumLab... Now what?

1. Make sure you don't have any outstanding un-related changes in your local repository with **`git status`**; You should see `nothing to commit, working tree clean`.
2. Identify the branch name by navigating to the issues' linked Merge Request and clicking the copy icon next to the Branch name.
    ![Finding the Branch Name](branch-name.png)
4. Run `git fetch origin`
5. Run `git checkout <<branch name>>`
6. Make your changes
7. Commit and Push

### Contribution: New issues, but no PR
Fixing issues announced by the community is the backbone of this project. What happens when you find an issue that you know how to fix, but no one has made a PR to fix it? Here's how you should do it

1. Make sure you don't have any outstanding un-related changes in your local repository with **`git status`**. You should see `nothing to commit, working tree clean`.
2. Locate the appropriate issue, and from this issue, click the `Create Merge Request` button.
3. Now click the `Check Out Branch` button and run **`git status`** again on your local copy of the repository.
4. Now make your changes, commit and push them.
5. On GitHub, go to your PR and make sure it is not labeled **WIP** and that all the check boxes are checked (If applicable).

Once you've submitted the PR, community leaders will review it. Only once it is approved, will it be merged.

At this point, nothing else is required from you, unless specifically requested. Don't worry about rebasing, or closing the merge request.
If the Merge Request needs changes, the maintainers will add comments describing the needed changes, the label `WIP:` will be added to the start of the title, and the submitter will be reassigned to the PR.

If/When you are asked to rebase, run:
**`git checkout dev`**
**`git pull`**
**`git checkout <branch name>`**
**`git rebase dev`**

## Developing Locally with Vagrant

You can play around with the stack locally without needing an actual server to spin it up against.
First run `make config` as normal. The local IP and SSH username are not used for Vagrant, so they can be
for your real server, or fake. For `What is the domain you have pointed at your Vivumlab server with ports 80 and 443?:`
enter `localhost`.

Now run `make develop` to spin up a local instance inside a Vagrant machine.
For easy access to the services run `vagrant ssh -c "cat {{ volumes_root }}/vivumlab_hosts"`. Append the output of this to your
machine's host file (usually `/etc/hosts`). Now you should be able to access http://servicename.localhost:2280/
where `servicename` is the name of any services you have enabled in `config.yml`.
If you make changes to the Ansible scripts you can run `make provision` to run them again.

To deploy just one service you can run `make update_one SERVICE_NAME` e.g. `make update_one zulip`

To run just one set of tags you can run `make tag TAG_NAME` e.g. `make tag tinc`

`[client]$ make web` - Spins up a development stack

`[client]$ make lint` - Run linting scripts

## Working locally on the documentation

To serve the docs locally run `make docs_local`.

## Working locally on the website

To work on the [VivumLab website](https://vivumlab.com/) just type `make web` to serve it locally.


## Contributions and Licensing
This should go without saying but when you submit any contribution, including but not limited to: code additions, code changes, images, documentation, audio, and video; your submissions are assumed to be under the same license that covers the project.

Feel free to contact a Community Leader if that's a concern.

## Disclaimer
By contributing, you agree that your contributions will be licensed under its MIT License.

***

#### Attribution/ Reference

Please see [Legal/ Licensing/ Acknowledgement](../Legal.md)
