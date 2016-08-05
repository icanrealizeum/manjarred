# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

#colored man pages (when using xfce4-terminal) (when using urxvt this is not needed, they have colors)
#export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
#export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
#export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
#export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
#export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
#export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
#export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode
#^ using urxvt so not needed, hence why all are commented out

#echo '/home/emacs/build/1packages/kernel/linuxgit/makepkg/linux-git/src/linux-git'
#echo '/home/emacs/build/kernel/linux316/makepkg/linux316/src/linux-3.16'
#echo '/home/emacs/build/2/packages-core/linux316/makepkg/linux316/src/linux-3.16-rc4'
#echo '/home/emacs/build/packages-core/linux3154/makepkg/linux315/src/linux-3.15'
#echo '/home/emacs/build/packages-core/linux312/makepkg/linux312/src/linux-3.12'
#echo '//current is:'
#head -2 /var/lib/dkms/vboxhost/kernel-3.15.4-1-MANJARO-x86_64/log/make.log 
#echo .
#tail -n28 /var/log/catalyst-install.log | head -4
#tail -n32 /var/log/catalyst-install.log | head -4

if test -f "/etc/bash_completion" ; then
	. /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -u cdspell
#don't correct minor spelling errors in: cd dir ie. cd linux-git vs cd linuxgit


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

#never expand history when encountering "!"
set +H

export HISTSIZE=-1
export HISTFILESIZE=${HISTSIZE}
#export HISTCONTROL=ignoreboth
export HISTCONTROL=ignorespace
#unset HISTCONTROL
#^ XXX: changing dirs in mc causes a ' cd dirhere' (notice first space) to be saved in history! so we should at least use ignorespace; UNLESS we wanna know which folder we were in when we executed the specified command hmmm, maybe that's a good idea actually! leave it for now!
unset HISTIGNORE
export HISTTIMEFORMAT='%F %T '
#^ doc: http://www.thegeekstuff.com/2008/08/15-examples-to-master-linux-command-line-history/#more-130
export FUNCNEST=30000
unset GLOBIGNORE
export EDITOR="vim"
unset EMACS
unset CDPATH

#----------
#using custom Rust and Cargo
#rust is dynamically linked; FIXME: when I have rust, uncomment the relevant stuff here:
#rustroot="/home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2"
##rustroot="/home/emacs/build/cargo/rustc"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$rustroot/lib"
#cargo is statically linked
#cargoroot="/home/emacs/build/cargo/target/x86_64-unknown-linux-gnu"
#both should be in PATH because with just aliases cargo will fail
#export PATH="$PATH:$rustroot/bin:$cargoroot"

alias rustfmt='/home/z/build/1nonpkgs/rustfmt/target/release/rustfmt'
##alias rustc='LD_LIBRARY_PATH="/home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2/lib/" /home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2/bin/rustc'
##alias cargo='LD_LIBRARY_PATH="/home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2/lib/" PATH="/home/emacs/build/rust/x86_64-unknown-linux-gnu/stage2/bin/:$PATH" /home/emacs/build/cargo/target/x86_64-unknown-linux-gnu/cargo'
#----------

alias l='ls -rlact'
alias cd..='cd ..' #windows-like
alias sync='time sync'

#alias mc="(declare -gxr PS1=\"\$PS1mc\" ; echo $PS1; /usr/bin/mc; echo $PS1 )"
#alias mc="declare -gxr PS1=\"\$PS1mc\" ; echo $PS1; /usr/bin/mc; echo $PS1"
alias xz='xz --keep'
alias cls='tput clear' #\e[H\e[2J for rxvt-unicode-256color
alias cls2='echo -ne "\e[H\e[J"'
#. /usr/libexec/mc/mc.sh
#XXX: was current(in gentoo, fixed for Manjaro):
alias mc='. mc-wrapper.sh --nomouse --subshell'
#alias mc="lefil=\"\$(mktemp -u --tmpdir=\"/tmp\" -t -- \"mc.pwd.\$\$.XXXXX\")\" && if [[ -n \"\$lefil\" ]]; then
##--slow
#/usr/bin/mc --nomouse --subshell --printwd=\"\$lefil\" # 2>/tmp/mooe2
#lastwd=\"\$(cat \"\$lefil\")\"
#rm \"\$lefil\"
#echo \"\$lastwd\"
#cd \"\$lastwd\"
#fi
#"
#alias cm="mc --nomouse --subshell"
#using ~/bin/fox //alias fox='pushd /tmp && time firefox ; popd; echo Ignored args: '
alias cm=mc
#alias mp3='time mpg123 -C --loop -100 --cpu x86-64 --gapless --buffer 1024 --smooth --control --title --stereo --equalizer ~/mpg123.eq'
#alias mp3='time gst123 --repeat'
mp3dir(){
  local dir="$@"
  if test -z "$dir" ; then
    echo "using current folder, otherwise please specify one as a parameter"
    echo "feed more options to mpg123 in MPG123 env var: eg. MPG123=\"-2 --rva-mix\" $FUNCNAME"
    dir="."
  fi
  dir=`realpath $dir`
  # using temp file because remote control aka "-C" won't work when "-@ -"
  local fil="/tmp/mp3_alias.lst"
  echo "used \"$dir\" with list \"$fil\""
  time ( find "$dir" -ignore_readdir_race -iname '*.mp3' > "$fil" ;
   mpg123 --cpu x86-64 --gapless --buffer 1024 --smooth --control --title  --random -@ "$fil" --stereo --equalizer ~/mpg123.eq $MPG123
   # --delay 1 and --smooth are not playing nice
   # used ; instead of && because find will return exit code 1 when some dirs are inaccessible and reported as permission denied
   # never use --aggressive due to below fixme; also dont use --verbose because it doesnt fir in 80 cols
   #TODO: ^ find a way to fix mpg123 from repeating an empty list preventing C-c from happening; either quit if empty, or allow C-c ie. relinquish control; or that --delay n  where n is seconds before each track
#  gst123 --shuffle --repeat --list="$fil" --verbose #for some reason --list and -@ are not recognized!! some bug?
  )
}
#made it a file/script because mc wouldn't see it with completion
#alias zipwithpwd='zip -v -9 -r -T -e'  #follows: archive.zip *
alias sl='ls'
alias bc='bc -l' #decimals!
#estimated firefox:
#UA='Mozilla/5.0 (X11; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0'
#chromium now:
UA='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2756.0 Safari/537.36,gzip(gfe),gzip(gfe)'
alias downmp3="time youtube-dl --user-agent \"${UA}\" --extract-audio --audio-format mp3"
alias downaudio="time youtube-dl --user-agent \"${UA}\" --extract-audio"
alias downvideo="time youtube-dl --user-agent \"${UA}\""
alias downvideo1080p='downvideo -f 137+140'
alias lesscolor='less -R'
alias mv='/bin/mv -i'
alias cpu="( curdir=`pwd` ; cd ~/build/amdmsrtweaker-lnx/ && sudo ./go ; cd $curdir )"
alias cpushow="cpupower frequency-info ; ( curdir=`pwd` ; cd ~/build/amdmsrtweaker-lnx/ && sudo ./show ; cd $curdir )"


alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias grepcolor='grep --color=always -d skip'
alias cp="cp -i --reflink=auto"                          # confirm before overwriting something; and CoW; using auto instead of always due to: cp: failed to clone 'gcd_fix.patch' from '/tmp/le.patch': Invalid cross-device link  AND --reflink=auto is specified, fall back to a standard copy.

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias temps='( date && sensors && lsmod|grep -q fglrx && ( 
aticonfig --od-gettemperature ; 
aticonfig --od-getclocks ); 
test -d "/sys/class/drm/card0" && (
 ######## lsmod|grep -q radeon && (
cat /sys/class/drm/card0/device/power_dpm_state ; 
sudo -- cat /sys/kernel/debug/dri/0/radeon_pm_info 
if test -d "/sys/class/drm/card1" ; then
  cat /sys/class/drm/card1/device/power_dpm_state ; 
  sudo -- cat /sys/kernel/debug/dri/1/radeon_pm_info
fi 
) )'

# ex - archive extractor
# usage: ex <file>
ex ()
{
	if test -f "$1" ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
		*.tar.gz)    tar xzf $1   ;;
	*.bz2)       bunzip2 $1   ;;
*.rar)       unrar x $1     ;;
			*.gz)        gunzip $1    ;;
		*.tar)       tar xf $1    ;;
	*.tbz2)      tar xjf $1   ;;
*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
		*.Z)         uncompress $1;;
	*.7z)        7z x $1      ;;
*)           echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# prompt
# ESC can be used anywhere, it's all the same:
ESC1="\e"
ESC2="\033"
# careful to not expand history eg. !1
EXCLAMATION='!' #not with "" because it can trigger history

#tput idea from https://superuser.com/questions/337787/how-to-fix-my-bash-prompt-with-long-lines
FCOLOR_CYAN="$(tput setaf 6)"
#if [ "\e\033[6" != $FCOLOR_CYAN ]; then
#  echo "fail! $FCOLOR_CYAN"
#fi
BGCOLOR_CYAN="$(tput setab 6)"
COLOR_RESET="$(tput sgr0)"
COLOR_BOLD="$(tput bold)"
COLOR_UNDERLINE="$(tput smul)"
#echo ${BGCOLOR_CYAN}abc${COLOR_RESET}
PS_BLUE=${PS_STARTHIDE}${COLOR_BLUE}${PS_ENDHIDE}
PS_BOLDBLUE=${PS_STARTHIDE}${COLOR_BOLDBLUE}${PS_ENDHIDE}
#TODO: make function ^ see this(but use tput instead): http://misc.flogisoft.com/bash/tip_colors_and_formatting
#--------- function for \[ and \] in PS1
#must be used within PS1 when about to be evaluated once on PS1 assign (not every time when PS1 is displayed):
PS_STARTHIDE="\[" # that is, don't count chars between these two
PS_ENDHIDE="\]"
#the following must be used with echo within a function which returns result into a PS1, only when the function is called within displaying PS1 ! otherwise use "\[" and "\]" or else it won't work
#use when evaluated each time PS1 is displayed:
ECHO_STARTHIDE="\x01"
ECHO_ENDHIDE="\x02"
#example usage of ps_hide and echo_hide (note the quote-types):
#PS1="$(ps_hide $FCOLOR_CYAN)"'\W\$''$(echo_hide $COLOR_RESET)'
#the ps_hide() call is evaluated once, on assign
#the echo_hide() call is evaluated on every display of PS1
#echo $PS1
#set|grep PS1
ps_hide() {
	# don't use this in functions called every time PS1 is displayed, for that use echo_hide()
	# eg. PS1="$(func param)" note the double quotes!
	# wrap params into \[ and \] for the PS1 prompt, which doesn't count chars because they are just setting the colors or it's \a
	# ideally you specify just one param $1 within ""
	echo -n "${PS_STARTHIDE}${@}${PS_ENDHIDE}"
	#	echo "ran" >&2 # this wouldn't show on every prompt display, if you're using this function correctly!
}
echo_hide() {
	# for PS1 \[ \] when the function is called every time when displaying PS1
	# eg. PS1='$(func param)' note the single quotes!
	echo -ne "${ECHO_STARTHIDE}${@}${ECHO_ENDHIDE}"
	#	echo "ran" >&2  # this would show on every prompt display, if you're using this function correctly!
}
#---------

#doc on PS1 PS2 PS3 PS4 etc http://www.thegeekstuff.com/2008/09/bash-shell-take-control-of-ps1-ps2-ps3-ps4-and-prompt_command/
#PS4 is active when set -x
export PS4='$0:$LINENO+ '
#"Bash shell executes the content of the PROMPT_COMMAND just before displaying the PS1 variable."
#export PROMPT_COMMAND='date "+%Y/%m/%d %H:%M:%S"'

#MC_PS1='[\u@\h \W]\$ '
#PS1='[\u@\h \W]\$ '
#doc prompt escape sequences: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
#PS1='\a\[\033[1;34m\]\d \t\[\033[0m\] \u@\H \s\V term:\l jobs:\j \n\w\n[\! \[\033[0;36m\]\#\[\033[0m\] $?]\$ '
#PS1="\[${FCOLOR_CYAN}\]abc\[${COLOR_RESET}\]"
#o1=$(echo -ne "\[")
#o2=$(echo -ne "\]")
#PS1="${o1}${FCOLOR_CYAN}${o2}abc\[${COLOR_RESET}\]"
#CAVEAT: background color must be specified after the foreground color, or else in some cases when foreground color is "0;" in front, won't let background color activate; WAIT, that 0; in front is the background color! no kiddin! except the case when it's 1; then it only bolds but leaves whatever bg color was previously!
#//name PROMPTAH to facilitate searches between the commands output in a terminal
export MC_PS1='\W \$ '
#PS1mc='[\u@\h \W]\$ '
#set_bash_prompt(){
#  #__earlyec="$?"
#  __earlyec=("${PIPESTATUS[@]}")
#}
#declare -x set_bash_prompt #no effect


#TODO: see this before redoing PS1 with colors http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt

#this line must be after the PS1=  line  to allow overriding!
if ps ${PPID} | grep mc; then
	export PS1="$MC_PS1"
else
	#can use the user@host instead and in worst case would search for @host

export PS1='\
-----------\n\
\[\a\]\
\[\e[1;37m\e[42m\]\u@\H\[\e[0m\] \
\[\033[1;30m\]$(date "+%Y/%m/%d %H:%M:%S")\[\033[0m\] \
\[\e[0;37m\]\s\V t:\l j:\j \
d:${SHLVL} pp:${PPID} p:$$ ut`cat /proc/uptime | cut -f1 -d'.'`\[\e[0m\]\n\
\[\e[0;37m\]!\!\[\e[0m\] \
\[\033[0;36m\]\#\[\033[0m\] \
$(evalexitcode "${__earlyec[@]}" ) \
\[\e[0m$(uname -r) $(uname -v)
$(ps_lepath "\w") \[\e[1;32m\]\$\[\e[0m\] \
'
#\e[1;32m\]\$\[\e[0m\]\n\

#FIXME: can't get rid of the extra space at the end between ") \" on line: $(evalexitcode "${__earlyec[@]}" ) \   because bash(4.3.42) fails with syntax error
# works in 4.4_alpha-r1

#export PROMPT_COMMAND=set_bash_prompt #getting errors as root: bash: set_bash_prompt: command not found   when running eg. time emerge --depclean  -av x11-misc/xscreensaver   (while it doesn't exist as an atom, because I did an --unmerge earlier! why would xfce4-session depend on it no idea - should be optional!)
export PROMPT_COMMAND='__earlyec=("${PIPESTATUS[@]}")'  #this totally works!
export PROMPT_DIRTRIM=2

fi
#PS1='[\u@\h \W]$$ ${PPID}\$ '

#works:
#PS1='`date`\
	#'
#fail:
#PS1='$( date )\
	#'
#doc color codes: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

ps_lepath() {
	# the params are already expanded because of the call $(ps_lepath \w)
	# unless $(ps_lepath "\w") which keeps it, oddly enough
  #wanted ~ home expanded for copy/paste reasons - although maybe I shouldn't because it's being used far too rarely
#	local lepath="${@/\~/`realpath ~`}"
	local lepath="$@"
  local lepath2="${@#\~}"
  if test "$lepath" != "$lepath2" ; then
    lepath="`realpath ~`${lepath2}"
  fi
	#	[[ $- = *f* ]]; oldf=$?  # Save -f state
	#	set -f                   # Disable globbing
	#	echo ~ >&2
	# ^ in fact set -f has no effect here, it'll still expand! probably must be run before the script is executed!
	#	echo "$lepath" >&2
	#	echo '~' >&2
	#	echo "~" >&2
	#	(( $oldf )) && set +f    # Reset -f if necessary
	#set -f  save/restore from: http://www.fvue.nl/wiki/Bash:_Backup_and_restore_settings#Single
	#TODO: also add test(s)
	#	set -f  #(for tests) equivalent with: setopt noglob
#  echo "$lepath"
#  lepath="${lepath/\~/`realpath ~`}"
#  echo "$lepath"
#	if [[ '$lepath' != "${lepath/^\~//}" ]]; then
#		#if caller quotes the passed parameters to this function, we sill attempt to glob expand ~ home
#		# but we only bother if globbing is set
#		if [[ ! $- = *f* ]]; then
#			#globbing is set then let bash expand it
#			lepath=~
#			#			echo "this other path" >&2
#		else
#			#noglob then we have to expand it
#			lepath=$(realpath ~) #|| die 9 "realpath command not found in path"
#			#			echo "this path" >&2
#		fi
#		#		echo -ne "\x01\e[1;34m\x02$(echo -n ~)\x01\e[0m\x02"
##    lepath="${lepath}${lepath/^\~//}"
#	fi

#	echo 'cd '$(printf %q "${lepath}")' &&'
	echo "$(printf %q "${PWD}")"
  echo "$(printf %q "${lepath}")" # `echo -ne "\x01\e[1;32m\x02\$\x01\e[0m\x02"`" #lepath is affected by PROMPT_DIRTRIM ; \$ or any variation of it wouldn't be interpreted correctly and would always show $ even when root! that is by using this variant here.
	#TODO: add colors ^
	#printf escape from: http://brandon.northcutt.net/article/Automatically+Escaping+a+Path+in+BASH/20130629.html
}

evalexitcode() {
  local ps="$@"
  for i in ${ps[@]}; do  #yep no double quotes!
    if test "$i" -ne "0" ; then
      echo -ne "\x01\e[1;31m\x02${i}\x01\e[0m\x02 "
    else
      echo -ne "\x01\e[1;30m\x02${i}\x01\e[0m\x02 "
    fi
  done
}

export PATH=${PATH}:~/bin
#temp:
#export PATH=~/bin:$PATH


# 'whoneeds' replacement via pactree
#from: https://github.com/Daenyth/pkgtools/issues/40#issue-2490117
whoneeds() {
	comm -12 <(pactree -lru $1|sort) <(pacman -Qqe|sort) | grep -v $1
}


#fixed because wasn't export-ed: the -I here has no effect! when using normal less
export LESS="-+X -R -+S -+F -+E -I"
#-i ignore case when searching
#-I Like  -i,  but searches ignore case even if the pattern contains uppercase letters.

#for git, the order of preference is:
#the $GIT_PAGER environment variable,
#then core.pager configuration,
#then $PAGER,
#and then the default chosen at compile time (usually 'less').
#export PAGER="less $LESS"
export PAGER="less" #use this to avoid a manpager issue, see: https://bugs.gentoo.org/show_bug.cgi?id=559490 and also use it to be compatible with anything in the future; thanks SpanKY
export GIT_PAGER="$PAGER"


eval `dircolors`

#alias mmc='cd /home/emacs/build/raw_syslinux/syslinux-6.03-pre20; mc'
#cat <<EOF
#com32/lib/fread.c
#com32/lib/syslinux/floadfile.c
#com32/lib/sys/fileread.c
#core/fs/fs.c
#core/fs/getfssec.c
#core/timer.inc
#core/bios.c
#core/fs/diskio_bios.c
#core/diskstart.inc
#vim /home/emacs/build/kernel/linuxgit/makepkg/linux-git/src/linux-git/drivers/usb/early/ehci-dbgp.c
#vim /home/emacs/build/kernel/linuxgit/makepkg/linux-git/src/linux-git/arch/x86/kernel/early_printk.c
#vim /home/emacs/build/kernel/linuxgit/makepkg/linux-git/src/linux-git/kernel/smp.c +552
#vim /home/emacs/build/kernel/linuxgit/makepkg/linux-git/src/linux-git/arch/x86/kernel/smpboot.c +529

#cd "/home/emacs/build/kernel/linuxgit/makepkg/linux-git/src/linux-git"&& vim kernel/smp.c 
#cd "/home/emacs/build/kernel/linuxnet/makepkg/linux-net/src/linux-net/"
#cat <<EOF
#/var/tmp/portage/www-client/firefox-40.0.3/work/mozilla-release/gfx/layers/basic/X11BasicCompositor.cpp
#EOF
alias mountmsproduo='sudo mount /dev/sdc1 ~/here -o uid=1000,gid=100'
alias ejectmsproduo='sudo umount here ; sync && sudo eject /dev/sdc'


# http://cscope.sourceforge.net/cscope_vim_tutorial.html
export CSCOPE_DB="/home/z/cscope/"


# from: https://code.google.com/p/chromium/wiki/LinuxFasterBuilds#Linking_using_gold
export CCACHE_SLOPPINESS=include_file_mtime
#export CCACHE_BASEDIR="/home/emacs/build"

#see man ccache, basically ignore compiler's executable(or path) changing
#export CCACHE_COMPILERCHECK="none"
#^ ok let's not do this because it may be the source of Illegal Instruction (s)

#defined and thus enabled:
#export CCACHE_COMPRESS=""
#undefined and thus compression is disabled:
unset CCACHE_COMPRESS
export CCACHE_NOCOMPRESS=1
#set ^ CCACHE_NOCOMPRESS to force no compression
#uncomment to log when unusual errors happen or too many cache misses
#export CCACHE_LOGFILE="/tmp/ccache.log"

#export force_s3tc_enable=true


#will interfere with openwrt build if set
#see http://wiki.openwrt.org/doc/howto/buildroot.exigence
#they weren't set now, but just making sure
unset GREP_OPTIONS
unset SED


#make a vim folder in /tmp to avoid any collisions with other programs potentially creating a same name .swp file, who knows
vimdir="/tmp/vim"
#^ sould be same as .vimrc 's set directory=
test -d "$vimdir" || mkdir --parents --mode=700 -- "$vimdir"
#^ root will also use the same folder due to .vimrc being shared
#FIXME: maybe make tmpfiles.d make this folder...



#export DEBUG=1
#delete:
export -n DEBUG
unset DEBUG

#You can use the -report option or define the FFREPORT environment variable (to any value) to get the exact command line and the full verbose console output in a file named ffmpeg-*.log in the current directory.
#export FFREPORT=ffmpeg-any-value-here-will-do-and-creates-ff*.log-files
#ok disabling this:
export -n FFREPORT
unset FFREPORT
#src: https://www.ffmpeg.org/bugreports.html


#XXX: for when running within virtualbox! this will warn you that the audio is slower in pitch!
#dmesg|grep 'clocking to' | grep -v 48000 |grep -v grsec| grep 'clocking to'
#true


#for grub 'To avoid automounting and auto(un)installing with /boot'
export DONT_MOUNT_BOOT=1

alias bt='echo 0 | gdb -batch-silent -ex "run" -ex "set logging overwrite on" -ex "set logging file gdb.bt" -ex "set logging on" -ex "set pagination off" -ex "handle SIG33 pass nostop noprint" -ex "echo backtrace:\n" -ex "backtrace full" -ex "echo \n\nregisters:\n" -ex "info registers" -ex "echo \n\ncurrent instructions:\n" -ex "x/16i \$pc" -ex "echo \n\nthreads backtrace:\n" -ex "thread apply all backtrace" -ex "set logging off" -ex "quit" --args'
#usage: bt crashed_program_filename
#src: https://blog.cryptomilk.org/2010/12/23/gdb-backtrace-to-file/

export RUST_BACKTRACE=1
#export -n RUST_BACKTRACE
#unset RUST_BACKTRACE

export MAKEFLAGS=' -j4 '

#temporary rustc and cargo path
#export PATH="${PATH}:/home/zazdxscf/build/1nonpkgs/rust/rust/x86_64-unknown-linux-gnu/stage2/bin:/home/zazdxscf/build/1nonpkgs/rust/rust/x86_64-unknown-linux-gnu/stage1/bin:/home/zazdxscf/build/1nonpkgs/cargo/cargo/target/x86_64-unknown-linux-gnu/release:/home/zazdxscf/build/1nonpkgs/rust/rust/x86_64-unknown-linux-gnu/stage0/lib/rustlib/x86_64-unknown-linux-gnu/bin/:/home/zazdxscf/build/1nonpkgs/rust/rust/x86_64-unknown-linux-gnu/stage0/bin/"


#workaround for ugly graphics (eg. on lsblk and mc) on virtual consoles
#if test "$TERM" = "linux"; then
#  #export TERM=xterm
#  #^ nevermind that doesn't work, so only locale set to C works!
#  export LC_ALL=C
#elif test "$LC_ALL" = "C"; then
#    export -n LC_ALL
#    unset LC_ALL
#    #XXX: for some reason lsblk inside X is still acting as if LC_ALL=C so it shows lots of '?'  probably because startx was run with LC_ALL=C
#fi


cat /proc/cpuinfo |grep -i 'cpu cores'|grep 4 >/dev/null || echo 'Fail cpu cores is not 4! Kernel not patched?'


if test -d "/usr/lib64/nsbrowser/plugins"; then
  echo "WARNING: /usr/lib64/nsbrowser/plugins/ folder exists! chromium may have some new plugins! see: chrome://plugins" | grep --color=always "WARN"
fi


#function to reduce ugliness after the &job is done
function geetcheck(){
  ~/bin/gitcheck
  ec="$?"
  if test "$ec" -ne "0"; then
    echo "non-zero exit code: $ec"
  fi
}
geetcheck &
#fixed! //^ C-c can still interrupt the above! and 0</dev/null wouldn't mitigate it!

export GIT_SSH=~/bin/sshgit

export GOPATH=~/"build/1nonpkgs/gopath"

#add racer to PATH for rust autocompletion vim-racer
export PATH="$PATH:/home/$USER/build/1nonpkgs/racer/target/release"
export RUST_SRC_PATH=~/"build/1nonpkgs/rust/rust/src"

#attempt:don't autoload some system packages placed plugins! - this doesn't work
export MOZ_PLUGIN_PATH="/$RANDOM" #tried: /
#^ but this is the default:export MOZ_PLUGIN_PATH="/usr/lib/mozilla/plugins", supposedly, when mozilla-common package is installed!

#distcc stuff, no need here(but ok in /etc/makepkg.conf):
#DISTCC_SSH="ssh -i \"/home/z/.../T400/koe\" -p 802 -l root"

export PATH=${PATH}:~/bin:/home/z/build/1nonpkgs/chars/target/debug

