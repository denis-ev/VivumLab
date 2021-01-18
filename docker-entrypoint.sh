#!/usr/bin/env bash

DEFAULT_PATH="/data"

echo "Install vivumlab..."
cd $DEFAULT_PATH
if [[ $VERSION != 'local' && $VERSION != 'dev' ]]; then
  git checkout $VERSION &
  [[ "$!" -gt 0 ]] && wait $!
fi
chown -R "$TARGET_UID":"$TARGET_GID" "$DEFAULT_PATH"

if [[ $VERSION == 'local' || $VERSION == 'dev' ]]; then
  bundle install
fi

exec "$@"
