#!/bin/bash

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"         

#TERMINAL_PROGRAM=urxvt
TERMINAL_PROGRAM=xfce4-terminal

#NOTE: to make a new truecrypt container:
#sudo tcplay -c -d /dev/sdc --pbkdf-prf=SHA512 --cipher=SERPENT-256-XTS,TWOFISH-256-XTS,AES-256-XTS
#or /dev/sdc can be /dev/loop0 which you create with sudo losetup `losetup -f` /tmp/crap  where crap is a file made with dd eg. 5meg file: dd if=/dev/zero of=/tmp/crap bs=1M count=5


tcmountcontainerfunc() {
  # $1 container file
  # $2 path to mount to
  # $3 user that is expected to have write access to it (for mount to allow you to write to, without needing you to change permissions/owner)
  if ! isroot ; then
#    safepromptkey "you are not root! press a key, not shift/ctrl/alt"
#    return 1
    echo "Going root via sudo..."
    exec sudo -- "$0" "$@"
    echo "not reached"
    exit 1
  fi
  local maxparams=3
  test "$#" -eq "$maxparams" || die 8 "pass only $maxparams parameters! you passed($#): $@"
  ensure_existing_commands_or_die "lsblk cut sort id losetup tcplay dmsetup mount" "file" "9" "Required program not found(in \$PATH=$PATH):"
  #XXX: ^ prog is not expanded where I wanted it to be!
  #fil="3g.tcr"
  #filpath="/run/media/emacs/Efullmp3/pri vate"
  #fullfil="$filpath/$fil"
  fullfil="$1"
  if ! test -f "$fullfil" -o -b "$fullfil"; then
    die 88 "file '$fullfil' not found!"
  fi
  fil="${fullfil##*/}"
  filpath="${fullfil%/*}"
  devmappername="$fil"
  devmapperfullpath="/dev/mapper/$devmappername"
  #usr="`id -nu`" nope that's: root
  #usr="$USER" works with sudo
  #usr="emacs" #works with su too :)
  usr="$3" #works with su too :)
  #mountdir="/home/$usr/pics3g/"
  mountdir="$2"

  [ -d "$mountdir" ] || mkdir -p "$mountdir"
  chmod --changes --preserve-root a-rwx,u+rwx "$mountdir"

  gid="`id -g \"$usr\"`"
  uid="`id -u \"$usr\"`"
  [ -n "$DEBUG" ] && echo "$usr $uid $gid" >&2

  if ! test -b "$fullfil"; then
    loopdev=`losetup -f`
  else
    loopdev="$fullfil"
  fi
  echo "$loopdev"
  if [ -z "$loopdev" ]; then
    echo "failed to find a loop device: '$loopdev'"
    return 44
  fi

  DEBUG=1

  if ! test -b "$fullfil"; then
    execute losetup "$loopdev" "$fullfil"
  fi
  #execute tcplay --map "$devmappername" -d "$loopdev"
  execute tcplay --allow-trim --map "$devmappername" -d "$loopdev"
  ec="$?"
  if test "$ec" -ne "0"; then
    echo "Failed with exit code '$ec'. Aborting..."
    if ! test -b "$fullfil"; then
      execute losetup -d "$loopdev"
    fi
    return "$ec"
  fi
  #mask out(aka remove): u+x, o+rwx, g+rwx  of files and dirs, except for dirs allow u+rwx (+x needed to read list of files in dir)
  execute mount -o "noexec,nosuid,uid=$uid,gid=$gid,fmask=0177,dmask=0077" "$devmapperfullpath" "$mountdir"
  local succ="$?"
  if test "$succ" -ne "0"; then
    echo "trying non-fat fs mounting(with exec capability, but nosuid):"
    #execute mount -o "noexec,nosuid" "$devmapperfullpath" "$mountdir"
    execute mount -o "exec,nosuid" "$devmapperfullpath" "$mountdir"
    succ="$?"
  fi
  if test "$succ" -eq "0" ; then
    echo -e "\033[32mMounted: '"$mountdir"'\e[0m" >&2
  else
    echo -e "\e[31mFAILED!\e[0m" >&2
  fi
  pushd .
  cd "$mountdir"
  if test "$succ" -eq "0" ; then
    su "$usr" -c "$TERMINAL_PROGRAM"
  fi
  popd
  safepromptkey "press a key when done, to unmount 1/2"
  safepromptkey "press a key when done, to unmount 2/2"
  echo -e "\033[0m" >&2
  execute umount "$devmapperfullpath"
  #execute dmsetup remove "$devmappername"
  allchildren="`lsblk -r -- "$loopdev" | cut -d ' ' -f1 | sort`"
  once='0'
  for i in ${allchildren}; do #unquoted!
    if test "$i" == "NAME"; then
      continue
    fi
    if test "$i" == "${loopdev##*/}" -a "$once" = '0'; then
      once='1'
      #because we have: NAME, sdc, sdc.1, sdc.0, sdc (again! which is leaf)
      continue
    fi
    execute dmsetup remove "$i"
  done
  #only for linux mint:
  #dmsetup remove $fil.1
  #dmsetup remove $fil.0
  if ! test -b "$fullfil"; then
    execute losetup -d "$loopdev"
  fi
  echo -e "\033[32mDone.\e[0m" >&2
  lsblk
  return $succ
}

tcmountcontainerfunc "$@"

