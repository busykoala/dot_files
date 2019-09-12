#!/usr/bin/bash

###################
# Install programs
###################

# Update database & upgrade
pacman -Syu
# terminal emulator
pacman -S terminator --noconfirm
# launcher
pacman -S rofi --noconfirm
# git
pacman -S git --noconfirm
# screenshot tool
pacman -S scrot --noconfirm
# gimp
pacman -S gimp --noconfirm
# keybinding app
pacman -S xbindkeys --noconfirm
# zsh (shell)
pacman -S zsh zsh-completions --noconfirm

############
# Settings
############

# Set zsh shell
chsh -s /usr/bin/zsh $USER
# Symlink xbindkeys
ln -sf ~/dot_files/.xbindkeysrc ~/.xbindkeysrc
# Symlink i3 config
ln -sf ~/dot_files/.i3_config ~/.i3/config

# Set keyboard layout
#  cp -f ~/dot_files/examples/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
