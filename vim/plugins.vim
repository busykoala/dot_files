" ###############################
" This file includes all plugins
" ###############################

set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" ##########################################
" Vundle Plugins and Bundles (Section Start)

" Theme
Plugin 'liuchengxu/space-vim-dark'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Nerd Tree
Plugin 'scrooloose/nerdtree'
" Python Autoformat
Plugin 'vim-scripts/indentpython.vim'
" Ale Linting
Plugin 'w0rp/ale'
" Search with ctrl + p
Plugin 'kien/ctrlp.vim'
" Git integration for nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Completition Magic
Plugin 'Valloric/YouCompleteMe'
" Multicursor
Plugin 'terryma/vim-multiple-cursors'
" Git Gutter
Plugin 'airblade/vim-gitgutter'
" Toggle comments (leader c)
Plugin 'chemzqm/mycomment.vim'
" File buffer in tabline
Plugin 'ap/vim-buftabline'
" Html, Css, Js completion
Plugin 'mattn/emmet-vim'
" R completion
Plugin 'gaalcaras/ncm-R'
" Editor Config
Plugin 'editorconfig/editorconfig-vim'

" Vundle Plugins and Bundles (Section End)
" #########################################
call vundle#end()            " required
filetype plugin indent on    " required
