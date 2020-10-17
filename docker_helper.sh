#!/bin/sh

VERSION_CURRENT=$(cat VERSION)
VERSION_LATEST=$(curl -s -m 2 https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION)

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort | head -n 1)" != "$1"; }

if version_gt $VERSION_LATEST $VERSION_CURRENT; then
    VERSION=$VERSION_CURRENT
else
    VERSION=latest
fi

if [ ! -f "$HOME/.vlab_vault_pass" ]; then
    echo "Oops, I cannot find your vault password in $HOME/.vlab_vault_pass"
    echo "This is unusual, but could be caused by the user being changed during setup."
    read -p "Press ctrl-c and create the file in the right place.  Then file a bug report."
fi

if [ -f "$HOME/.ssh/id_rsa" -a -f "$HOME/.ssh/id_rsa.pub" -a -f "$HOME/.vlab_vault_pass" ]; then
    docker run --rm -it \
      -v $HOME/.gitconfig:/root/.gitconfig:ro \
      -v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa:ro \
      -v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub:ro \
      -v $(pwd):/data \
      -v $HOME/.vlab_vault_pass:/ansible_vault_pass:ro \
      vivumlab/vivumlab:${VERSION} "$@"
else
    echo "You have no SSH keys in your home directory: $HOME"
    echo "Please generate a set of keys using the command:"
    echo "   ssh-keygen -t rsa"
    echo "or copy your id_rsa and id_rsa.pub keys to $HOME/.ssh/"
    echo "Then retry the operation"
    read -p "Press ctrl-c and fix your ssh keys"
fi
