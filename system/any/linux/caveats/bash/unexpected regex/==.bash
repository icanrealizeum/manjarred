#!/bin/bash -x

A='21'
#A='' #nodiff
B='*'
#B="*" #nodiff

#if [[ "$A" == "$B" ]]; then  #correct, it doesn't match!
if [[ "$A" == $B ]]; then  #wrong - matches! in bash! but not in zsh!
#if [[ "$A" = $B ]]; then #same effect
#if [[ $A == $B ]]; then  #same effect
#if [[ $A = $B ]]; then #same effect
  echo EQUALS
fi

