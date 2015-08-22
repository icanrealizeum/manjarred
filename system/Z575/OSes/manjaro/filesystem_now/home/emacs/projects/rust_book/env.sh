#!/bin/bash
#I don't know if this works with just sh

rustroot='/home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2/'

unalias rustc >/dev/null 2>&1
alias rustc="LD_LIBRARY_PATH=\"$rustroot/lib\" \"$rustroot\"/bin/rustc"

#Aliases  are not expanded when the shell is notinteractive(eg. in scripts), unless the expand_aliases shell option is set using shopt 
shopt -s expand_aliases


