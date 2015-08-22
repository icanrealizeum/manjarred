#!/bin/bash

signfile=$1
ext=".sign_"

if [ -z "${signfile}" ]; then
	echo "pass a *${ext} file! $@"
	exit 1
fi

basenamefile=${signfile%$ext}
if [ "$basenamefile" = "$signfile" ]; then
	echo "you didn't pass a $ext file ! $@"
	exit 2
fi
xzfile="${basenamefile}.xz"

if [ ! -f "$xzfile" ]; then
	echo "presumed .xz file '$xzfile' doesn't exist"
	exit 3
fi

#tempwdir=$(mktemp -d --tmpdir="/tmp" -t -- "signcheck.XXXXXX")
#if [ ! -d "${tempwdir}" ]; then
#	echo "something failed when making temporary directory '$tempwdir'"
#	exit 4
#fi

#cp "$signfile" "$tempwdir"
xz --decompress --stdout "$xzfile" | gpg2 --verify -- "$signfile" -
#>"${tempwdir}/${basenamefile}" 
#pushd .
#cd "$tempwdir"
ec=$?
#popd
#rm -r "${tempwdir}"

if [[ $ec -eq 0 ]]; then
	echo "ALL GOOD!"
	sha512sum "$xzfile"
else
	echo "FAIL!"
fi

exit $ec

