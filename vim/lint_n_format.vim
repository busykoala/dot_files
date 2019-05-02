" ###############################################
" language: linter | formatter
"
" python: flake8 | autopep8, isort
" javascript: ... | prettier, eslint
" R : lintr | ...
" c++: ... | astyle
" java: ... | astyle
" c#: ... | astyle
" ###############################################

" *** Linting ***


" *** Formatting *** (using F8)

au BufNewFile,BufRead *.cpp
    \ nnoremap <F8> :%!astyle --mode=c --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=c --style=allman -s4<CR>
au BufNewFile,BufRead *.java
    \ nnoremap <F8> :%!astyle --mode=java --style=java -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=java --style=java -s4<CR>
au BufNewFile,BufRead *.cs
    \ nnoremap <F8> :%!astyle --mode=cs --style=allman -s4<CR> |
    \ vnoremap <F8> :!astyle --mode=cs --style=allman -s4<CR>
" Use Ale Fixer for these filetypes:
au BufNewFile,BufRead *.py,*.R
    \ nmap <F8> <Plug>(ale_fix)

" *** Ale settings ***

let g:ale_fix_on_save = 0
let g:ale_linter_aliases = {'vue': ['vue', 'javascript'],}
let b:ale_fixers = {'python': ['autopep8', 'isort'], 'javascript': ['prettier', 'eslint'],}
let g:ale_linters = {'python': ['flake8'],}
