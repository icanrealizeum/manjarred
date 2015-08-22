#!/usr/bin/zsh -x

export SHELL='/bin/zsh'
echo $SHELL

declare -A ar
key='`echo -n "1">>times.txt`'
let 'ar[$key]+=1'
let 'ar[$key]+=1'
declare -p ar
let "ar[$key]+=1"
declare -p ar

# at least it doesn't segfault like bash
#
