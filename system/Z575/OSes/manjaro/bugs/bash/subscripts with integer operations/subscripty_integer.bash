#!/bin/bash
#tested under: GNU bash, version 4.3.33(1)-release (x86_64-pc-linux-gnu) of Gentoo Linux, package: app-shells/bash-4.3_p33-r1
# also tested on the same version on Linux Manjaro: GNU bash, version 4.3.33(1)-release (x86_64-unknown-linux-gnu) /usr/bin/bash is owned by bash 4.3.033-1, /bin -> usr/bin/

set -u
set -x
set +e

declare -A ar=()
idgood="goodstring"
idbad1="bad string"
idbad2="["

let ar[$idgood]+=1  #works
echo "${ar[$idgood]}"

let ar['$idbad1']+=12 #works but it's a workaround
echo "${ar[$idbad1]}"

let ar['$idbad2']+=33 #works but it's a workaround
echo "${ar[$idbad2]}"

let ar[$idbad1]+=44 #fail: + let 'ar[bad' 'string]+=44'
#./subscripty_integer.bash: line 21: let: ar[bad: bad array subscript (error token is "ar[bad")

let ar[$idbad2]+=55 #fail: + let 'ar[[]+=55'
#./subscripty_integer.bash: line 24: let: ar[[]+=55: bad array subscript (error token is "ar[[]+=55")


ar["$idbad1"]+=12 #works but it's considered as string which makes sense! but just showing that this works for string types, but not for `let` above
echo "${ar[$idbad1]}"

ar["$idbad2"]+=33 #works but it's string as expected; but set -x doesn't show value of $idbad2 when displaying: + ar["$idbad2"]+=33
echo "${ar[$idbad2]}"
echo "${ar["["]}"


echo "before0: ${ar[$idbad1]}"
((ar['$idbad1']++)) #works but not as you'd expect(ie. it evaluates $idbad1); set -x shows: + (( ar[$idbad1]++ ))
echo "after0: ${ar[$idbad1]}"
((ar['$idbad2']++)) #works, workaround

#echo "before1: ${ar[$idbad1]}"
((ar[$idbad1]++)) #works as expected! set -x shows: + (( ar[bad string]++ ))
#echo "after1: ${ar[$idbad1]}"
((ar[$idbad2]++)) #fails: ((: ar[[]++: bad array subscript (error token is "ar[[]++")


#echo "before2: ${ar[$idbad1]}"
((ar["$idbad1"]++)) #works as expected!
#echo "after2: ${ar[$idbad1]}"
((ar["$idbad2"]++)) #fails: ((: ar[[]++: bad array subscript (error token is "ar[[]++")


