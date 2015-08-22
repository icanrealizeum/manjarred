#!/bin/bash

# http://wiki.openwrt.org/doc/faq/development#how.can.i.speed.up.build.process
#this must be in .config
######CONFIG_LOCALMIRROR="file:///home/emacs/build/router/openwrt/mirror"

#will interfere with openwrt build if set
#see http://wiki.openwrt.org/doc/howto/buildroot.exigence
#they weren't set now, but just making sure                                     
unset GREP_OPTIONS
unset SED

sudo pacman -S --needed subversion asciidoc bash bc binutils bzip2 fastjar flex util-linux gawk intltool zlib make cdrkit ncurses openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt boost libusb bin86 sharutils b43-fwcutter findutils

echo "!! NOTE: the following may say gcc vs gcc-multilib, if you have either one that's good! don't replace!"
sudo pacman -S --needed gcc
echo "!! Same thing for git-git vs git"
sudo pacman -S --needed git

sudo -K

pushd .
cd openwrt
#fetch stuff from inet
./scripts/feeds update -a
./scripts/feeds install -a
popd

