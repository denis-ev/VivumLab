#!/usr/bin/env bash

# Configuration Tasks

# Config - Updates the config file, and ensures the vault is encrypted.
Task::config(){
  : @desc "Creates or Updates the config file as necessary."
  : @param config_dir="settings"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param debug true "Debugs ansible-playbook commands"
  : @param cache true "Allows the build to use the cache"

  Task::logo_local
  Task::build $(build_check) $(force_check) $(cache_check)

  highlight "Creating or Updating config file"
  mkdir -p $_config_dir/passwords
  [ -f ~/.vlab_vault_pass ] || Task::generate_ansible_pass

  Task::run_docker ansible-playbook $(debug_check) \
  --extra-vars="@$_config_dir/config.yml" --extra-vars="@$_config_dir/vault.yml" \
  -i inventory playbook.config.yml || colorize red "error: config"
  highlight "Encrypting Secrets in the Vault"
  Task::run_docker ansible-vault encrypt $_config_dir/vault.yml || colorize red "error: config: encrypt"
}

#Show the Configuration settings for a given service
Task::show_config(){
  : @desc "Shows the configuration settings for the specified service"
  : @param service! "The name of the service. Use: service=serviceName"

  Task::run_docker yq r -C "settings/config.yml" $_service

}

# Resets the local settings
Task::config_reset() {
  : @desc "Resets VivumLab configs"
  : @param force true "Forces a rebuild/repull of the docker image"
  : @param build true "Forces to build the image locally"
  : @param cache true "Allows the build to use the cache"

  Task::logo_local
  Task::build $(build_check) $(force_check) $(cache_check)

  highlight "Reset Local Settings"
  colorize light_yellow "Backing up your current settings, you may need them \n"
  mv settings settings.bak
  mkdir settings
  Task::config
}

# Set a configuration variable. Requires that you specify key=value pair where
# Key is equal to the configuration key you'd like to set, and the value represents what it will be set to.
Task::set(){
  : @desc "Set a configuration variable"
  : @param rest% "Configuration Key to set"

  Task::decrypt

  # ( set -o posix ; set )
  local key value
  key=(${!_rest[@]})
  value="${_rest[$key]}"

  # Try to figure out where key is defined
  FILE=settings/config.yml
  SETTING_VALUE=$(Task::run_docker yq r "$FILE" "$key" "$value")
  if [ -z ${SETTING_VALUE} ]; then
      FILE=settings/vault.yml
      SETTING_VALUE=$(Task::run_docker yq r "$FILE" "$key" "$value")
      if [ -z ${SETTING_VALUE} ]; then
          colorize light_red "Key does not exist in config.yml nor vault.yml."
          # Re-encrypt vault
          Task::encrypt
          exit 1
      fi
  fi

  colorize light_yellow "Found value in file: $FILE"

  colorize light_red "Old setting value: " ${SETTING_VALUE}
  # Setting the new value
  Task::run_docker yq w -i "$FILE" "$key" "$value"
  NEW_SETTING_VALUE=$(Task::run_docker yq r "$FILE" "$key" "$value")
  colorize green "New setting value: " ${NEW_SETTING_VALUE}

  Task::encrypt
}
