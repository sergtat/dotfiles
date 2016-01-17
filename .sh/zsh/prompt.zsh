# В «1 2 3» и «a b c d» соответственно
#setopt braceccl

# Файлы с цифрами сортировать числовым методом, а не лексическим
#setopt numeric_glob_sort

# Save execution time of the command in the history.
#setopt extended_history

# Disable autocorrect.
#unsetopt correct_all

# For Debian plugin.
#unalias ar

# Customize to your needs...
#export PATH=$PATH:${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/bin

#if [ "$color_prompt" = yes ]; then
#   PS1=$'%{\e[01;32m%}%n@%m%{\e[00m%}:%{\e[01;34m%}%~%{\e[00m%}$ '
#   PS1=$'%{$fg_bold[green]%}%n@%m%{$reset_colors%}:%{$fg_bold[blue]%}%~%{$reset_color%}$ '
#else
#    PS1='%n@%m:%~$ '
#fi

# Right-hand prompt.
#RPROMPT='%{$fg[red]%} ⏎ $? %{$reset_color%} '$RPROMPT
#get_rp()
#{
   #if [[ $1 == 0 ]]; then
      #rp="%{$fg[green]%}"
   #else
      #rp="%{$fg[red]%}"
   #fi

   #rp=$rp"$(emoji-clock) %{$reset_color%}"

   #echo -n "$rp"
#}

#RPROMPT='$(get_rp $?) '$RPROMPT

# Error-correction prompt.
#SPROMPT="	$fg[red]%R →$reset_color $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Vim key bindings (-e for Emacs). Enabled in plugin.
#bindkey -v

# Console calculator.
#autoload zcalc

#case $TERM in
  #xterm* | rxvt*)
    # precmd вызывается непосредственно перед выводом prompt
    #precmd() {
      #print -Pn "\e]0;zsh\a"
    #}

    # preexec вызывается перед выполнением команды
    # $1 — имя команды (точнее, вся команда со всеми переданными параметрами)
    # sed используется для «отрезания» от команды параметров
    #preexec() {
      #print -Pn "\e]0;`echo $1 | sed -r 's/^([^[:space:]]+).*/\1/'`\a"
    #}
  #;
#esac

