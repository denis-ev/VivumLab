#!/usr/bin/env bash

# Bash Linter for Pre-commits
#
# Exit 0 if no errors found
# Exit 1 if errors were found

# Flag to denote if a error was found
erros_found=false

error_count=0
for file in $@
do
  ! grep -R 'puts ' $file | grep -n "puts \'"
  if [ $? -ne 0 ]; then
    # echo "Errors were detected" >&2
    error_count=$[$error_count +1]
    erros_found=true
  fi
  ! grep -R 'puts ' $file | grep -n 'puts \"'
  if [ $? -ne 0 ]; then
    # echo "Errors were detected" >&2
    error_count=$[$error_count +1]
    erros_found=true
  fi
  ! grep -R 'say ' $file | grep -n "say \'"
  if [ $? -ne 0 ]; then
    # echo "Errors were detected" >&2
    error_count=$[$error_count +1]
    erros_found=true
  fi
  ! grep -R 'say ' $file | grep -n 'say \"'
  if [ $? -ne 0 ]; then
    # echo "Errors were detected" >&2
    error_count=$[$error_count +1]
    erros_found=true
  fi
done

if [ "$erros_found" = true ]; then
    exit 1
fi

exit 0
