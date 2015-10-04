#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"         

fil="TICUall"
usr="zazdxscf"

tcmountcontainer.bash "/root/E/pri vate/${fil}" "/${fil}" "$usr"

