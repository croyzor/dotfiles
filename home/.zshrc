# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/craig/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color=auto'
alias blehusbmount='sudo mount -o user,rw,umask=000,exec /dev/sdb1 /mnt/usb'
alias usbmount='sudo mount -t vfat -o gid=users,fmask=113,dmask=002,exec /dev/sdb1 /mnt/usb'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ls='ls++'
alias clojure='lein repl'
alias lynx='lynx -vikeys'
alias e='vim'
alias v='view'
#RPS1='[%~] '
PS1='> '
#RPS1='[%T]'
export PATH=${PATH}:~/.config/bspwm/panel
export PATH=${PATH}:~/.cabal/bin
export PANEL_FIFO="/tmp/panel-fifo"
export EDITOR=vim
export TERM=xterm-256color
