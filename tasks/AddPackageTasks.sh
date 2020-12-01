#!/usr/bin/env bash

# Contains Tasks related to adding a new package to VivumLab
# Use this task to walk through a wizard that helps you add a new package.

 Task::add_package() {
  : @desc "Wizard to add a new Package"

  colorize light_red "This is still experimental, manual changes are necessary!"
  read -p 'Do you want to proceed? [yes/no]: ' proceed
  case $proceed in
      [Yy]|[Yy][Ee][Ss])
        colorize green "OK, please ask if you need any help."
      ;;
      [Nn]|[Nn][Oo])
        exit
      ;;
      *)
        colorize light_yellow "VivumLab requires passwordless shh keys. Consider creatng some keys and re-running VivumLab."
        colorize light_yellow "REMINDER: 'vlab create_sshkey' can help you create some keys"
        exit
      ;;
  esac

  colorize green "This wizard will ask you a few questions and help you prototype the required changes to add a package"
  read -p "What is the name of this package in Title Case? " package_name
  read -p "What is the website of $package_name? " url
  read -p "Describe $package_name in one line: " description

  nospaces="${package_name// /''}"
  package_filename=$( echo $nospaces | awk '{print tolower($0)}')
  branch_name="service/adds-${package_filename// /-}"
  Task::create_git_branch $branch_name

  highlight "Creating role folder"
  cp -R package_template/roles/template/ "roles/${package_filename}"

  highlight "Editing Role Tasks & Renaming docker-compose template"
  search_and_replace_in_file 'pkgtemplate' $package_filename "roles/$package_filename/tasks/main.yml"
  mv roles/$package_filename/templates/docker-compose.template.yml.j2 roles/$package_filename/templates/docker-compose.$package_filename.yml.j2
  search_and_replace_in_file 'PackageFileName' $package_filename roles/$package_filename/templates/docker-compose.$package_filename.yml.j2

  highlight "Copying Doc Template"
  cp package_template/docs/software/template.md docs/software/$package_filename.md

  highlight "Editing Doc Template"
  local template="docs/software/$package_filename.md"

  search_and_replace_in_file 'PackageURL' "$url" $template
  search_and_replace_in_file 'PackageOneLiner' "$description" $template
  search_and_replace_in_file 'PackageFileName' $package_filename $template
  search_and_replace_in_file 'PackageTitleCase' "$package_name" $template

  #Adding docs to mkdocs.yml
  highlight "Adding Docs to mkdocs.yml"
  cat package_template/mkdocs.yml > package_template/tmpmkdocsfile.yml

  # Edit the config tempfile
  search_and_replace_in_file 'package_filename' $package_filename package_template/tmpmkdocsfile.yml
  search_and_replace_in_file 'package_name' $package_name package_template/tmpmkdocsfile.yml
  Task::run_docker yq m -i mkdocs.yml package_template/tmpmkdocsfile.yml
  # Remove tmp file

  rm -f package_template/tmpmkdocsfile.yml

  highlight "please edit mkdocs.yml manually and move the created service from misc/other to the right category"

  highlight "Adding Package to the group_vars/all file"
  Task::run_docker yq w -i group_vars/all "services.$package_filename"
  Task::run_docker yq w -i group_vars/all "$package_filename"

  highlight "Adding service to Config Template"
  # Create Template File for Merging
  cat package_template/config.yml > package_template/tmpconfigfile.yml

  # Edit the config tempfile
  search_and_replace_in_file '{\% raw \%}' '# temporary_raw_placeholder' roles/vivumlab_config/templates/config.yml
  search_and_replace_in_file '{\% endraw \%}' '# temporary_endraw_placeholder' roles/vivumlab_config/templates/config.yml
  search_and_replace_in_file 'package_filename' $package_filename package_template/tmpconfigfile.yml
  Task::run_docker yq m -i roles/vivumlab_config/templates/config.yml package_template/tmpconfigfile.yml
  search_and_replace_in_file '# temporary_raw_placeholder' '{\% raw \%}' roles/vivumlab_config/templates/config.yml
  search_and_replace_in_file '# temporary_endraw_placeholder' '{\% endraw \%}' roles/vivumlab_config/templates/config.yml
  # Remove tmp file

  rm -f package_template/tmpconfigfile.yml

  mkdir -p package_template/tmp_service
  cat > package_template/tmp_service/${package_filename}.sh <<EOL
#!/usr/bin/env bash
  bash vlab push_package $branch_name $package_filename
EOL
 }

 Task::create_git_branch() {
  git fetch
  # git checkout dev && git pull
  git branch $1

  git checkout $1
 }

 Task::push_package() {
  git checkout $1
  git add .
  git commit -m "feat(service): adds $2"
  git push
 }

 function search_and_replace_in_file(){
  sed -i '' "s~$1~$2~g" $3
 }
