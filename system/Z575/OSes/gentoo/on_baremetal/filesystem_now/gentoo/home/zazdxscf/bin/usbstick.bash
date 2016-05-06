#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"

fil="/usbstick"
usr="zazdxscf"
dev='/dev/sdc1'
if test ! -e "$dev"; then
  dev='/dev/sdb1' #fallback device
fi

if test ! -e "$dev"; then
  echo "'$dev' does not exist!"
  exit 2
fi


#fsck first, you never know, esp. since no sync is done on the old cell(even tho I try to work around by executing a slideshow on it)
time sudo fsck.vfat -v -f -V -w -- "$dev"

#this makes all files u+rw,a-rwx  where u is zazdxscf(or $usr)
sudo mount "$dev" "$fil" -o,uid=${usr},noexec,nosuid,nodev,fmask=0177
if test "$?" -eq '0'; then
  pushd "$fil"
  xfce4-terminal
  popd
  time safepromptkey "press a key when done, to unmount"
  sudo umount "$fil"
  sync
  sudo eject -- "$dev"
fi
lsblk

