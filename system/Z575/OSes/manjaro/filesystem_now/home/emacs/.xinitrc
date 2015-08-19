#!/bin/sh


#src: https://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-a-bash-script
# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-
LOG_FILE="/tmp/.xinitrc.log"
# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE

# Redirect STDERR to STDOUT
exec 2>&1

echo "This line will appear in $LOG_FILE, not 'on screen'"

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

source /etc/X11/xinit/xinitrc

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# use acceleration in firefox
# export MOZ_USE_OMTC=1

#something's already loading xmodmap
#xmodmap ~/.Xmodmap

#do not create .xfce4-session.verbose-log
#unset XFSM_VERBOSE #no effect! maybe because(if) debug is set/built into xfce4-session?
#unset XFSM_VERBOSE
#export -n XFSM_VERBOSE
#unset XFSM_VERBOSE
#^ nope, still nothing; XXX: it's because they chose to write some msgs to logfile anyway

#log now, since log file is in /tmp :
export XFSM_VERBOSE=1

export XFWM4_LOG_FILE="/tmp/xfwm4-debug-%d.log"
export -p

DEFAULT_SESSION=xfce4-session
case $1 in
  xfce) exec dbus-launch xfce4-session >/tmp/.xfce4-session.log 2>&1 ;;
  *) exec dbus-launch  $DEFAULT_SESSION >/tmp/.xfce4-session.log 2>&1 ;;
esac

