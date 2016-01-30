#!/bin/bash

dst=$HOME
src=$HOME/repo/dotfiles

source	$src/bin/colormap

#name='Oh-my-zsh'
#cecho "Installing $name" $Yellow
#rm -rf $dst/.oh-my-zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git $dst/.oh-my-zsh
#[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red
unset name

#name='Powerline fonts'
#cecho "Installing $name" $Yellow
#TD=$(mktemp -d)
#git clone https://github.com/powerline/fonts.git $TD
#$TD/install.sh
#[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red
## rm -rf $TD
#unset TD
unset name

readfile() {
local o=$IFS
IFS=$(echo -en "\n\b")
FN="$(cat $1)"
for i in $FN
do
echo ${i}
	for f in ${src}/${i}
	do
		echo ${f##$src/}
	done
done
IFS=$o
}

readfile "$src/bin/.files"

unset dst src
