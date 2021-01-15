#!/usr/bin/env bash

DEFAULT_PATH="/data"

echo -e "Variables:
\\t- UID=${TARGET_UID}
\\t- GID=${TARGET_GID}
\\t- VERSION=${AUTO_UPDATE}"

msg "Install vivumlab..."
cd $DEFAULT_PATH
git checkout $VERSION &
[[ "$!" -gt 0 ]] && wait $!
chown -R "$TARGET_UID":"$TARGET_GID" "$DEFAULT_PATH"

bundle install

exec "$@"
