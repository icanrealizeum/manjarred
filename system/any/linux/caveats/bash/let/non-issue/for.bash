#!/bin/bash

set -x 
declare -i i
size='`echo -n "2"`'
#size='$(echo -n "2")'
#size='2;i++'

#good they don't work

for (( i=1; i<=$size; i++ )); do
  echo "$i"
done

