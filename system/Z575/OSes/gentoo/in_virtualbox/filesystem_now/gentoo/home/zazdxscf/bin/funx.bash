#!/bin/bash

#include this in your script like so:
#__die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; };readonly -f -- __die
#source funx.bash || __die 100 "funx.bash not in PATH"                          #


#when set, tries to fallback to some (possible outdated) defaults instead of dieing - to be used only in tests
unset 'FALLBACK_DONTDIE'

#internally used function as a fallback:
_funxbash_die() { local ec=$1;shift;echo "$@" >&2 ; exit $ec; };readonly -f -- _funxbash_die

newline() {
	#echo -ne "\n"
	echo
};readonly -f -- newline  #set all functions to readonly to prevent and notice redefinitions

ensuredir() {
	#either directory exists? or make it
	test -d "$1" || mkdir -p -- "$1"
	return $?  #making it explicitly obvious that the exit code is returned, but this line isn't needed, for having the same effect!
};readonly -f -- ensuredir

ensuredir_ordie() { #{{{ //zf% to create these, but warning: you need to add spaces!
	ensuredir "$1" || die ${2:-3} "failed to create directory '$1'"
};readonly -f -- ensuredir_ordie #}}}

ensurelink() { #{{{
  #makes sure the link exists and points to source
  #if something else already exists this function fails and doesn't change anything!
	# $1 - source
	# $2 - link name
	# just for ln $1 $2

  local src="$1"
  local lnk="$2"
  if [ -z "$src" ] || [ -z "$lnk" ]; then
    die 97 "passed wrong number or empty params to function"
  fi

	if test -L "$lnk" ; then
    #the following means, that it will fail if the link destination doesn't exist
    #in other words, even if the link is valid that -e says it must point to an existing destination, so if destination doesn't exist this function will return fail
    #fixed by changing -e to -m
    local a="$(realpath -mP -- "$lnk")" # 2>/dev/null )"
    #that may fail with: `realpath: ‘/tmp/sources’: No such file or directory`
    #but exitcode is not seen here
    #also redirecting stderr to avoid showing that error
    if [ -z "$a" ]; then
      return 1
    fi
#    local ec="$?"  #can't catch exit code 1 from above realpath
#    if test ! "$ec" -eq "0" ; then
#      return $ec
#    fi
		local b="$(realpath -mPs -- "$src")"
    if [ -z "$a" ]; then
      return 2
    fi
#    ec="$?"
#    if test ! "$ec" -eq "0" ; then
#      return $ec
#    fi
		if test "$a" = "$b" ; then
			#if already linked to the expected source
			return 0
		fi
	fi
  if [ -e "$lnk" ] || [ -L "$lnk" ]; then
    # a file or link or directory exists
    # and it's not the expected one
    # do we remove it if it's a symlink? guess not
    return 3
  fi

  #well if we're here likely $lnk doesn't already exist
  ln -Tsv "$src" "$lnk"
	#	return $? #implicit from above ^
} #}}}

ensurelink_ordie() {
  ensurelink "$1" "$2" || die ${3:-4} "failed to create link '$2' to '$1' It is likely that something already exists as '$2' = '$(realpath -mP -- $2)'"
	#TODO: show the existing link IF ANY
}

declare -a +x setflagsstack #should this be exported? this would be bad unless we can do locking or ensure only one thread is executing ever; so +x means not export!

startexternal()
{
  #run this before executing a command that returns an exit code which `set -e` would react to by exiting
  # this will keep your current `set -e`(or +e) setting, and work regardless of it - if you call stopexternal !!
  #saves all flags(which can be read from $- , see 'help set'
  #by pushing to a stack, because supposedly calls to this function could be nested: ie. call startexternal twice before reaching stopexternal
  #set -e  is set -o errexit  (not shopt related)
  local currentflags="$-"
  setflagsstack+=( "$currentflags" )

  #now, avoid the next external command(s) from exiting
  set +e
}

stopexternal()
{
  # after you run your external command, call this to restore set flags ($-)
  local backupec="$?"
  local len="${#setflagsstack[@]}"
  if test "$len" -le 0; then
    die 13 "$FUNCNAME without start, because stack is empty($len)"
  fi
  local idx="${!setflagsstack[@]}"
  if test -z "$idx"; then
    die 14 "this should not happen"
  fi
  #need to gget last index, instead of thinking last index is len minus 1 - that's not how it works!
  local lastidx="${idx##* }" #apparently that space is not IFS !
  local oldflags="${setflagsstack[$lastidx]}"
  #delete last aka pop stack
  unset 'setflagsstack[$lastidx]'  #yah, no kidin those single quotes!

  #restore previous flags before the startexternal call
  #FIXed: need to set +allpossibleflagshere then set -oldflags; the problem is though, if some more options ever get added, i will be missing them
  #TODO; can we make this not depend on externals? OR at least make them required somehow
  local allpossibleflags="`help set|head -1|cut -d' ' -f3 | sed -e 's|[^a-zA-Z0-9]*||g'`"
  if test -z "$allpossibleflags"; then
    if test -n "${FALLBACK_DONTDIE}"; then
      allpossibleflags="abefhkmnptuvxBCHP"
    else
      die 77 "something went wrong, here's PATH='$PATH'"
    fi
  fi
#  local allpossibleflags="abefhkmnptuvxBCHP"
  set "+$allpossibleflags" || die 99 "failed to set"
  set "-$oldflags" || die 100 "failed to set"
  return "$backupec" #FIXME: well this doesn't work since we restored set -e this will cause exit, unless stopexternal || echo $? or similar
}

is_intnum()
{
  #TODO: ensure grep is available //or err!
  val="$1"
  startexternal
#  set -x
#  shopt |grep -i alias
  grep -q --extended-regexp -- '^-?[0-9]+$' <<< "$val"  #thanks to Marius aka unkn
  stopexternal
  local ec="$?"
  case "$ec" in
    0|1) return "$ec" ;;
    *) die 44 "unexpected error $ec, maybe 'grep' not found?" ;;
  esac
#  if test "$?" -eq 0; then
#    return 0 #is num
#  else
#    return 1 #fail
#  fi
};readonly -f -- is_intnum

isnum()
{ #kept for backwards compatibility reasons
  #checks if $1 is an integer number - doesn't handle "." or ","
  #TODO: rename to is_intnum or something
  #src: https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash/3951175#3951175
  #TODO: $# must be 1 else fail
  
  case "$1" in
    ''|*[!0-9]*) return 1 ;; #bad
    *) return 0 ;; #good
  esac
};readonly -f -- isnum

getnum_or_default(){
  if test ! "$#" -eq "2"; then
    _funxbash_die 211 "not enough params to function, passed: $@"
    return 211 #just in case die doesn't die?
  fi
  local ret="$1"
	if ! isnum "$1"; then
		ret="$2"
	fi
	echo -n "$ret"
	#TODO: testcase for this func
}

die() { 
	local defnum="209"
	local wantedexitcode="$1"
	local ec=$(getnum_or_default "$wantedexitcode" "$defnum")
	if test ! "$ec" -eq "$defnum" -o "$wantedexitcode" = "$defnum" ; then
		shift
	fi
	#TODO: testcase for above ^
	#TODO: add color to $@ below, since it's the message preceeding the stacktrace
	get_stack "$@"
	echo "$STACK" >&2
	exit $ec
}
readonly -f -- die

function get_stack() {
#original source from: https://stackoverflow.com/questions/11090899/bash-find-line-number-of-function-call-from-sourcing-file/17734099#17734099
#modified
STACK=""
local i message="$@"
local stack_size=${#FUNCNAME[@]}
#doc for these bash variables: https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
# to avoid noise we start with 1 to skip the get_stack function
for (( i=1; i<$stack_size; i++ )); do
	local func="${FUNCNAME[$i]}"
	#	[ x$func = x ] && func=MAIN
	local linen="${BASH_LINENO[$(( i - 1 ))]}"
	local src="${BASH_SOURCE[$i]}"
	[ x"$src" = x ] && src=non_file_source

	#STACK+=$'\n'"   at: "$func" "$src" "$linen
	local tmpvar
  #printf is a shell built-in
	printf -v tmpvar "%-${i}s vim +$linen $src $func()" 
	STACK+="$tmpvar" #$'\n'"   at: $func $src $linen"
	# no new line for the last one
	# actually we need a vertical space for visibility, so allow it
	#	if [ $i -lt $(( $stack_size - 1 )) ]; then
	STACK+=$'\n'
	#	fi
done
if [ -n "$message" ]; then
	message+=$'\n'
fi
STACK="${message}Stacktrace:"$'\n'"${STACK}"
#return "$STACK" can't really return string
}

isroot() {
	test "`id -u`" = "0"
}

quotify() {                                                                     
	local argz=""
	for arg in "$@"; do
		argz+='"'${arg}'" '
	done
	#return and also remove end space
	echo "${argz% }"
}


validcommand() {
	# $1 command to check for
	# $2- (optional) what type of command is it expected to be one or more of: alias, keyword, function, builtin, file; it's considered to be an OR of the specified ones. So if it's a builtin OR a file  for example, it will return ok.
	# this $2 can be one parameter space separating the list of words, or multiple parameters ($2 $3 $4) ...
	if test "$#" -lt "1" ; then
		die 211 "not enough params to function, passed($#): $@"
		return 211 #just in case die doesn't die?
	fi
	local cmd="$1"
	shift
	local expectedtype=("$@")
	# "type" is built-in, unlike "which"
	local istype="$(type -t -- $cmd)"
	#echo $istype
	if [ -n "$istype" ]; then
		# non-empty means it's found to be something
		# at this point it's an alias, builtin, file etc. see help type within a bash prompt
		#echo ${#expectedtype[@]}
		#echo "'${expectedtype[@]}'"
		#echo "'$@'"
		#echo "$#"
		if test "0" -lt "${#expectedtype[@]}" ; then
			# array size is greater than 0
			for each in ${expectedtype[@]}; do
				if test "$each" = "${istype}" ; then
					#is of expected type aka found one
					return 0
				fi
			done
		else
			# no expected type is to be enforced then.
			return 0
		fi
	fi
	return 102 #doesn't exist
}

ensure_existing_commands_or_die() {
	# $1 list of commands as string with spaces
	# $2 command types expected such as "file builtin alias" - if any matches, it'll be good; each command's type is matched against ANY in this list.
	# $3 exit code on die
	# $4- die msg
	local cmdlist=("$1")
	local cmdtypes="${2:-}" #set -u  will yell here if using $2 hence why this
	local dieec="${3:-}"
	shift 3
	local diemsg="$@"
	for prog in $cmdlist; do
		if ! validcommand "$prog" $cmdtypes ; then
			die "$dieec" "${diemsg[@]}" "$prog"
		fi
	done
}

execute() {
	# $1 command (must be builtin of file or a space separated list in env var $ACCEPTED_COMMANDTYPES_FOR_EXECUTE  which is considered to be ok if any of those listed there are matched.)
	# $2- params to command

	if test "$#" -lt "1" ; then
		die 211 "not enough params to function, passed($#): $@"
		return 211 #just in case die doesn't die?
	fi

	local accepted="$ACCEPTED_COMMANDTYPES_FOR_EXECUTE"

	if [ -z "$accepted" ]; then
		accepted="file builtin"
	fi

	#what=$(eval echo "$@")                                                       
	#what="$(printf '%q' "`quotify "$@"`")"
	#local cmd="$(printf '%q' "`quotify "$1"`")"
	#local cmd="$(quotify "$1")"
	local cmd="$1"
	#what=$(eval echo "$what")
	shift
	local what="$(quotify "$@")"
	#local what="$(quotify `printf '%q' "$@"`)"
	#local what="$(printf '%q' "`quotify "$@"`")"
	#what="$@"
	[ -n "$DEBUG" ] && echo "Executing: \`$cmd\` with params: \`$what\`" >&2 
	if ! validcommand "$cmd" $accepted ; then
		die 144 "Command not found: '$cmd' (had params '$what')"
	fi
	#exec $what
	arr=("$@")
	#echo $# ${arr[@]}
	#local -a argz
	#for arg in "${arr[@]}"; do
	#	argz[${#argz[*]}]="$(escapeify "$arg")"
	#	echo -e "${argz[@]}\n"
	#done
	#"$cmd" "${argz[@]}"
	"$cmd" "${arr[@]}"
	# returns the exitcode from executing the command
	#$(eval echo $what)
}


escapeify() {
	#FIXME: what to do when more than 1 param, leave spaces in between? currently all params given are treated as ONE long PARAM
	execute printf "%q" "$@"
}

promptkey() {
	# prompt user with a message to press any non-shift key
	# $1 seconds to timeout, 0 to not even prompt, or -1 to prompt forever(no timeout)
	# $2- prompt message

	#indefinite aka no timout
	local timesec=""
	if [ "$1" != "-1" ] && isnum "$1"; then
		#FIXME: use arrays here too
		timesec="-t $1"
		shift
	fi

	if [ -n "$1" ]; then
		prompty=( -p "$*" )
		#prompty="-p $@"
		#echo "${#prompty} lennnnnnnnnnnn" 
		#echo "${prompty[@]}"
	fi
	#DEBUG=1
	execute read -n 1 -s $timesec "${prompty[@]}"
	#new line:
	newline
	clrbuf
	#	return $? #implicit
}

clrbuf() {
	#doc http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html
	# could use 0 but may not work on earlier bash version below v4
	execute read -N 9999999 -r -t 0.1 -s --
	#because read never returns 0 in this case
	return 0
}


safepromptkey() {
	clrbuf
	promptkey "$@"
}


#FIXME: fmr (foldmarker) below are totally ignored (or likely overriden by something else) even though fdm (foldmethod) works (can change to 'syntax' for example)
# vim:set fmr={{,}} foldmethod=marker fmr={{,}} shiftwidth=2 softtabstop=2 expandtab:

