" Mappings 
ino jj <esc>
cno jj <c-c>

" new tab
map tt :tabnew <Enter>  "Open new tab

"save the current buffer
imap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" Quickly edit/source .vimrc
noremap <leader>ve :edit $HOME/.vimrc<CR>
noremap <leader>vs :source $HOME/.vimrc<CR>

" Yank(copy) to system clipboard
noremap <leader>y "+y

" Treat wrapped lines as normal lines
" TODO I can remvoe it :)
nnoremap j gj
nnoremap k gk

" We don't need any help!
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" Disable annoying ex mode (Q)
map Q <nop>

" Buffers, preferred over tabs now with bufferline.
nnoremap gn :bnext<CR>
nnoremap gN :bprevious<CR>
nnoremap gd :bdelete<CR>
nnoremap gf <C-^>
nnoremap <silent> > :bnext<CR>
nnoremap <silent> < :bprevious<CR>

" Map ctrl-movement keys to window switching
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


" Error navigation
map <leader>sn ]s              " Go to the next error
map <leader>sp [s              " Go to the previous error 
map <leader>sa zg              " Add the word to the dictionary
map <leader>sd z=              " Get list of suggestions
noremap <silent><leader>lo :Errors<CR>
noremap <silent><leader>lc :lcl<CR>

" Nerd commenter
nmap <D-/> <leader>c<Space>
vmap <D-/> <leader>c<Space>

" Toggle syntax highlighting 
function! ToggleSyntaxHighlighthing()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
        call CustomHighlighting()
    endif
endfunction
nnoremap <leader>s :call ToggleSyntaxHighlighthing()<CR>


"""" Toggle Over length 
function! ToggleOverLength()
    if g:overlength_enabled == 0
        match OverLength /\%79v.*/
        let g:overlength_enabled = 1
        echo 'OverLength highlighting turned on'
    else
        match
        let g:overlength_enabled = 0
        echo 'OverLength highlighting turned off'
    endif
endfunction

let g:overlength_enabled = 0
nnoremap <leader>h :call ToggleOverLength()<CR>


" Number line toggle
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction
nnoremap <leader>r :call NumberToggle()<CR>


" Wrapp list toggle
function! WrapToggle()
    if &wrap
        set list
        set nowrap
    else
      set nolist
      set wrap
    endif
endfunction
nnoremap <leader>w :call WrapToggle()<CR>


" Delete Mulitple Empty Line
function! DeleteMultipleEmptyLines()
    g/^\_$\n\_^$/d
endfunction
nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>


" Autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>
