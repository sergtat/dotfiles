# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid

autoload zkbd

function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd

keyfile=$(zkbd_file)

ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi

if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi

unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# bindkey -v

# [[ -n "$key[Home]"    ]] && bindkey -M vicmd "$key[Home]"     vi-beginning-of-line
# [[ -n "$key[Home]"    ]] && bindkey -M viins "$key[Home]"     vi-beginning-of-line
# [[ -n "$key[End]"     ]] && bindkey -M vicmd "$key[End]"      vi-end-of-line
# [[ -n "$key[End]"     ]] && bindkey -M viins "$key[End]"      vi-end-of-line
# [[ -n "$key[Delete]"  ]] && bindkey -M vicmd "$key[Delete]"   vi-delete-char
# [[ -n "$key[Delete]"  ]] && bindkey -M viins "$key[Delete]"   vi-delete-char
# [[ -n "$key[PageUp]"  ]] && bindkey -M viins "$key[PageUp]"   vi-up-line-or-history
# [[ -n "$key[PageUp]"  ]] && bindkey -M vicmd "$key[PageUp]"   vi-up-line-or-history
# [[ -n "$key[PageDown] ]] && bindkey -M viins "$key[PageDown]" vi-down-line-or-history
# [[ -n "$key[PageDown] ]] && bindkey -M vicmd "$key[PageDown]" vi-down-line-or-history
# [[ -n "$key[Up]"      ]] && bindkey -M viins "$key[Up]"       history-beginning-search-backward
# [[ -n "$key[Up]"      ]] && bindkey -M vicmd "$key[Up]"       history-beginning-search-backward
# [[ -n "$key[Down]"    ]] && bindkey -M viins "$key[Down]"     history-beginning-search-forward
# [[ -n "$key[Down]"    ]] && bindkey -M vicmd "$key[Down]"     history-beginning-search-forward
# [[ -n "$key[Left]"    ]] && bindkey -M viins "$key[Left]"     vi-backward-char
# [[ -n "$key[Left]"    ]] && bindkey -M vicmd "$key[Left]"     vi-backward-char
# [[ -n "$key[Right]"   ]] && bindkey -M viins "$key[Right]"    vi-forward-char
# [[ -n "$key[Right]"   ]] && bindkey -M vicmd "$key[Right]"    vi-forward-char
# [[ -n "$key[Insert]"  ]] && bindkey -M viins "$key[Insert]"   vi-insert
# [[ -n "$key[Insert]"  ]] && bindkey -M vicmd "$key[Insert]"   vi-insert

function list_mappings(){bindkey}; zle -N list_mappings
bindkey -M vicmd 'map' list_mappings

#making work Home and End keys in both modes

#simple widget, wich deletes N-th parameter (word) in line
# killparam(){
#     zle beginning-of-line
#     zle vi-forward-word -n ${NUMERIC:-1}
#     zle delete-word -n 1
#     zle vi-delete-char -n 1
#     zle vi-insert
# }
# zle -N killparam
# bindkey -M vicmd 'k' killparam

### use Ctrl-left-arrow and Ctrl-right-arrow for jumping to word-beginnings on the CL
# bindkey -M vicmd "^[0c" forward-word
# bindkey -M viins "^[0d" backward-word
# bindkey "\e[5C" forward-word
# bindkey "\e[5D" backward-word
# bindkey "\e[1;5C" forward-word
# bindkey "\e[1;5D" backward-word
# ## the same for alt-left-arrow and alt-right-arrow
# bindkey '^[[1;3C' forward-word
# bindkey '^[[1;3D' backward-word
# bindkey '\ew' kill-region
# bindkey -s '\el' "ls\n"
# bindkey '^r' history-incremental-search-backward
# bindkey '^[[Z' reverse-menu-complete
# bindkey '' backward-delete-char
# bindkey '^[[3~' delete-char
# bindkey -M viins '^[h' vi-backward-kill-word
# bindkey -M viins '^[b' vi-backward-kill-word
# bindkey -M viins '^[d' delete-word

# consider emacs keybindings:

# bindkey -e  ## emacs key bindings
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# bindkey '^[^[[C' emacs-forward-word
# bindkey '^[^[[D' emacs-backward-word
# bindkey -s '^X^Z' '%-^M'
# bindkey '^[e' expand-cmd-path
# bindkey '^[^I' reverse-menu-complete
# bindkey '^X^N' accept-and-infer-next-history
# bindkey '^W' kill-region
# bindkey '^I' complete-word

# Fix weird sequence that rxvt produces

# bindkey -s '^[[Z' '\t'
# bindkey '^E' expand-cmd-path
# [[ -n "$terminfo[kcuu1]" ]] && bindkey -M viins "$terminfo[kcuu1]" up-line-or-search
# [[ -n "$terminfo[kcud1]" ]] && bindkey -M viins "$terminfo[kcud1]" down-line-or-search

source ${ZSH}/lib/key-bindings.zsh
