let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|dist|node_modules)',
  \ 'file': '\v\.(exe|so|dll|.min.js)$',
  \ }
