#!/usr/⁠bin/zsh -x

declare -⁠A ar
key='['
ar[$key]='string with spaces'
echo ${ar[$key]}

declare -⁠p ar

