#!/bin/zsh -x

b=' 2 '
#if test ! "$b" -eq 2 ; then # same effect; works in bash tho
if test ! $b -eq 2 ; then  #works in bash tho
  echo "EQUALS"
fi

