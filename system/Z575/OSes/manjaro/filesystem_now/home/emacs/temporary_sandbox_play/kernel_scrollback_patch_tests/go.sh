#!/bin/bash

die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }

upty() {
[[ $1 ]] || die 2 "passed empty param to upty()"

local f=$1
whichone1="b/drivers/video/console/$f"
if ! diff -upq "$f" "${whichone1}"; then
  echo "new $f patchRSB detected, updating..."
  cp -f "$f" "${whichone1}" || return $?
fi
}

upty vgacon.c || die 3
upty Kconfig || die 4

./genpatch_RSB.sh >went.patch
./testpatch.sh went.patch

clrbuf
promptkey 10 "press a non modified key to continue or wait 10 sec"

exit 0


