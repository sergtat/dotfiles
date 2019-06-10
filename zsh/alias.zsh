# GLOBAL
alias -g H='-h'
alias -g HL='--help'
alias -g NL='> /dev/null'
alias -g 2NL='> /dev/null 2>&1'
alias -g BNL='> /dev/null 2>&1 &'
alias -g V='--version'
alias -g G='|grep'
alias -g g='|grep -i'
alias -g TF='&& echo True || echo False'
alias -g L='|less -r'
alias -g M='|more -r'
# GNU
alias df='df -Th'
alias eject='eject -T'
alias less='less -I'
alias ls='ls --color=force'
alias lsd='ls -d -1 */ | sed 's@/@@''
alias lsf='find . -maxdepth 1 -type f | sed "s@./@@"'
alias ping='ping -c3'
alias rm='rm -i'
alias su-='su -'
alias v='nvim'
alias nv='nvim'
alias snv='sudo nvim'
alias svim='sudo nvim'
alias sv='sudo nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vrc='nvim ~/.config/nvim/init.vim'
alias zshrc="nvim ~/.zshrc"
alias zrc="nvim ~/.zshrc"
alias lastlog='lastlog|grep -v \*'
alias dmesg='dmesg --color'
alias emacs='emacsclient -c'
# grep
alias egrep='grep -E'
alias fgrep='grep -F'
alias grep='grep -s'
alias igrep='grep -i'
alias pgrep='pgrep -l'
alias rgrep='grep -r'
# git
alias git='hub'
alias gal='git add .'
alias gca='git commit -v —a --status'
alias gca!='git commit -v —a --amend'
alias gcam='git commit -a --status -m'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gh='git hist'
alias gha='git hist --all'
alias ghm='git hist master --all'
alias gl='git log --pretty=oneline'
alias gla='git hist --pretty=oneline --all'
# alias gg='giggle &'
# alias gx='gitx --all'
gfr() { 
    git reset @~ "$@" && git commit --amend --no-edit 
}
# color
if [ -f /usr/bin/grc ]; then
  alias grc="grc --colour=auto"
  for c in "cal cat configure cvs df diff gcc ifconfig iostat irclog last ldap ls lsmod head mount netstat ping proftpd ps route tail traceroute uname uptime vmstat wdiff whereis"; do
    alias ${c}="grc ${c}"
  done
fi
# portage
if [[ $UID != 0 ]]; then
  alias emerge='sudo emerge'
  alias layman='sudo layman'
  alias dispath-conf='sudo dispatch-conf'
  alias myuse='sudo myuse'
  alias mykey='sudo mykey'
  alias ufed='sudo ufed'
  alias eselect='sudo eselect'
fi
alias eix-test-obsolete='LANG=C eix-test-obsolete'

# systemd
alias systemctl='systemctl --no-pager'
alias journalctl='journalctl --no-pager'
alias sc='systemctl'
alias scs='systemctl start'
alias sce='systemctl enable'
alias scd='systemctl disable'
alias scstop'systemctl stop'
alias scr='systemctl restart'
alias scst='systemctl status'
alias scrl='systemctl reload'
alias jc='journalctl'
alias jcb='journalctl -b'
alias jcx='journalctl -xe'
alias lc='loginctl'
alias hc='hostnamectl'
alias loc='localectl'
alias tdc='timedatectl'

# other
alias urxvt-launcher="urxvt -geometry 80x3 -name 'bashrun' -e sh -c \"/bin/bash -i -t\""
alias reload='source ~/.zshrc'
alias src='source ~/.zshrc'
alias psworld="ps f -g`pgrep world`"
alias xdg-user-dirs-update="LANG=C xdg-user-dirs-update"
alias xdg-user-dirs="LANG=C xdg-user-dirs"
alias mutt='neomutt'

# Don't define aliases in plain Bourne shell
[ -n "${BASH_VERSION}${KSH_VERSION}${ZSH_VERSION}" ] || return 0
