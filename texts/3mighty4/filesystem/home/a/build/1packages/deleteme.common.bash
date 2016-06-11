#!/bin/bash

#inc=0
#incrementalpackage=

#bash array variable
useincremental=()

if test -e ./incremental ; then
#  inc=1
  echo -n "!!! Incremental package"
#  useincremental+=("--incremental") #that patch isn't needed with newer pacman!
  useincremental+=("--noextract") #this makes this: WARNING: Using existing $srcdir/ tree
#which is what we want!

else
  #not incremental package
  useincremental+=("--noextract")
  echo -n "!!! Normal package"
fi

echo " detected, extra args: ${useincremental[@]}"

