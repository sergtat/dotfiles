# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e                                            # Use emacs key bindings

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # start typing + [Up-Arrow] - fuzzy find history forward
fi

if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # start typing + [Down-Arrow] - fuzzy find history backward
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi


autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line				# [Ctrl-x Ctrl-e] Edit the current command line in $EDITOR

# file rename magick
bindkey "^[m" copy-prev-shell-word

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#
# autoload zkbd

# function zkbd_file() {
#     [[ -f $HOME/.sh/zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".sh/zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
#     [[ -f $HOME/.sh/zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".sh/zkbd/${TERM}-${DISPLAY}"          && return 0
#     return 1
# }

# [[ ! -d $HOME/.sh/zkbd ]] && mkdir $HOME/.sh/zkbd
# keyfile=$(zkbd_file)
# ret=$?
# if [[ ${ret} -ne 0 ]]; then
#     zkbd
#     keyfile=$(zkbd_file)
#     ret=$?
# fi
# if [[ ${ret} -eq 0 ]] ; then
#     source "${keyfile}"
# else
#     printf 'Failed to setup keys using zkbd.'
# fi
# unfunction zkbd_file; unset keyfile ret

# bindkey -v

# [[ -z "$key[Home]" ]] || bindkey -M vicmd "$key[Home]" vi-beginning-of-line
# [[ -z "$key[Home]" ]] || bindkey -M viins "$key[Home]" vi-beginning-of-line
# [[ -z "$key[End]" ]] || bindkey -M vicmd "$key[End]"  vi-end-of-line
# [[ -z "$key[End]" ]] || bindkey -M viins "$key[End]"  vi-end-of-line
# [[ -z "$key[Delete]" ]] || bindkey -M vicmd "$key[Delete]" vi-delete-char
# [[ -z "$key[Delete]" ]] || bindkey -M viins "$key[Delete]" vi-delete-char
# [[ -z "$key[PageUp]" ]] || bindkey -M viins "$key[PageUp]"  vi-up-line-or-history
# [[ -z "$key[PageUp]" ]] || bindkey -M vicmd "$key[PageUp]"  vi-up-line-or-history
# [[ -z "$key[PageDown]" ]] || bindkey -M viins "$key[PageDown]" vi-down-line-or-history
# [[ -z "$key[PageDown]" ]] || bindkey -M vicmd "$key[PageDown]" vi-down-line-or-history
# [[ -z "$key[Up]" ]] || bindkey -M viins "$key[Up]" history-beginning-search-backward
# [[ -z "$key[Up]" ]] || bindkey -M vicmd "$key[Up]" history-beginning-search-backward
# [[ -z "$key[Down]" ]] || bindkey -M viins "$key[Down]" history-beginning-search-forward
# [[ -z "$key[Down]" ]] || bindkey -M vicmd "$key[Down]" history-beginning-search-forward
# [[ -z "$key[Left]" ]] || bindkey -M viins "$key[Left]" vi-backward-char
# [[ -z "$key[Left]" ]] || bindkey -M vicmd "$key[Left]" vi-backward-char
# [[ -z "$key[Right]" ]] || bindkey -M viins "$key[Right]" vi-forward-char
# [[ -z "$key[Right]" ]] || bindkey -M vicmd "$key[Right]" vi-forward-char
# [[ -z "$key[Insert]" ]] || bindkey -M viins "$key[Insert]" vi-insert
# [[ -z "$key[Insert]" ]] || bindkey -M vicmd "$key[Insert]" vi-insert

# function list_mappings(){bindkey}; zle -N list_mappings
# bindkey -M vicmd 'map' list_mappings

#making work some special keys
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

#bindkey -M vicmd "^[[2~"  vi-insert
#bindkey -M viins "^[[2~"  yank
#bindkey -M vicmd "^[[A"   history-beginning-search-backward
#bindkey -M viins "^[[A"   history-beginning-search-backward
#bindkey -M vicmd "^[[B"   history-beginning-search-forward
#bindkey -M viins "^[[B"   history-beginning-search-forward
# bindkey -M vicmd "^[."    insert-last-word
# bindkey -M viins "^[."    insert-last-word
# bindkey ' ' magic-space    # also do history expansion on space

### use Ctrl-left-arrow and Ctrl-right-arrow for jumping to word-beginnings on the CL
# bindkey -M vicmd "^[0c" forward-word
# bindkey -M viins "^[0d" backward-word
#bindkey "\e[5C" forward-word
#bindkey "\e[5D" backward-word
#bindkey "\e[1;5C" forward-word
#bindkey "\e[1;5D" backward-word
### the same for alt-left-arrow and alt-right-arrow
#bindkey '^[[1;3C' forward-word
#bindkey '^[[1;3D' backward-word
#bindkey '\ew' kill-region
#bindkey -s '\el' "ls\n"
# bindkey '^r' history-incremental-search-backward

#bindkey '^[[Z' reverse-menu-complete

# bindkey '' backward-delete-char
# bindkey '^[[3~' delete-char

# bindkey -M viins '^[h' vi-backward-kill-word
# bindkey -M viins '^[b' vi-backward-kill-word
# bindkey -M viins '^[d' delete-word

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

# [[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" up-line-or-search
# [[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" down-line-or-search
