#!/bin/bash

#needs colordiff if you want to see the diff on console also
#ie. sudo pacman -S colordiff
#else, just check the output files! works without colordiff

#path+filename of the dkms main executable, when installed
main="/usr/bin/dkms"
#the file holding the diff between upstream dkms and arch linux version of dkms
uapatch="upstream vs archlinux.patch"
ampatch="archlinux vs manjaro.patch"
umpatch="upstream vs manjaro.patch"

#original upstream dkms path+file (should live in current folder)
oloc="./raw original upstream_dkms-2.2.0.3/"

#arch linux version of dkms path+file (should live in current folder)
adest="./archlinux version!_dkms-2.2.0.3-15-any/$main"

#manjaro/patched version dkms  path+file (should live in current folder)
pdest="manjaro(archlinux based) version patched_dkms-2.2.0.3-15-any/$main"

diffcmd="diff -pu5"

#nothing else to change below this line
#=======================

#source for this current dir script and its author: https://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in/246128#246128

#CAVEAT: you cannot "source thisscript.sh" because it will detect current folder as being where this script is!

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $SOURCE == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [ "$DIR" != "$RDIR" ]; then
  echo "DIR '$RDIR' resolves to '$DIR'"
fi
echo "DIR is '$DIR'"


#DIR is current dir


mainfile="${main##*/}"
mainpath="${main%/*}"

odest="${oloc}/${main}"

#making a symlink so as to look nice for the diff  and easy to use patch -p2
mkdir -p "${oloc}/${mainpath}" >/dev/null 2>&1
ln -rvsT "$oloc/$mainfile" "$odest" >/dev/null 2>&1


#strip extra slashes from the path, this also adds current folder as prefix
odest=$(realpath -se --relative-to="$DIR" "$odest")
adest=$(realpath -se --relative-to="$DIR" "$adest")
pdest=$(realpath -se --relative-to="$DIR" "$pdest")
#showargs "$odest"
#showargs "$adest"
#exit

#strip current folder from the path, to look right in diff
#no need if we're using --relative-to  param to realpath, seen above
#odest="${odest/$DIR\//}"
#adest="${adest/$DIR\//}"

#a="showargs -boobies"
#$a "$odest" "$adest" | tee out | colordiff
#$a $odest
#$a ${odest}
#exit

#compare upstream dkms with arch linux version of dkms
$diffcmd "$odest" "$adest" | tee "$uapatch" | colordiff

#compare arch linux dkms with manjaro(archlinux) aka patched dkms
$diffcmd "$adest" "$pdest" | tee "$ampatch" | colordiff

#compare upstream dkms with manjaro patch
$diffcmd "$odest" "$pdest" | tee "$umpatch" | colordiff


#sed -re 's|\(^[+++,---] \)\(.*\)\/usr\/bin\(.*\)|\1\2\3 |g' -- "$ampatch" 
sed -re 's|^(\+\+\+\|\-\-\-) (.*)'"$mainpath"'(.*)|\1 \2\3|g' -- "$ampatch" >"11-my.patch"

