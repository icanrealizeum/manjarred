#!/bin/bash

dontdifffile="dontdiff"

if [[ ! -f $dontdifffile ]]; then
  echo "the don't diff file doesn't exist: $dontdifffile"
  exit 1
fi

if [[ -z $opts ]]; then
  opts="-pru5"
fi

diff $opts -X "$dontdifffile" -- "$1" "$2"


