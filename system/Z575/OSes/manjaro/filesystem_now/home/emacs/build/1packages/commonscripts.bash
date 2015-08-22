#!/bin/bash

#this file is to be included via 'source' command, not executed. ie. source "commonscripts.bash"
set -u

#non-empty value  means it's a git package, unset or empty value means it's a normal package
#gitpackage=yes
#unset gitpackage

source commonvars.bash

is_incremental_package() {
  if [ -n "$incrementalpackage" ]; then
    return 0
  else
    return 1
  fi
}

#bash array variable
useincremental=()

if is_incremental_package; then
  echo -n "incremental package"
  #don't use --noextract here because it won't update srcdir while --incremental
  useincremental+=("--incremental")
else
  echo -n "normal package"
  useincremental+=("--noextract")
fi

echo " detected, params ${useincremental[@]}"

