#!/bin/bash -x

Z='1 -a -z 2'

#if test -n "$Z" ; then #correct                                                
if test -n $Z ; then #bad, must be doublequoted! bash does this; zsh is immune
  echo IMIN
else
  echo DASBAD
fi

