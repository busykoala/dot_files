#!/bin/bash

VIM_REPO_FOLDER=~/vim_config
VIM_REPO_URL=git@github.com:busykoala/vim_config.git
if [ ! -d "$VIM_REPO_FOLDER" ] ; then
	echo "The vim repo gets cloned"
	git clone $VIM_REPO_URL $VIM_REPO_FOLDER
else
	echo "The vim repos exists, it is getting pulled"
	git -C $VIM_REPO_FOLDER pull
fi

# Symlink .vimrc
ln -sf ~/vim_config/.vimrc ~/.vimrc
# Symlink does not work
cp -f ~/vim_config/.editorconfig ~/.editorconfig

YCM_REPO_FOLDER=~/.vim/bundle/Vundle.vim
YCM_REPO_URL=https://github.com/gmarik/Vundle.vim.git
if [ ! -d "$YCM_REPO_FOLDER" ] ; then
	echo "The YCM repo gets cloned"
	git clone $YCM_REPO_URL $YCM_REPO_FOLDER
else
	echo "The YCM repos exists, it is getting pulled"
	git -C $YCM_REPO_FOLDER pull
fi

# YCM Configuration information
echo ""
echo "#######################################################"
echo "Please see https://github.com/Valloric/YouCompleteMe"
echo "and configure accordingly."
echo ""
echo "Also install astyle and for R the package lintr"
echo ""
echo "See https://github.com/busykoala/vim_config for more info"
echo "######################################################"

# Symlink dotfiles
ln -sf ~/dot_files/.gitconfig ~/.gitconfig
ln -sf ~/dot_files/.gitignore ~/.gitignore
ln -sf ~/dot_files/.zshrc ~/.zshrc
ln -sf ~/dot_files/.isort.cfg ~/.isort.cfg
