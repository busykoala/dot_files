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

" Buildout support
" (https://github.com/FBruynbroeck/vim-buildout/blob/master/after/ftplugin/python.vim)
py3 << EOF
import os
import sys
def appendSysPathByPath(path):
    if not path in sys.path:
        sys.path.append(path)
currentpath = os.getcwd().split('/')
for i in range(len(currentpath), -1, -1):
    position = len(currentpath) - i
    if position:
        currentpath = currentpath[0:-position]
    path = "/".join(currentpath)
    if os.path.isdir(os.path.join(path, 'plone3')):
        path = os.path.join(path, 'plone3')
    elif os.path.isdir(os.path.join(path, 'plone4')):
        path = os.path.join(path, 'plone4')
    path = os.path.join(path, 'parts', 'omelette')
    if os.path.isdir(path):
        appendSysPathByPath(path)
        break
EOF