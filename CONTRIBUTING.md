---
id: CONTRIBUTING
title: Contributing to Vivumlab
hide_title: true
hide_table_of_contents: false
sidebar_label: CONTRIBUTING
custom_edit_url: https://github.com/VivumLab/VivumLab/edit/dev/CONTRIBUTING.md
---

# Contributing to VivumLab

## Open source, VivumLab and You
VivumLab recognises that an open source project is only as strong as its community. For this reason we want to make contributing to this project as easy and transparent as possible, whether it is:

* Reporting a Bug
* Discussing the current state of the code
* Submitting a fix
* Proposing new **features**
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
5. Create a Pull Request

Doing the above will require some prior knowledge; you'll need a working understanding of Git, and a GitHub account. [Understanding Git](https://duckduckgo.com/?q=learn+git) has a small learning curve and is unfortunately, beyond the scope of this document.

!!!NOTE: The following instructions are provided as a guideline, and is by no means, definitive, Follow the link, do some research.

### Contribution: Forking VivumLab
1. Create your own fork by clicking the "Fork" button at https://github.com/Vivumlab/VivumLab: ![Fork button location](dev/fork.png)

2. Then set your Protected Branches in Settings -> "Branches" like this
![Setting Protected Branches](dev/protected-branches.png)

3. Install [Pull](https://wei.github.io/pull/) to keep your fork up-to-date with our Repository.

### Contribution: Forked VivumLab... Now what?

1. Make sure you don't have any outstanding un-related changes in your local repository with **`git status`**; You should see `nothing to commit, working tree clean`.
2. Identify the branch name by navigating to the issues' linked Pull Request and clicking the copy icon next to the Branch name.
    ![Finding the Branch Name](dev/branch-name.png)
4. Run `git fetch origin`
5. Run `git checkout <<branch name>>`
6. Make your changes
7. Commit and Push

### Contribution: New issues, but no PR
Fixing issues announced by the community is the backbone of this project. What happens when you find an issue that you know how to fix, but no one has made a PR to fix it? Here's how you should do it

1. Make sure you don't have any outstanding un-related changes in your local repository with **`git status`**. You should see `nothing to commit, working tree clean`.
2. Locate the appropriate issue, and from this issue, click the `Create Pull Request` button.
3. Now click the `Check Out Branch` button and run **`git status`** again on your local copy of the repository.
4. Now make your changes, commit and push them.
5. On GitHub, go to your PR and make sure it is not labeled **WIP** and that all the check boxes are checked (If applicable).

Once you've submitted the PR, community leaders will review it. Only once it is approved, will it be merged.

At this point, nothing else is required from you, unless specifically requested. Don't worry about rebasing, or closing the Pull Request.
If the Pull Request needs changes, the maintainers will add comments describing the needed changes, the label `WIP:` will be added to the start of the title, and the submitter will be reassigned to the PR.

If/When you are asked to rebase, run:
**`git checkout dev`**
**`git pull`**
**`git checkout <branch name>`**
**`git rebase dev`**

## Git Commit Guidelines

We have very precise rules over how our git commit messages can be formatted.  This leads to **more
readable messages** that are easy to follow when looking through the **project history**.  But also,
we use the git commit messages to **generate the changelog**.

The commit message formatting can be added using a typical git workflow or through the use of a CLI
wizard for example ([Commitizen](https://github.com/commitizen/cz-cli)).

### Commit Message Format
Each commit message consists of a **header**, a **body** and a **footer**.  The header has a special
format that includes a **type**, a **scope** and a **subject**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory and the **scope** of the header is optional.

Any line of the commit message cannot be longer than 100 characters! This allows the message to be easier
to read on GitHub as well as in various git tools.

### Revert
If the commit reverts a previous commit, it should begin with `revert: `, followed by the header
of the reverted commit.
In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit
being reverted.

### Type
Must be one of the following:

* **feat**: A new feature
* **fix**: A bug fix
* **docs**: Documentation only changes
* **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing
  semi-colons, etc)
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **perf**: A code change that improves performance
* **test**: Adding missing or correcting existing tests
* **chore**: Changes to the build process or auxiliary tools and libraries such as documentation
  generation

### Scope
The scope could be anything specifying place of the commit change. For example `service`,
`core`, `docs`, etc...

### Subject
The subject contains succinct description of the change:

* use the imperative, present tense: "change" not "changed" nor "changes"
* don't capitalize first letter
* no dot (.) at the end

### Body
Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.

### Footer
The footer should contain any information about **Breaking Changes** and is also the place to
[reference GitHub issues that this commit closes][closing-issues].

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines.
The rest of the commit message is then used for this.

## Working locally on the website and documentation

To work on the [VivumLab website](https://vivumlab.com/) just run `docker-compose -f dev/docker-compose.docs-local.yml up` to serve it via docker locally on port `8000` or read `cd website && cat README.md` for yarn instructions.



## Contributions and Licensing
This should go without saying but when you submit any contribution, including but not limited to: code additions, code changes, images, documentation, audio, and video; your submissions are assumed to be under the same license that covers the project.

Feel free to contact a Community Leader if that's a concern.

## Disclaimer
By contributing, you agree that your contributions will be licensed under its MIT License.

***

#### Attribution/ Reference

Please see [Legal/ Licensing/ Acknowledgement](Legal)
