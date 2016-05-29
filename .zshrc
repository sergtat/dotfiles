# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
[[ ! $TERM = 'linux' ]] && ZSH_THEME="wezm+" || ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/repo/dotfiles/.sh/zsh"
ZSH_CACHE_DIR="$HOME/repo/dotfiles/.sh/cache"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(adb git npm tmux z)
# plugins=(adb coffee cp encode64 git jsontools node npm sudo tmuxinator urltools vi-mode)
# plugins=(git github gitfast git-flow vundle vi-mode sprunde screen redis-cli npm node extract encode64 urltools history-substring-search)

# User configuration

export PATH=$HOME/bin:$PATH
export EDITOR='vim'
export VISUAL='vim'
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# [[ -n ~/.zshrc.local ]] && source ~/.zshrc.local

# Interesting plugins: #

# comon-aliases
# compleat - Bash-completion.
# cp - replace 'cp' to 'rsync'.
# ddg (for Duckduckgo), wiki, news, youtube, map, image, ducky.
# debian - aliases to apt-*, dpkg and aptitude. Useful: apt-history, kerndeb.
# dircycle - cycling through directory stack.
# dirpersist - persistent directory stack.
# emoji-clock - clock. :-)
# encode64 - aliases to base64: e64, d64.
# extract - extract archives, but I use my own function.
# fbterm - framebuffer terminal. Buggy on NVIDIA.
# gem - Ruby gem installer autocompletion.
# git - Git aliases.
# git-extras - Extra Git autocompletion.
# git-flow-avh
# gitfast - fast Git autocompletion.
# github.
# gnu-utils - use GNU utilities for replace built-in functions.
# go/golang - Google Go language compiler autocompletion.
# history-substring-search - searh substring in the shell history.
# jump - Easily jump around the file system by manually adding marks.
# kate - alias to kate (and Kate is started silently from console).
# mosh - simply map SSH autocompletion to mosh. No overhead.
# nyan - animated terminal nyan cat.
# pass - password manager.
# per-directory-history - history unique for each directory.
# perl - aliases for Perl.
# pj - simple project manager.
# postgres - aliases for starting/restarting Postgres SQL.
# python - pyclean, pyfind, pygrep.
# rails. rails3, rails4 - aliases for Ruby On Rails.
# rand-quote - random quote from http://www.quotationspage.com (function `quote`).
# redis-cli - Redis database client completion.
# rsync - aliases for rsync (rsync-copy, rsync-move, rsync-update, rsync-synchronize).
# ruby - aliases: rfind, rgem.
# safe-paste - safe paste text to the X-terminal.
# scala - autocompletion for Scala compiler.
# scd - smart change of directory.
# screen - plugin for GNU Screen.
# sistemadmin
# sprunge - command line Pastebin (function `sprunge`).
# ssh-agent - wrapper for the SSH autentification agent.
# sublime - set paths for Sublime text editor on MacOS X and add alias `stt` on all systems.
# svn  - functions for Subversion (like svn_get_branch_name).
# systemd - add aliases with sudo for the system.d commands (start, stop, restart, etc.).
# taskwarrior - console task manager.
# themes - add functions `theme` and `lstheme` for loading and listing oh-my-zsh themes.
# torrent - magnet link to torrent file converter (function `magnet_to_torrent`).
# urltools - `urldecode` and `urlencode` functions.
# vi-mode - enable handy Vim mode in the terminal.
# vundle - bundle manager for Vim.
# web-search - search from the terminal. Aliases: bing, google, yahoo,
