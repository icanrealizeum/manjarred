#!/bin/bash
set -e -u

dest1=$(mktemp -d --tmpdir="/tmp/" hosts.XXXXXXXX)
file1="hosts.zip"
zipfile1="${dest1}/${file1}"
hostsfileinzip1="HOSTS"

#blockedip is not set to 0.0.0.0 for this reason: https://bugzilla.mozilla.org/show_bug.cgi?id=1015001 firefox bug trashing the disk and cpu
blockedip="127.0.0.3"
source "./common.sh"
curdiroutfile="${hosts_MSVP_fname}"
if [[ -z ${curdiroutfile} ]]; then
	echo "failed to source"
	exit 1
fi

#unzip can't unpack from stdin, apparently, so we do this:
wget -O "${zipfile1}" -c "http://winhelp2002.mvps.org/${file1}"
unzip -p "${zipfile1}" "${hostsfileinzip1}" | sed "s///g" | sed "s|0\.0\.0\.0|${blockedip}|g" | sed -e 's|^127.0.0.1 localhost.*$||g' -e 's|^::1 localhost.*$||g'  >"./${curdiroutfile}"


# only rm if everything succeeded, else leave trace to explore the fail
rm -r "${dest1}"

