#!/bin/bash

set -e -x

f() {
  if test -z "$1"; then
    echo "crap"
    exit 2
  fi

  read -r -d '' -a templist <&0 || true
  echo ${templist[@]}
}

f "something" <<EOF
a
b
c
d e f
g
EOF


