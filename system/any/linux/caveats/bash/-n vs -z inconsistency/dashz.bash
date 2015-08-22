#!/bin/bash
set -x

_rc=rc7
#_rc=
if [ -z $_rc ]; then
	pkgverdash=something
else
	pkgverdash=something-${_rc}
fi

echo $pkgverdash

