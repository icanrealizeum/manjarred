#!/bin/bash

declare -i a
b='a'
a=1
a+=1
echo $a #2

let "a+=1"
let "$b+=1"
echo $a  #4
let '$b+=1' #fail, obviously

