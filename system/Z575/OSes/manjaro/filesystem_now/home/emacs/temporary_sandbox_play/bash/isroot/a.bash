#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"

if isroot; then
  echo "root"
else
  echo "not root"
fi

