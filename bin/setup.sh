#!/bin/bash

dst=$HOME
src=$HOME/repo/dotfiles

source	$src/bin/colormap

name='Oh-my-zsh'
cecho "Installing $name" $Yellow
rm -rf $dst/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $dst/.oh-my-zsh
[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red
unset name

name='Powerline fonts'
cecho "Installing $name" $Yellow
TD=$(mktemp -d)
git clone https://github.com/powerline/fonts.git $TD
$TD/install.sh
[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red
rm -rf $TD
unset TD
unset name

exit 0

readfile() {
local o=$IFS
IFS=$(echo -en "\n\b")
local fn="$(cat $1)"
for i in $fn
do
	local dir=${i%/*}
	local name=${i##*/}
	[ -z $dir ] && echo  "ln -sf ${src}/${name} ${dst}/${name} "
	unset dir name
done
IFS=$o
}

readfile "$src/bin/.files"

unset dst src
