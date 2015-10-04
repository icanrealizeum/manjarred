#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"         

fil="safe4"
usr="zazdxscf"

#FIXME: /home/zazdxscf/bin/tcmountcontainer.bash: line 4: funx.bash: No such file or directory
#funx.bash not in PATH


tcmountcontainer.bash "/root/E/pri vate/${fil}" "/${fil}" "$usr"

