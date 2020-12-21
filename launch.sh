#!/usr/bin/env bash

#if developer run as "./launch.sh dev"

if [ -z $1 ]; then
  version=latest
else
  if [ $1 == 'dev' ]; then
    docker build --no-cache -t vivumlab/vivumlab:dev .
    version=dev
  else
    version=$1
  fi
fi

function pwless_sshkey () {
  if [ -z ${PASSWORDLESS_SSHKEY} ]; then
    PASSWORDLESS_SSHKEY='id_rsa'
    echo $PASSWORDLESS_SSHKEY
  else
    echo $PASSWORDLESS_SSHKEY
  fi
}

if [[ ! -f ~/.vlab_vault_pass ]]; then
    touch ~/.vlab_vault_pass
fi

docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/ansible_vault_pass \
  vivumlab/vivumlab:${version} /bin/bash
