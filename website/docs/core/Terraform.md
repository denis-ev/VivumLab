---
id: terraform
title: Terraform
hide_title: true
hide_table_of_contents: false
sidebar_label: Terraform
custom_edit_url: https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md
#description: How do I find you when I cannot solve this problem
#keywords:
#  - docs
#  - docusaurus
#image: https://i.imgur.com/mErPwqL.png
---

# Terraform

VivumLab can utilise [Terraform](https://duckduckgo.com/?q=terraform) to spin up cloud servers for you using other infrastructure (eg. Digital Ocean) if you don't have any physical hardware for your own use.

Obviously whichever provider you choose will have certain requirements and their own pricing scheme; be aware of this.

!!! Note: VivumLab is not an option to get free hosting from commercial providers, VivumLab just helps you deploy to their services.

!!! Note: Providing troubleshooting for any providers, commercial or not, is beyond the scope of VivumLab. Please contact the provider for any issues regarding their services.

## Digital Ocean

1. Create a Digital Ocean account and login
2. click `API` on the left menu, and generate a new access token; name it `Terraform` and save it
3. run `vlab decrypt`, to ensure your `settings/vault.yml` is readable
4. Copy the token into your `settings/vault.yml` file under `do_access_token:`. E.g:
```
do_access_token:<your_token_here>
```

If you are already a Digital Ocean user, you may receive an error about a pre-existing SSH key.
(422 SSH Key is already in use on your account).
To correct this:
1. Run **`ssh-keygen -l -E md5 -f <location of ssh keys>`** on your server, and note the commands output.
2. Login to Digital Ocean and go to the Security page
3. Locate the key that matches the output from the aforementioned command
4. Delete the SSH key
NOTE: default location of ssh keys is: `$HOME/.ssh/id_rsa.pub`

Terraform will re-add it when you run **`vlab terraform`** and will be able to manage it correctly.

## Running Terraform

Run **`vlab terraform`**

## Destroying Terraform Resources

Run **`vlab terraform_destroy`** to destroy any resources Terraform created.
