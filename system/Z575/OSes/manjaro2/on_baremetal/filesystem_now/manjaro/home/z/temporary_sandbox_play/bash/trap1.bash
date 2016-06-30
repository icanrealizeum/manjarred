#!/bin/bash

declare -a moo
boo() {
  "${moo[@]}"
}


#"${moo[@]}"
a='.'

moo=(ls -la "$a")
boo

a='/'

trap -- boo EXIT

