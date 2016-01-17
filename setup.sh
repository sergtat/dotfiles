#!/bin/bash

dst=$HOME
src=$dst/.dotfiles

source	$src/colormap

name='Oh-my-zsh'
cecho "Installing $name" $Yellow
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red

name='Powerline fonts'
cecho "Installing $name" $Yellow
TD=$(mktemp -d)
git clone https://github.com/powerline/fonts.git $TD
$TD/install.sh
[[ $? ]] && cecho "... $name done" $Green || cecho "... $name Error" $Red
rm -rf $TD
unset TD

readfile() {
local o=$IFS
IFS=$(echo -en "\n\b")
FN="$(cat $@)"
for i in $FN
do 
	cecho "copy ${i}"
	cp -u ${src}/${i} ${dst}
	[[ $? ]] && cecho OK $Green || echo "copy ${i} ...Error" $Red
done
IFS=$o
}

readfile "$src/.files"
