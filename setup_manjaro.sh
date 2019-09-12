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
# clipboard manager
pacman -S --needed --noconfirm clipit
# web browser
pacman -S --needed --noconfirm firefox
# install some programming stuff
pacman -S --needed --noconfirm mono, go, jdk8-openjdk, cmake, clang
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
pwd
# setup rbenv
echo "*** RBENV Settings ***"
su - busykoala -c "rbenv install 2.6.2"
su - busykoala -c "rbenv global 2.6.2"
# install scss_lint for vim
gem install scss_lint

echo "*** Stuff successfully done ***"
