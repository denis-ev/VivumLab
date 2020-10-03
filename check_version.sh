#!/bin/bash

VERSION_CURRENT=$(cat VERSION)
VERSION_LATEST=$(curl -s -m 2 https://raw.githubusercontent.com/Vivumlab/VivumLab/master/VERSION)

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort | head -n 1)" != "$1"; }

echo -e "Current Version:\x1B[01;94m $VERSION_CURRENT \x1B[0m"
echo -e "Newest Version:\x1B[01;95m $VERSION_LATEST \n\x1B[0m"

if version_gt $VERSION_LATEST $VERSION_CURRENT; then
   echo -e "\x1B[01;31m * You should update to version $VERSION_LATEST! * "
   echo -e " * Update via git pull or at https://github.com/Vivumlab/VivumLab/releases * \n\x1B[0m"
else
  echo -e "\x1B[01;32mYou are up to date! \n\x1B[0m"
fi
