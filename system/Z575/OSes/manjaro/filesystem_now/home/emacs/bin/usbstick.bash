#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"

fil="/usbstick"
usr="emacs"
dev='/dev/sdc1'

#this makes all files u+rw,a-rwx  where u is emacs(or $usr)
sudo mount "$dev" "$fil" -o,uid=${usr},noexec,nosuid,nodev,fmask=0177
if test "$?" -eq '0'; then
  safepromptkey "press a key when done, to unmount"
  sudo umount "$fil"
  sync
  sudo eject -- "$dev"
fi
lsblk

