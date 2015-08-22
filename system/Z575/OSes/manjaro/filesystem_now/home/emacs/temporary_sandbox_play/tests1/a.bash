#!/bin/bash

#echo "a" >>>"$params"

#params=<<EOF
#a
#b
#c
#d
#e
#EOF

expanded="blah"
read -d '' params <<EOF
some $expanded var
newline
here
EOF

echo "$params"

read -d '' -a arr <<EOF
a
b
c
d e f
g
EOF
echo "${#arr[@]} ${arr[@]}"

