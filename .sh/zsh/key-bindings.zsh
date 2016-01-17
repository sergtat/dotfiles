autoload zkbd

function zkbd_file() {
    [[ -f $HOME/.sh/zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".sh/zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f $HOME/.sh/zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".sh/zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d $HOME/.sh/zkbd ]] && mkdir $HOME/.sh/zkbd
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

bindkey -v

[[ -z "$key[Home]" ]] || bindkey -M vicmd "$key[Home]" vi-beginning-of-line
[[ -z "$key[Home]" ]] || bindkey -M viins "$key[Home]" vi-beginning-of-line
[[ -z "$key[End]" ]] || bindkey -M vicmd "$key[End]"  vi-end-of-line
[[ -z "$key[End]" ]] || bindkey -M viins "$key[End]"  vi-end-of-line
[[ -z "$key[Delete]" ]] || bindkey -M vicmd "$key[Delete]" vi-delete-char
[[ -z "$key[Delete]" ]] || bindkey -M viins "$key[Delete]" vi-delete-char
[[ -z "$key[PageUp]" ]] || bindkey -M viins "$key[PageUp]"  vi-up-line-or-history
[[ -z "$key[PageUp]" ]] || bindkey -M vicmd "$key[PageUp]"  vi-up-line-or-history
[[ -z "$key[PageDown]" ]] || bindkey -M viins "$key[PageDown]" vi-down-line-or-history
[[ -z "$key[PageDown]" ]] || bindkey -M vicmd "$key[PageDown]" vi-down-line-or-history
[[ -z "$key[Up]" ]] || bindkey -M viins "$key[Up]" history-beginning-search-backward
[[ -z "$key[Up]" ]] || bindkey -M vicmd "$key[Up]" history-beginning-search-backward
[[ -z "$key[Down]" ]] || bindkey -M viins "$key[Down]" history-beginning-search-forward
[[ -z "$key[Down]" ]] || bindkey -M vicmd "$key[Down]" history-beginning-search-forward
[[ -z "$key[Left]" ]] || bindkey -M viins "$key[Left]" vi-backward-char
[[ -z "$key[Left]" ]] || bindkey -M vicmd "$key[Left]" vi-backward-char
[[ -z "$key[Right]" ]] || bindkey -M viins "$key[Right]" vi-forward-char
[[ -z "$key[Right]" ]] || bindkey -M vicmd "$key[Right]" vi-forward-char
[[ -z "$key[Insert]" ]] || bindkey -M viins "$key[Insert]" vi-insert
[[ -z "$key[Insert]" ]] || bindkey -M vicmd "$key[Insert]" vi-insert

function list_mappings(){bindkey}; zle -N list_mappings
bindkey -M vicmd 'map' list_mappings

#making work some special keys
#making work Home and End keys in both modes

#simple widget, wich deletes N-th parameter (word) in line
killparam(){
    zle beginning-of-line
    zle vi-forward-word -n ${NUMERIC:-1}
    zle delete-word -n 1
    zle vi-delete-char -n 1
    zle vi-insert
}
zle -N killparam
bindkey -M vicmd 'k' killparam

#bindkey -M vicmd "^[[2~"  vi-insert
#bindkey -M viins "^[[2~"  yank
#bindkey -M vicmd "^[[A"   history-beginning-search-backward
#bindkey -M viins "^[[A"   history-beginning-search-backward
#bindkey -M vicmd "^[[B"   history-beginning-search-forward
#bindkey -M viins "^[[B"   history-beginning-search-forward
bindkey -M vicmd "^[."    insert-last-word
bindkey -M viins "^[."    insert-last-word
bindkey ' ' magic-space    # also do history expansion on space

### use Ctrl-left-arrow and Ctrl-right-arrow for jumping to word-beginnings on the CL
bindkey -M vicmd "^[0c" forward-word
bindkey -M viins "^[0d" backward-word
#bindkey "\e[5C" forward-word
#bindkey "\e[5D" backward-word
#bindkey "\e[1;5C" forward-word
#bindkey "\e[1;5D" backward-word
### the same for alt-left-arrow and alt-right-arrow
#bindkey '^[[1;3C' forward-word
#bindkey '^[[1;3D' backward-word
#bindkey '\ew' kill-region
#bindkey -s '\el' "ls\n"
bindkey '^r' history-incremental-search-backward

#bindkey '^[[Z' reverse-menu-complete

# bindkey '' backward-delete-char
# bindkey "[3~" delete-char
bindkey -M viins "" vi-backward-kill-word
bindkey -M viins "b" vi-backward-kill-word
bindkey -M viins "d" delete-word

## consider emacs keybindings:

##bindkey -e  ## emacs key bindings
##
##bindkey '^[[A' up-line-or-search
##bindkey '^[[B' down-line-or-search
##bindkey '^[^[[C' emacs-forward-word
##bindkey '^[^[[D' emacs-backward-word
##
##bindkey -s '^X^Z' '%-^M'
##bindkey '^[e' expand-cmd-path
##bindkey '^[^I' reverse-menu-complete
##bindkey '^X^N' accept-and-infer-next-history
##bindkey '^W' kill-region
##bindkey '^I' complete-word
### Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
##
#bindkey '^E' expand-cmd-path
