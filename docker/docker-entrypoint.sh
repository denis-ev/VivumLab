#!/usr/bin/env bash

DEFAULT_PATH="/data"

echo "Install vivumlab..."
cd $DEFAULT_PATH
if [[ $VERSION != 'local' && $VERSION != 'dev' ]]; then
  git checkout $VERSION &
  [[ "$!" -gt 0 ]] && wait $!
fi
chown -R "$TARGET_UID":"$TARGET_GID" "$DEFAULT_PATH"

pre-commit install

if [[ $VERSION == 'local' || $VERSION == 'dev' ]]; then
  bundle install
else
  clear
fi

echo "Running vlab config new to ensure we have a valid config file."
echo "Note, this will not overwrite your config, if one exists."

vlab config new

clear

cat /etc/motd

exec "$@"
