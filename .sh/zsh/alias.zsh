# nocorrect
setopt correct_all
alias vim='nocorrect vim'
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
# GLOBAL
alias -g H='-h'
alias -g HL='--help'
alias -g NL='> /dev/null'
alias -g 2NL='> & > /dev/null'
alias -g V='--version'
alias -g A='|ccsa -a'
alias -g G='|grep -i'
alias -g TF='&& echo True || echo False'
# GNU
alias ls='ls --color=force'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep -s'
alias igrep='grep -i'
alias rgrep='grep -r'
alias pgrep='pgrep -l'
alias ping='ping -c3'
alias df='df -Th'
alias less='less -I'
alias su-='su -'
alias vim='vim -p'
alias v='vim'
alias eject='eject -T'
[ ! $UID = 0 ] && alias sv='sudo vim'
alias lastlog='lastlog|grep -v \*'
alias dmesg='dmesg --color'
# alias mc='mc -x'
# git
alias got='git'
alias get='git'
alias gs='git status'
alias ga='git add'
alias gal='git add .'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a --status'
alias gcam='git commit -a --status -m'
alias gd='git diff'
alias go='git checkout'
alias gom='git checkout master'
alias gh='git hist'
alias gha='git hist --all'
alias ghm='git hist master --all'
alias gg='giggle &'
alias gk='gitk --all&'
alias gx='gitx --all'
# color
if [ -f /usr/bin/grc ]; then
  alias grc="grc --colour=auto"
  for c in cal configure cvs df diff gcc ifconfig iostat irclog last ldap ls lsmod mount netstat ping proftpd ps route traceroute uname uptime vmstat wdiff whereis; do
    alias ${c}="grc ${c}"
  done
  alias cat="grc cat"
  alias tail="grc tail"
  alias head="grc head"
fi
# portage
[ ! $UID = 0 ] && alias emerge='sudo emerge'
[ ! $UID = 0 ] && alias layman='sudo layman'
[ ! $UID = 0 ] && alias dispath-conf='sudo dispatch-conf'
[ ! $UID = 0 ] && alias myuse='sudo myuse'
[ ! $UID = 0 ] && alias mykey='sudo mykey'
[ ! $UID = 0 ] && alias ufed='sudo ufed'
[ ! $UID = 0 ] && alias eselect='sudo eselect'
alias eix-test-obsolete='LANG=C eix-test-obsolete'

# systemd
alias sc='systemctl'
alias scs='systemctl start'
alias sce='systemctl enable'
alias scd='systemctl disable'
alias scp='systemctl stop'
alias scr='systemctl restart'
alias scst='systemctl status'
alias scrl='systemctl reload'
# alias journalctl='journalctl --no-pager'
#alias systemctl='systemctl --no-pager'
#alias loginctl='loginctl --no-pager'
#alias localectl='localectl --no-pager'
#alias timedatectl='timedatectl --no-pager'
alias jc='journalctl'
alias lc='loginctl'
alias hc='hostnamectl'
alias loc='localectl'
alias tdc='timedatectl'

# other
alias urxvt-launcher="urxvt -geometry 80x3 -name 'bashrun' -e sh -c \"/bin/bash -i -t\""
alias zshconfig="vim -p ~/.zshrc ~/.zshrc.local"
alias vd='vimdiff'
