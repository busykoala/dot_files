#!/bin/bash

# i3 CONFIG
ln -sf $HOME/dot_files/i3_config $HOME/.i3/config

# GIT CONFIG
ln -sf $HOME/dot_files/gitconfig $HOME/.gitconfig

# KEYBINDINGS
ln -sf $HOME/dot_files/xbindkeysrc $HOME/.xbindkeysrc

# ZSH CONFIG
ln -sf $HOME/dot_files/zshrc $HOME/.zshrc

# VIM SETUP
ln -sf $HOME/vim_config/.vimrc $HOME/.vimrc
ln -sf $HOME/vim_config/coc-settings.json $HOME/.vim/coc-settings.json
ln -sf $HOME/vim_config/spell_files/de.utf-8.spl $HOME/.vim/spell/de.utf-8.spl
ln -sf $HOME/vim_config/spell_files/de.utf-8.sug $HOME/.vim/spell/de.utf-8.sug

# EDITORCONFIG
ln -sf $HOME/vim_config/.editorconfig $HOME/.editorconfig

# SSH CONFIG
ln -sf $HOME/dot_files/ssh/config $HOME/.ssh/config

# SETUP PYTHON CONFIG
ln -sf $HOME/dot_files/python/pdbrc $HOME/.pdbrc
ln -sf $HOME/dot_files/python/pythonrc $HOME/.pythonrc
