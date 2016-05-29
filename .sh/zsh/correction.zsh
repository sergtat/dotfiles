if [[ "$ENABLE_CORRECTION" == "true" ]]; then
	alias ebuild='nocorrect ebuild'
	alias eix='nocorrect eix'
	alias gist='nocorrect gist'
	alias heroku='nocorrect heroku'
	alias hpodder='nocorrect hpodder'
	alias man='nocorrect man'
	alias mkdir='nocorrect mkdir'
	alias mv='nocorrect mv'
	alias mysql='nocorrect mysql'
	alias npm='nocorrect npm'
	alias sudo='nocorrect sudo'
	alias vim='nocorrect vim'
	alias pgrep='nocorrect pgrep'
	alias pkill='nocorrect pkill'

	setopt correct_all
fi
