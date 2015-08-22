#!/bin/bash

idbad='['
declare -A ar
set -x
idevil='`ls`'
let "ar[$idbad]=1"
let 'ar[$idbad]=1'
#let 'ar[$idevil]=1'
let "ar[$idevil]=1"
declare -p ar
#((ar[$idevil]=2))
#declare -p ar
#(("ar[$idevil]=2"))
#declare -p ar
id="something"
declare -A ar
let "ar[$id]=1"

