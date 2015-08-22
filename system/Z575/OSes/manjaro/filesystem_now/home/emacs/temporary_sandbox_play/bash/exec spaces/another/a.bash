#!/bin/bash

set -x

adir="echo a"
afile="b.bash"
cmd="$adir/$afile"
mkdir "$adir" >/dev/null 2>&1
echo "echo \"in $afile\"" >"$cmd"
chmod u+x "$cmd"
$cmd test1
"$cmd" test2

unset cmd
$cmd test3
"$cmd" test4
cmd=
$cmd test5
"$cmd" test6

