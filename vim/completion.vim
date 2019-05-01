" #############################
" Add completion for different
" languages into this file
" #############################

" YCM go to definiton
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_global_ycm_extra_conf = '~/dot_files/.global_ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

" Multicursor plugin bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_quit_key            = '<Esc>'
