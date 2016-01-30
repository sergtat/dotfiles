# nocorrect
if [[ "$ENABLE_CORRECTION" == "true" ]]; then
	alias vim='nocorrect vim'
	alias man='nocorrect man'
	alias mv='nocorrect mv'
	alias mysql='nocorrect mysql'
	alias mkdir='nocorrect mkdir'
	alias gist='nocorrect gist'
	alias heroku='nocorrect heroku'
	alias ebuild='nocorrect ebuild'
	alias hpodder='nocorrect hpodder'

	setopt correct_all
fi
