#!/bin/bash
#this is to test the different handling between -n and -z
#something that seems to be inconsistent, to me - but hey, I might be wrong!
#GNU bash, version 4.3.18(1)-release (x86_64-unknown-linux-gnu)

#BOTTOM LINE: always quote the strings!

#how to test, there are 2 cases:
#pass a non-empty parameter to see it works correctly
#pass no parameters to see that it doesn't ^

#or manually change this value from empty to non-empty before each run of $0
avar=$1
#all outputs should be the same! ie. all zero, or all non-zero
#but when ^ is empty, first output is different!
#------------

#set -x
clear

red() {
	echo -e "\e[41m!non-zero\e[0m"
}

green() {
	echo -e "\e[42m!zero\e[0m"
}

if [ -n $avar ]; then
	# this
	red
else
	green
fi

if [ -n "$avar" ]; then
	red
else
	# this
	green
fi

if [[ -n $avar ]]; then
	red
else
	# this
	green
fi

if [[ -n "$avar" ]]; then
	red
else
	# this
	green
fi

if [ -z $avar ]; then
	# this
	green
else
	red
fi

if [ -z "$avar" ]; then
	# this
	green
else
	red
fi

if [[ -z $avar ]]; then
	# this
	green
else
	red
fi

if [[ -z "$avar" ]]; then
	# this
	green
else
	red
fi

