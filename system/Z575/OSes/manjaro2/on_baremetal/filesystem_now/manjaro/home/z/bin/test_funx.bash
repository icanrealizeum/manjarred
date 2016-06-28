#!/bin/bash                                                                     

thisscript="$0"

__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; }
source funx.bash || __die 100 "funx.bash not in PATH"                           

greenfg()
{
  echo -n "`tput setaf 2`" >&1
}

redfg()
{
  echo -n "`tput setaf 1`" >&1
}

nocolor()
{
  echo -n "`tput sgr0`" >&1
}

retorfail() {
	# $1 return value to test for
	rv=$? #capture prev. statement's exit code
  expec="$1"
	if test ! "$rv" -eq "$expec"; then
    die 1 "`redfg`!!! test fail(with $rv instead of $expec) at line ${BASH_LINENO[0]} in $0`nocolor`" >&2
  fi
	#doc for BASH_LINENO array https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
}

if isroot ; then
    echo "you must not be root! press a key, not shift/ctrl/alt"
    read -n 1 -s
    exit 1
fi

# BEGIN TESTS:
( ensuredir_ordie "/" 4 )
retorfail 0

( sometdir="$(mktemp -d -p /tmp -u)" ; trap 'rmdir -- "$sometdir"' 0; ensuredir_ordie "$sometdir" 4 )
retorfail 0

#I guess don't run this as root, but just in case we clean up
( sometdir="$(mktemp -d -p / -u)" ; trap 'rmdir -- "$sometdir"' 0; ensuredir_ordie "$sometdir" 4 )
retorfail 4

( validcommand id )
retorfail 0

( validcommand id file )
retorfail 0

( validcommand id alias file )
retorfail 0

( validcommand id crap alias file zoo )
retorfail 0

( validcommand id crap )
retorfail 102

( validcommand type crap alias builtin file )
retorfail 0

( validcommand type )
retorfail 0

( validcommand type builtin)
retorfail 0

( validcommand "/usr/bin/id" )
retorfail 0

( validcommand "/usr/bin/id" file )
retorfail 0


( validcommand "/usr/bin/id" "file builtin" )
retorfail 0

( validcommand "/usr/bin/id" )
retorfail 0


( validcommand validcommand )
retorfail 0


( execute validcommand )
retorfail 144

ACCEPTED_COMMANDTYPES_FOR_EXECUTE="alias function"
( execute validcommand id )
retorfail 0
unset ACCEPTED_COMMANDTYPES_FOR_EXECUTE
( execute validcommand id )
retorfail 144

( ensure_existing_commands_or_die "id type" "file" "10" "some msg" even more of msg )
retorfail 10

( ensure_existing_commands_or_die "id type" "builtin file" "10" "some msg" even more of msg )
retorfail 0

#nope: ( PATH= is_intnum '' ) #see? this is why stopexternal should not have to depend on external commands!
#nope: ( alias grep='echo within;exit 2' ; hash -r; shopt -s expand_aliases; is_intnum '' ) #the alias is unseen within the invocation of is_intnum ; for some reason!
( PATH= FALLBACK_DONTDIE=ye is_intnum '' )
retorfail 44

echo "//ignore any seemingly-errors in previous output, they are part of the tests and left there for the case when things do fail, to see what did, more clearly."
echo "!!! ALL GOOD !!!"



( is_intnum '' )
retorfail 1

( is_intnum '1' )
retorfail 0
( is_intnum '-1' )
retorfail 0
( is_intnum '-910' )
retorfail 0
( is_intnum '218' )
retorfail 0
( is_intnum '218.0' )
retorfail 1
( is_intnum '-8.0' )
retorfail 1
( is_intnum 'a' )
retorfail 1

set -e
startexternal
( exit 2 )
stopexternal || retorfail 2



#-------------keep this last:
echo "ALL DONE."
