#!/usr/bin/bash

# Update database & upgrade
sudo pacman -Syu

# Install packages
sudo pacman -S terminator --noconfirm
sudo pacman -S rofi --noconfirm
sudo pacman -S git --noconfirm

# Install and set zsh shell
sudo pacman -S zsh zsh-completions --noconfirm
chsh -s /usr/bin/zsh

# Install xbindkeys for key bindings
sudo pacman -S xbindkeys --noconfirm
xbindkeys -d > ~/.xbindkeysrc

# Set keyboard layout
# sudo cp -f ~/dot_files/examples/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
