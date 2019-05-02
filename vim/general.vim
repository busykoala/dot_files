" ############################
" General Settings such as:
"  => Theme
"  => Nerdtree
"  => Powerline
"  => Todo Plugin
" ############################

" Theming (highlight, set numbers)
syntax on
set background=dark
set nu

" Theme from Plugin
colorscheme space-vim-dark
let g:space_vim_dark_background = 233
color space-vim-dark

" General stuff
set encoding=utf-8
:let mapleader = ","

" Set path for editorconfig
let g:EditorConfig_exec_path = '~/dot_files/vim/editorconfig.vim'

" Buffer mappings
set hidden
nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>

" Add powerline
set  rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Nerd tree (open if dir)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
map <C-N> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\..pycache$', '\.git$', '\.pytest_cache$']

" Search TODO
com FindTodo :vimgrep /\<TODO\>/j **/* | :cope

