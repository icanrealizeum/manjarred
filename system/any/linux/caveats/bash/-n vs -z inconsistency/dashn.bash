#!/bin/bash
set -x

_rc=rc7
_rc=
if [ -n $_rc ]; then
	#always true !
	pkgverdash=something-${_rc}
else
	#never reached!
	pkgverdash=something
fi

echo $pkgverdash

