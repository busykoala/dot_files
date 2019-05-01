" ###########################
" Add linting and formatting
" stuff for any here
" ###########################

" Ale linter
au BufNewFile,BufRead *.py, *.R
    \ nmap <F8> <Plug>(ale_fix)
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
    \     'python': ['flake8'],
    \ }
let b:ale_fixers = {
    \     'python': ['autopep8', 'isort'],
    \     'java': ['google_java_format'],
    \ }

" astyle linter
au BufNewFile,BufRead *.cpp
    \ nnoremap <F8> :%!astyle --mode=c --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=c --style=allman -s4<CR>
au BufNewFile,BufRead *.java
    \ nnoremap <F8> :%!astyle --mode=java --style=java -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=java --style=java -s4<CR>
au BufNewFile,BufRead *.cs
    \ nnoremap <F8> :%!astyle --mode=cs --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=cs --style=allman -s4<CR>
