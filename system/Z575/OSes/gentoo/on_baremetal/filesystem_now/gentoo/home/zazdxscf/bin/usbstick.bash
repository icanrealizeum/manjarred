#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"

fil="/usbstick"
usr="zazdxscf"
dev='/dev/sdc1'
if test ! -e "$dev"; then
  dev='/dev/sdb1' #fallback device - usb stick card reader with ...pro duo card
  if test ! -e "$dev"; then
    dev='/dev/sdd1' #8G mini SD card from android
  fi
fi

if test ! -e "$dev"; then
  echo "'$dev' does not exist!"
  exit 2
fi


#fsck first, you never know, esp. since no sync is done on the old cell(even tho I try to work around by executing a slideshow on it)
time sudo fsck.fat -v -f -V -w -- "$dev" #well, fsck.vfat is gone, using .fat
ec="$?"
if test "$ec" -ne "0"; then
  echo "$0 failed! ec: $ec"
  exit 3
fi

#this makes all files u+rw,a-rwx  where u is zazdxscf(or $usr)
sudo mount "$dev" "$fil" -o,uid=${usr},noexec,nosuid,nodev,fmask=0177
if test "$?" -eq '0'; then
  pushd "$fil"
  xfce4-terminal
  popd
  ec=1
while test "$ec" -ne "0"; do
  time safepromptkey "press a key when done, to unmount"
  sudo umount "$fil"
  ec="$?"
done
  sync
  sudo eject -- "$dev"
fi
lsblk

