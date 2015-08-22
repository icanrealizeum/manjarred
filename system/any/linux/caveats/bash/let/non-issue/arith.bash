#!/bin/bash

#a='$(echo -n "1" >> times.txt)'
a='`echo -n "1" >> times.txt`'
#a='$$'

#good, they don't work!

b="$(($a+1+$a))"

echo "$b"

