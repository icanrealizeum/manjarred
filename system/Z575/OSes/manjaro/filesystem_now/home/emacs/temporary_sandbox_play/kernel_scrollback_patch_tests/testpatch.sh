#!/bin/bash

die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }

[[ $1 ]] || die 202 "patch not specified"

testfolder () {
[[ $1 && $2 ]] || die 203 "function called with $@"

pushd .
cd $1
pushd .
cd "./drivers/video/console"
cp -f -- "vgacon.c.orig" "vgacon.c" || return 204
cp -f -- "Kconfig.orig" "Kconfig" || return 205
popd

local ec=0
if patch -p1 -i "../$2" ; then
    echo patch ok!
else
    echo patch FAIL!
		ec=1
fi

popd

return $ec
}

echo testing1
testfolder "2/" "$1"
ec2=$?

if [[ $ec2 -eq 0 ]]; then
	echo testing2
	testfolder "3/" "$1"
	ec2=$?
fi

if [[ $ec2 -eq 0 ]]; then
	echo "ALL GOOD!"
else
	echo "BAD!"
fi

exit $ec2

