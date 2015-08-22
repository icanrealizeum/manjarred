#!/bin/bash
set -x

_rc=rc7
_rc=
#correct:
if [ -n "$_rc" ]; then
	pkgverdash=something-${_rc}
else
	pkgverdash=something
fi

echo $pkgverdash

#also correct:
if [[ -n $_rc ]]; then
	pkgverdash=something-${_rc}
else
	pkgverdash=something
fi

echo $pkgverdash

