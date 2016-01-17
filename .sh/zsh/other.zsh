#export PATH=${HOME}/bin:$PATH
#export LANG=ru_RU.UTF-8
#export LC_CTYPE=ru_RU.UTF-8

setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
unsetopt correct_all

# Setting in oh-my-zsh.
# Share history between shells.
setopt share_history

# Ignore duplicity commands in history.
setopt hist_ignore_all_dups

# Don't save in history commands, beginning with space.
setopt hist_ignore_space

# Don't save command «history» or «fc» in history.
setopt hist_no_store

# Bash-like '='
setopt no_equals

### Forcing the rehash
#_force_rehash() { (( CURRENT == 1 )) && rehash; return 1 }
#zstyle ‘:completion:::::’ completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' rehash true

# Color man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# press F10 and calculate :)
arith-eval-echo() {
  LBUFFER="${LBUFFER}echo \$(( "
  RBUFFER=" ))$RBUFFER"
}
autoload -U arith-eval-echo
zle -N arith-eval-echo
bindkey "^[[21~" arith-eval-echo

calc() {echo "${1}"|bc -l;}

# Если сессия запущена не через Screen, то запускаем tmux и выходим. Если по какой то причине не вышли, то выведется надпись «неполучилось». 
#if [ $TERM != "screen" ]; then
##( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux has-session && tmux attach-session) || (tmux new-session -s remote) || (tmux new-session) ) && exit 0
##echo "tmux failed to start"
#unset TMUX
#tmux attach || tmux new
#fi

# Часы в правом верхнем углу терминала
#while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &

blist(){
  if [ ! -x /usr/bin/qlist ]
  then
    echo 'app-portage/portage-utils not instaled...'
    exit 1
  fi
  /usr/bin/qlist $1 | grep bin/
}

elist(){
  if [ ! -x /usr/bin/qlist ]
  then
    echo 'app-portage/portage-utils not instaled...'
    exit 1
  fi
  /usr/bin/qlist $1 | grep etc/
}

help(){
  bash -c "help $1"
}

