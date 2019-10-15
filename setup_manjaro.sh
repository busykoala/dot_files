#!/usr/bin/bash

###################
# Install programs
###################

# Update database & upgrade
pacman -Syu --noconfirm
# terminal emulator
pacman -S --needed --noconfirm terminator
# launcher
pacman -S --needed --noconfirm rofi
# git
pacman -S --needed --noconfirm git
# screenshot tool
pacman -S --needed --noconfirm scrot
# gimp
pacman -S --needed --noconfirm gimp
# keybinding app
pacman -S --needed --noconfirm xbindkeys
# zsh (shell)
pacman -S --needed --noconfirm zsh zsh-completions
# clipboard manager and xclip (for screenshot to clipboard mod+p)
pacman -S --needed --noconfirm copyq
pacman -S --needed --noconfirm xclip
# web browser
pacman -S --needed --noconfirm firefox
# install vim dependencies
pacman -S --needed --noconfirm fzf the_silver_searcher astyle ripgrep
# install docker
pacman -S --needed --noconfirm docker
# install some programming stuff
pacman -S --needed --noconfirm mono, go, jdk8-openjdk, cmake, clang, r
# install nvm from aur
pacman -S --needed --noconfirm base-devel make cmake
# install rust
pacman -S --needed --noconfirm rust
# install rbenv and ruby
pacman -S --needed --noconfirm base-devel libffi libyaml openssl zlib
RBENV_REPO_FOLDER=/home/busykoala/.rbenv
RBENV_REPO_URL=https://github.com/rbenv/rbenv.git
if [ ! -d "$RBENV_REPO_FOLDER" ] ; then
	echo "The rbenv repo gets cloned"
	git clone $RBENV_REPO_URL $RBENV_REPO_FOLDER
else
	echo "The rbenv repos exists, it is getting pulled"
	git -C $RBENV_REPO_FOLDER pull
fi
/home/busykoala/.rbenv/bin/rbenv init
mkdir -p /home/busykoala/.rbenv/plugins
RBENV_BUILD_REPO_FOLDER=/home/busykoala/.rbenv/plugins
RBENV_BUILD_REPO_URL=https://github.com/rbenv/ruby-build.git
if [ ! -d "$RBENV_BUILD_REPO_FOLDER" ] ; then
	echo "The rbenv repo gets cloned"
	git clone $RBENV_BUILD_REPO_URL $RBENV_BUILD_REPO_FOLDER
else
	echo "The rbenv repos exists, it is getting pulled"
	git -C $RBENV_BUILD_REPO_FOLDER pull
fi
# install exa (optimized ls)
if hash exa 2>/dev/null; then
    echo "exa exists already"
else
    cargo install exa
fi
source /home/busykoala/.cargo/env

############
# Settings
############

# Set zsh shell
chsh -s /usr/bin/zsh busykoala
# Symlink xbindkeys
su - busykoala -c "ln -sf ~/dot_files/.xbindkeysrc ~/.xbindkeysrc"
# Symlink i3 config
su - busykoala -c "ln -sf ~/dot_files/.i3_config ~/.i3/config"
# Set background image
su - busykoala -c "cp -f ~/dot_files/assets/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg"

# Install NVM
echo "*** Start pulling and building NVM ***"
su - busykoala -c "git clone https://aur.archlinux.org/nvm.git ~/Downloads/nvm"
su - busykoala -c "cd ~/Downloads/nvm && makepkg -Si --needed"
su - busykoala -c "rm -rf ~/Downloads/nvm"
# setup rbenv
echo "*** RBENV Settings ***"
su - busykoala -c "rbenv install 2.6.2"
su - busykoala -c "rbenv global 2.6.2"
# install scss_lint for vim
gem install scss_lint

# Install pyenv
su - busykoala -c "git clone https://github.com/pyenv/pyenv.git ~/.pyenv"

####################
# Dotfiles and Vim
####################

# combine vim repository
VIM_REPO_FOLDER=/home/busykoala/vim_config
VIM_REPO_URL=git@github.com:busykoala/vim_config.git
if [ ! -d "$VIM_REPO_FOLDER" ] ; then
	echo "The vim repo gets cloned"
	su - busykoala -c "git clone $VIM_REPO_URL $VIM_REPO_FOLDER"
else
	echo "The vim repos exists, it is getting pulled"
	su - busykoala -c "git -C $VIM_REPO_FOLDER pull"
fi

# Symlink .vimrc
ln -sf /home/busykoala/vim_config/.vimrc /home/busykoala/.vimrc
# Symlink does not work
cp -f /home/busykoala/vim_config/.editorconfig /home/busykoala/.editorconfig
# setup YCM
YCM_REPO_FOLDER=/home/busykoala/.vim/bundle/Vundle.vim
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
echo "for more information about YCM."
echo ""
echo "R linter will not be installed. This has to be done manually."
echo "See https://github.com/busykoala/vim_config for more info"
echo "######################################################"
# ask before installing YCM
read -p "Do you want to execute YCM installer? [Ny]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    su - busykoala -c "cd /home/busykoala/.vim/bundle/YouCompleteMe && python3 install.py --all --clangd-completer"
fi
# install vim plugins
su - busykoala -c "vim -c 'PluginInstall' -c 'qa!'"
su - busykoala -c "vim -c 'PluginClean' -c 'qa!'"
# Symlink dotfiles
ln -sf /home/busykoala/dot_files/.gitconfig /home/busykoala/.gitconfig
ln -sf /home/busykoala/dot_files/.gitignore /home/busykoala/.gitignore
ln -sf /home/busykoala/dot_files/.zshrc /home/busykoala/.zshrc
ln -sf /home/busykoala/dot_files/.isort.cfg /home/busykoala/.isort.cfg

echo "Sucessfully finished!"
