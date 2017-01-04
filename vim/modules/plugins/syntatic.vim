" Syntastic - This is largely up to your own usage, and override these
"             changes if be needed. This is merely an exemplification.
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes':
        \ ['javascript, python'] }

let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
