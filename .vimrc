" Install Vundle Plugin Manager with
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Use with :PluginInstall

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
Plugin 'kristijanhusak/vim-hybrid-material'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Nerd Tree
Plugin 'scrooloose/nerdtree'
" Python Autoformat
Plugin 'vim-scripts/indentpython.vim'
" Check syntax on save
Plugin 'vim-syntastic/syntastic'
" PEP 8
Plugin 'nvie/vim-flake8'
" Search with ctrl + p
Plugin 'kien/ctrlp.vim'
" Git integration for nerd tree
Plugin 'tpope/vim-fugitive'

" Vundle Plugins and Bundles (Section End)
" #########################################
call vundle#end()            " required
filetype plugin indent on    " required

" #################
" General Settings
" #################

" Theming (highlight, set numbers)
syntax on
set background=dark
colorscheme hybrid_reverse
set nu
set encoding=utf-8

" Add powerline
set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Nerd tree (open if dir)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1
" Nerd tree bindings
map <C-n> :NERDTreeToggle<CR>
" Nerd tree hide
let NERDTreeIgnore=['\.pyc$', '\~$']

" ################
" Python Settings
" ################

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Remove white space
autocmd BufWritePre *.py :%s/\s\+$//e
" Python highlight
let python_highlight_all=1

" #################
" Other Languages
" #################

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

