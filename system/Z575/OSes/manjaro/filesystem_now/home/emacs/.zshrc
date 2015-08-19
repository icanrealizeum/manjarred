# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=9999999
SAVEHIST=9999999
setopt appendhistory beep nomatch notify
setopt HISTIGNOREDUPS HISTIGNORESPACE EXTENDED_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
unsetopt autocd extendedglob
setopt hist_ignore_all_dups
#TODO: check for dups

# to test:
# WORDCHARS=${WORDCHARS//[^a-z0-9]}

#bindkey -v
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/emacs/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1="%d $ "

autoload -Uz promptinit
promptinit
prompt walters

#TODO: add stuff from ~/.bashrc

export VISUAL=vim

