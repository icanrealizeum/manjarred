#!/bin/bash

#key='`ls`' ; declare -A ar ; (( ++ar[$key] )) ; declare -p ar
set -x
declare -A ar
key='`echo -n "1">>times.txt`'
((++ar[$key])) # cmd in $key gets executed twice too
declare -p ar

#let "++ar[\$key]" #correct
#let '++ar[$key]' #correct
#((++ar[\$key])) #correct
#(("++ar[\$key]")) #correct
#(('++ar[$key]')) #correct
#declare -p ar

#wrong & exploitable: & the command in $key is executed twice

#key='`ls`' ; declare -A ar ; let "++ar[\$key]" ; declare -p ar
#key='`ls`' ; declare -A ar ; let '++ar[$key]' ; declare -p ar

