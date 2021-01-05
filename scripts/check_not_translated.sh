#!/usr/bin/env bash

# Bash Linter for Pre-commits
#
# Exit 0 if no errors found
# Exit 1 if errors were found

for file in $@
do
  ! grep -R 'puts ' $file | grep -n "puts \'"
  ! grep -R 'puts ' $file | grep -n 'puts \"'
  ! grep -R 'say ' $file | grep -n "say \'"
  ! grep -R 'say ' $file | grep -n 'say \"'
done

if [ $? -ne 0 ]; then
    exit 1
fi

exit 0
