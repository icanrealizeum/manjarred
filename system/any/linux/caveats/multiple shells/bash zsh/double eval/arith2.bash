#!/bin/zsh -x
#!/bin/bash
#both do this!

#to see the shell it's actually running with
#ps uw $$

#src: https://docs.fedoraproject.org/en-US/Fedora_Security_Team/1/html/Defensive_Coding/sect-Defensive_Coding-Shell-Double_Expansion.html

b=2
a='b'
#a=2

#if test $a -eq 2; then #correct way
if [[ $a -eq 2 ]]; then #buggy way
#if [[ a -eq 2 ]]; then #works
#if [[ b -eq 2 ]]; then #works
  echo "well shiet"
fi

