# Developer Tips

## Labels

`feat` is for any new features. features changes or adds to how VivumLab itself deploys/operates.

`package` is for new packages people would like added to VivumLab. These should not be marked as `enhancement`s.

`bug` is for bugs. :)

## Creating migrations

If something needs to change, create a migration by creating Ansible tasks to perform the migration.
Then tag those tasks as with a `# MIGRATION vX.X` comment.

The next tagged release after the version in the comment, these tasks will be removed.

#### Example

Gitea had an incorrect path in it's docker-compose yml file. It was pointing the `/data`
mount at `/var/lab/vivumlab/gitea` instead of `{{ volumes_root }}/gitea` where it should have been.

So two tasks were created, one to copy the folder to it's proper place, the next to make sure the
old folder was absent. The first task will fail if the folder to be copied doesn't exist, which
will be the case for new users, or users who have already ran the migration once. So `ignore_errors:
true` is included.

```
# MIGRATION v0.5
- name: Migrate old folders if needed
  shell: mv /var/lab/vivumlab/gitea {{ volumes_root }}/gitea
  ignore_errors: true

# END MIGRATION
```

## Code/PR like a Boss
PRs are easy, follow these suggestions for a smooth experience:
1. **Fork the right repo**: make sure you forked the *'dev'* branch
2. **Label the PR appropriately**:
  * Add the label *'Testing needed'*, if the code requires testing that you are unable to perform yourself. This is common, and it is good to let others test and give feedback.
  * Add the label *'Work in Progress'* if the code isn't quite finished. This would be applicable if you had small (or large) amounts of code that is missing, doesn't work as expected, or maybe just isn't quite right. Use this label, if help isn't necessary or expected.
    * It is expected that if collaboration or suggestions are offered, they are received and handled well; *keep the community healthy*.
  * Add the label *'Help needed'*, if you want help with the PR. Everyone needs help at some point, so use the community; It's why we are here.
3. **Update the documentation**: If the code requires the user to interact differently with either VivumLab or the service, then educate them; irrespective of their technical skill level. *This is a REQUIREMENT, and will be ENFORCED*
4. **Make sure your code lints**: simply speaking, make your code neat and make sure it is formatted correctly.
5. **Issue the pull request**: As mentioned before, creating a corresponding issue assists with tracking changes and keeps the code focused. It is extremely rare that a PR is accepted without a corresponding issue.
6. **Use consistent coding style**: At times this will be unavoidable (eg. YAML files); irrespective of this, to ensure ease of updating and future contribution of code from other community members. it is expected that:
* any contributed code:
  * employs a responsible use of whitespace
  * is appropriately commented
* Names (of variables, functions etc.):
  * should be formatted appropriately
  * mindfully designed
  * relevant to VivumLab, and its pre-existing codebase

## Pre-commit
Pre-commit assists the developer in producing readable, auditable code. See the following quote from the developers of pre-commit

##### Quote from Pre-Commit
Git hook scripts are useful for identifying simple issues before submission to code review. We run our hooks on every commit to automatically point out issues in code such as missing semicolons, trailing whitespace, and debug statements. By pointing these issues out before code review, this allows a code reviewer to focus on the architecture of a change while not wasting time with trivial style nitpicks.

### Installing Pre-commit

Before you can run hooks, you need to have the pre-commit package manager installed.

Using pip:
**`pip install pre-commit`**

Using [homebrew](https://brew.sh/):
**`brew install pre-commit`**

#### Set up the git hook scripts.
From the VivumLab root folder (where you run the **`vlab`** commands from), run:
**`pre-commit install`**

Run against all the files (optional)
**`pre-commit run --all-files`**
