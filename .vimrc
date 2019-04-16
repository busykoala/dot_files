" Install Vundle Plugin Manager with
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Use with :PluginInstall

" Install mono, go, jdk10-openjdk, cmake, clang
" Install nvm from aur
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer --system-libclang --all

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
" Move code up down, right left with Alt+j/k
Plugin 'matze/vim-move'
" Toggle comments
Plugin 'chemzqm/mycomment.vim'

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

" Tab navigation
nnoremap <leader>l :tabprevious<CR>
nnoremap <leader>h :tabnext<CR>

" YCM go to definiton
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_autoclose_preview_window_after_completion=1

" Multicursor plugin bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_quit_key            = '<Esc>'

" Move code plugin
let g:move_key_modifier = 'C'

" Ale linter
nmap <F8> <Plug>(ale_fix)
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
    \     'javascript': ['prettier', 'eslint'],
    \     'vue': ['eslint', 'vls'],
    \     'python': ['flake8'],
    \ }
let b:ale_fixers = {
    \     'python': ['autopep8', 'isort']
    \ }

" ################
" Python Settings
" ################

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Remove white space
autocmd BufWritePre *.py :%s/\s\+$//e
" Python highlight
let python_highlight_all=1

" #################
" Other Languages
" #################

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

