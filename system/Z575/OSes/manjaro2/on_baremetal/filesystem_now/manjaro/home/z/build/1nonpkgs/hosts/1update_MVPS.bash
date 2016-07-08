#!/bin/bash
set -e -u

dest1=$(mktemp -d --tmpdir="/tmp/" hosts.XXXXXXXX)
file1="hosts.zip"
zipfile1="${dest1}/${file1}"
hostsfileinzip1="HOSTS"

#blockedip is not set to 0.0.0.0 for this reason: https://bugzilla.mozilla.org/show_bug.cgi?id=1015001 firefox bug trashing the disk and cpu
blockedip="127.0.0.3"
source "./common.sh"
curdiroutfile="$hosts_fname"
if [[ -z ${curdiroutfile} ]]; then
	echo "failed to source"
	exit 1
fi

#unzip can't unpack from stdin, apparently, so we do this:
wget -O "${zipfile1}" -c "http://winhelp2002.mvps.org/${file1}"
(
cat -- "$header_fname"
unzip -p "${zipfile1}" "${hostsfileinzip1}" | sed "s///g" | sed "s|0\.0\.0\.0|${blockedip}|g" | sed -e 's|^127.0.0.1 localhost.*$||g' -e 's|^::1 localhost.*$||g'
) | awk -- '
#dec2ip/ip2dec, src:https://stackoverflow.com/questions/10768160/ip-address-converter

function dec2ip(dec)
{
#BEGIN {
#    dec = ARGV[1]
    ip="";
    delim="";
    for (e = 3; e >= 0; e--) {
        octet = int(dec / (256 ^ e))
        dec -= octet * 256 ^ e
        ip = ip delim octet
        delim = "."
    }
    return sprintf("%s", ip);
}

function ip2dec(ip)
{
#BEGIN {
#    ip = ARGV[1]
    dec="";
    split(ip, octets, ".")
    for (i = 1; i <= 4; i++) {
        dec += octets[i] * 256 ** (4 - i)
    }
    return sprintf("%i", dec);
}

#XXX: passing an array because to can modify value of elements, src: https://www.chemie.fu-berlin.de/chemnet/use/info/gawk/gawk_14.html#SEC132
function notabadip(arr)
{
  do {
    ip=dec2ip(arr[1])

    tmp1=substr(ip, length(ip)-2+1);
    if (tmp1 == ".0") { arr[1] = arr[1] + 1; continue; };

    tmp2=substr(ip, length(ip)-4+1);
    if (tmp2 == ".255") { arr[1]=arr[1] + 2; continue; };

    break;

  } while (1==1);

  return ip;
}


BEGIN {
startIP="127.3.0.0";
startIPdec=ip2dec(startIP);
ipnow[1]=startIPdec;
ipnow[2]=2;
notabadip(ipnow);
}

/^'"${blockedip}"'\s.*$/ {
#\s is [[:space:]]
$1=notabadip(ipnow);
print $0
ipnow[1]++;
next
}
{print $0}
' > "./${curdiroutfile}"

# only rm if everything succeeded, else leave trace to explore the fail (set -u above handles this)
rm -r "${dest1}"

