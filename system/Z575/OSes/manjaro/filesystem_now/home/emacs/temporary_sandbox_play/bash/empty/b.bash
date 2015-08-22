#!/bin/bash


#well ofc, but look here: https://stackoverflow.com/questions/11362250/in-bash-how-do-i-test-if-a-variable-is-defined-in-u-mode?answertab=active#tab-top

set -u

unset a

if [ ! $a ]; then
  echo "no"
else
  echo "yes"
fi

if [ $a ]; then
  echo "yes"
else
  echo "no"
fi

