#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; };readonly -f -- __die
source funx.bash || __die 100 "funx.bash not in PATH"

#set -e
#trap "echo \'shiet $@ $FUNCNAME\'; exit 2" SIGint
trap "echo \'shiet $@ $FUNCNAME $?\'" debug

function die() { #tmp
  echo a
};readonly -f -- die
#declare -fr -- die

function die() {
echo b
}

#die

read
echo "well, can't trap that  error  when readonly, and exit"
