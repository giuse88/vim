""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin indent on                   " detect file plugin+indent
        syntax on                                   " syntax highlighting
        """ force behavior and filetypes, and by extension highlighting {{{
            augroup FileTypeRules
                autocmd!
                autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
                autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
                autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
                autocmd BufNewFile,BufRead *.js set ft=javascript tw=79
                autocmd BufNewFile,BufRead *.jsx set ft=javascript tw=79
                autocmd BufNewFile,BufRead *.sc set ft=scala tw=79
                autocmd BufNewFile,BufRead *.scala set ft=scala tw=79
                autocmd BufNewFile,BufRead *.ws ft=scala tw=79
                autocmd BufNewFile,BufRead *.scalaws ft=scala tw=79
            augroup END
        """ Custom highlighting, where NONE uses terminal background {{{
        """ }}}
    """ }}}
    """ Interface general {{{
        set cursorline                              " hilight cursor line
        set more                                    " ---more--- like less
        set number                                  " line numbers
        set scrolloff=3                             " lines above/below cursor
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set vb t_vb=                                " disable beep and flashing
        set wildignore=*.a,*.o,*.so,*.pyc,*.jpg,
                    \*.jpeg,*.png,*.gif,*.pdf,*.git,
                    \*.swp,*.swo                    " tab completion ignores
        set wildmenu                                " better auto complete
        set wildmode=longest,list                   " bash-like auto complete
        """ Depending on your setup you may want to enforce UTF-8.
        """ Should generally be set in your environment LOCALE/$LANG {{{
            " set encoding=utf-8                    " default $LANG/latin1
            " set fileencoding=utf-8                " default none
        """ }}}
        """ Gvim {{{
            set guifont=Inconsolata:h14
            set guioptions-=m                       " remove menubar
            set guioptions-=T                       " remove toolbar
            set guioptions-=r                       " remove right scrollbar
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set hidden                                      " buffer change, more undo
    set history=1000                                " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    set linebreak                                   " don't cut words on wrap
    set listchars=tab:>\                            " > to highlight <tab>
    set list                                        " displaying listchars
    """set mouse=                                      " disable mouse
    set noshowmode                                  " hide mode cmd line
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " keep cursor column pos
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    set shortmess+=I                                " disable startup message
    set splitbelow                                  " splits go below w/focus
    set splitright                                  " vsplits go right w/focus
    set ttyfast                                     " for faster redraws etc
    set ttymouse=xterm2                             " experimental
    """ Folding {{{
        set foldcolumn=0                            " hide folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldlevelstart=99                       " folds open by default
    """ }}}
    """ Search and replace {{{
        " set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
        set hlsearch
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set matchpairs+=<:>                         " for ci< or ci>
        set showmatch                               " tmpjump to match-bracket
    """ }}}
    """ Return to last edit position when opening files {{{
        augroup LastPosition
            autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
        augroup END
    """ }}}
""" }}}
""" Files {{{
    set autoread                                    " refresh if changed
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set nobackup                                    " disable backups
    """ Persistent undo. Requires Vim 7.3 {{{
        if has('persistent_undo') && exists("&undodir")
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
    """ Swap files, unless vim is invoked using sudo. Inspired by tejr's vimrc
    """ https://github.com/tejr/dotfiles/blob/master/vim/vimrc {{{
        if !strlen($SUDO_USER)
            set directory^=$HOME/.vim/swap//        " default cwd, // full path
            set swapfile                            " enable swap files
            set updatecount=50                      " update swp after 50chars
            """ Don't swap tmp, mount or network dirs {{{
                augroup SwapIgnore
                    autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*
                                \ setlocal noswapfile
                augroup END
            """ }}}
        else
            set noswapfile                          " dont swap sudo'ed files
        endif
    """ }}}
""" }}}
""" Text formatting {{{
     set autoindent                                  " preserve indentation
     set backspace=indent,eol,start                  " smart backspace
     set cinkeys-=0#                                 " don't force # indentation
     set expandtab                                   " no real tabs
     set ignorecase                                  " by default ignore case
     set nrformats+=alpha                            " incr/decr letters C-a/-x
     set shiftround                                  " be clever with tabs
     set shiftwidth=2                                " default 8
     set smartcase                                   " sensitive with uppercase
     set smarttab                                    " tab to 0,4,8 etc.
     set smartindent
     set softtabstop=2                               " "tab" feels like <tab>
     set tabstop=2                                   " replace <TAB> w/4 spaces
     """ Only auto-comment newline for block comments {{{
     """ augroup AutoBlockComment
         """ autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
     """ augroup END
     """ }}}
     """ Take comment leaders into account when joining lines, :h fo-table
     """ http://ftp.vim.org/pub/vim/patches/7.3/7.3.541 {{{
      if has("patch-7.3.541")
       set formatoptions+=j
      endif
    """ }}}
""" }}}
""" Keybindings {{{
    """ General {{{

        " Quickly edit/source .vimrc
        noremap <leader>ve :edit $HOME/.vimrc<CR>
        noremap <leader>vs :source $HOME/.vimrc<CR>

        " Yank(copy) to system clipboard
        noremap <leader>y "+y

        " Bubbling (bracket matching)
   "     nmap <C-up> [e
  "      nmap <C-down> ]e
  "      vmap <C-up> [egv
  "      vmap <C-down> ]egv

        " Scroll up/down lines from 'scroll' option, default half a screen
        map <C-j> <C-d>
        map <C-k> <C-u>

        " Treat wrapped lines as normal lines
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
    """ }}}
        """ Toggle syntax highlighting {{{
            function! ToggleSyntaxHighlighthing()
                if exists("g:syntax_on")
                    syntax off
                else
                    syntax on
                    call CustomHighlighting()
                endif
            endfunction

            nnoremap <leader>s :call ToggleSyntaxHighlighthing()<CR>
        """ }}}
        """ Highlight characters past 79, toggle with <leader>h
        """ You might want to override this function and its variables with
        """ your own in .vimrc.last which might set for example colorcolumn or
        """ even the textwidth. See https://github.com/timss/vimconf/pull/4 {{{
            let g:overlength_enabled = 0
            highlight OverLength ctermbg=238 guibg=#C9664D

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

            nnoremap <leader>h :call ToggleOverLength()<CR>
        """ }}}
        """ Toggle relativenumber using <leader>r {{{
            function! NumberToggle()
                if(&relativenumber == 1)
                    set number
                else
                    set relativenumber
                endif
            endfunction

            nnoremap <leader>r :call NumberToggle()<CR>
        """ }}}
        """ Toggle text wrapping, wrap on whole words
        """ For more info see: http://stackoverflow.com/a/2470885/1076493 {{{
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
        """ }}}
        """ Remove multiple empty lines {{{
            function! DeleteMultipleEmptyLines()
                g/^\_$\n\_^$/d
            endfunction

            nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>
        """ }}}
        """ Strip trailing whitespace, return to cursor at save {{{
            function! <SID>StripTrailingWhitespace()
                let l = line(".")
                let c = col(".")
                %s/\s\+$//e
                call cursor(l, c)
            endfunction

            augroup StripTrailingWhitespace
                autocmd!
                autocmd FileType c,cpp,cfg,conf,css,html,perl,python,sh,tex,javascript
                            \ autocmd BufWritePre <buffer> :call
                            \ <SID>StripTrailingWhitespace()
            augroup END
        """ }}}
    """ }}}
    """ Plugins {{{
        " Toggle tagbar (definitions, functions etc.)
        map <F1> :TagbarToggle<CR>

        " Toggle pastemode, doesn't indent
        set pastetoggle=<F3>

        " Syntastic - toggle error list. Probably should be toggleable.
        noremap <silent><leader>lo :Errors<CR>
        noremap <silent><leader>lc :lcl<CR>
    """ }}}
""" }}}
""" Plugin settings {{{

    let g:startify_bookmarks = [
        \ $HOME . "/.vimrc", $HOME . "/.vimrc.first",
        \ $HOME . "/.vimrc.last", $HOME . "/.vimrc.plugins"
        \ ]
    let g:startify_custom_header = [
          \'                          ___      ___ ___  _____ ______       ',
          \'                         |\  \    /  /|\  \|\   _ \  _   \     ',
          \'                         \ \  \  /  / | \  \ \  \\\__\ \  \    ', 
          \'                          \ \  \/  / / \ \  \ \  \\|__| \  \   ',
          \'                           \ \    / /   \ \  \ \  \    \ \  \  ',
          \'                            \ \__/ /     \ \__\ \__\    \ \__\ ',
          \'                             \|__|/       \|__|\|__|     \|__| ',
          \'',
          \'',
          \'',        
        \ ]

    " Syntastic - This is largely up to your own usage, and override these
    "             changes if be needed. This is merely an exemplification.
    let g:syntastic_mode_map = {
        \ 'mode': 'passive',
        \ 'active_filetypes':
            \ ['javascript'] }

    " Netrw - the bundled (network) file and directory browser
    let g:netrw_banner = 0
    let g:netrw_list_hide = '^\.$'
    let g:netrw_liststyle = 3

    " Automatically remove preview window after autocomplete (mainly for clang_complete)
    augroup RemovePreview
        autocmd!
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    augroup END

    """ Lightline {{{
"        let g:lightline = {
"            \ 'colorscheme': 'jellybeans',
"            \ 'active': {
"            \     'left': [
"            \         ['mode', 'paste'],
"            \         ['readonly', 'fugitive'],
"            \         ['ctrlpmark', 'bufferline']
"            \     ],
"            \     'right': [
"            \         ['lineinfo'],
"            \         ['percent'],
"            \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
"            \     ]
"            \ },
"            \ 'component': {
"            \     'paste': '%{&paste?"!":""}'
"            \ },
"            \ 'component_function': {
"            \     'mode'         : 'MyMode',
"            \     'fugitive'     : 'MyFugitive',
"            \     'readonly'     : 'MyReadonly',
"            \     'ctrlpmark'    : 'CtrlPMark',
"            \     'bufferline'   : 'MyBufferline',
"            \     'fileformat'   : 'MyFileformat',
"            \     'fileencoding' : 'MyFileencoding',
"            \     'filetype'     : 'MyFiletype'
"            \ },
"            \ 'subseparator': {
"            \     'left': '|', 'right': '|'
"            \ }
"            \ }
"
"        let g:lightline.mode_map = {
"            \ 'n'      : ' N ',
"            \ 'i'      : ' I ',
"            \ 'R'      : ' R ',
"            \ 'v'      : ' V ',
"            \ 'V'      : 'V-L',
"            \ 'c'      : ' C ',
"            \ "\<C-v>" : 'V-B',
"            \ 's'      : ' S ',
"            \ 'S'      : 'S-L',
"            \ "\<C-s>" : 'S-B',
"            \ '?'      : '      ' }

        function! MyMode()
            let fname = expand('%:t')
            return fname == '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ winwidth('.') > 60 ? lightline#mode() : ''
        endfunction

        function! MyReadonly()
            return &ft !~? 'help' && &readonly ? '≠' : '' " or ⭤
        endfunction

        function! CtrlPMark()
            if expand('%:t') =~ 'ControlP'
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        function! MyBufferline()
            call bufferline#refresh_status()
            let b = g:bufferline_status_info.before
            let c = g:bufferline_status_info.current
            let a = g:bufferline_status_info.after
            let alen = strlen(a)
            let blen = strlen(b)
            let clen = strlen(c)
            let w = winwidth(0) * 4 / 11
            if w < alen+blen+clen
                let whalf = (w - strlen(c)) / 2
                let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
                let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
                return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
            else
                return b . c . a
            endif
        endfunction

        function! MyFileformat()
            return winwidth('.') > 90 ? &fileformat : ''
        endfunction

        function! MyFileencoding()
            return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
        endfunction

        function! MyFiletype()
            return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
        endfunction

"        let g:ctrlp_status_func = {
""            \ 'main': 'CtrlPStatusFunc_1',
"            \ 'prog': 'CtrlPStatusFunc_2',
"            \ }
"
"        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"            let g:lightline.ctrlp_regex = a:regex
"            let g:lightline.ctrlp_prev = a:prev
"            let g:lightline.ctrlp_item = a:item
"            let g:lightline.ctrlp_next = a:next
"            return lightline#statusline(0)
"        endfunction
"
"        function! CtrlPStatusFunc_2(str)
"            return lightline#statusline(0)
"        endfunction
"
"        let g:tagbar_status_func = 'TagbarStatusFunc'

""" }}}
 """ Local ending config, will overwrite anything above. Generally use this. {{{{
     if filereadable($HOME."/.vimrc.last")
         source $HOME/.vimrc.last
     endif
""" }}}

" Mappings 
ino jj <esc>
cno jj <c-c>

map tt :tabnew <Enter>  "Open new tab

" Syntatic 
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=0
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1

"save the current buffer
imap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

"""""""""""""""""""""""""""""""""""""""""
" use :w!! to write to a file using     "
" sudo if you forgot to 'sudo vim file' "
" (it will prompt for sudo password     "
" when writing)                         "
"""""""""""""""""""""""""""""""""""""""""
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""
"NERDTree configuration"
"""""""""""""""""""""""""""""""""""""""""
let NERDTreeChDirMode = 0
map <leader>n :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


""""""""""""""""""""""""""""""""""""""""""""""
" COPY and Paste from the clipboard register " 
""""""""""""""""""""""""""""""""""""""""""""""

" CTRL-X and SHIFT-Del are Cut
" vnoremap <C-X> "+x
" vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
" vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" map <C-V> "+gP
" map <S-Insert> "+gP

"  cmap <C-V> <C-R>+
"  cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

" exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"imap <S-Insert> <C-V>
"vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
"noremap <C-Q> <C-V>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" Go to the next error 
map <leader>sn ]s 
" Go to the previous error 
map <leader>sp [s
" Add the word to the dictionary
map <leader>sa zg
" Get list of suggestions 
map <leader>sd z=

" Map ctrl-movement keys to window switching
 map <C-k> <C-w><Up>
 map <C-j> <C-w><Down>
 map <C-l> <C-w><Right>
 map <C-h> <C-w><Left>

set tabstop=2       " The width of a TAB is set to 2g.
set shiftwidth=2    " Indents will have a width of 2g
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Startify 
autocmd User Startified setlocal buftype=
let g:ctrlp_reuse_window = 'startify'
set sessionoptions=blank,curdir,folds,tabpages,winpos

" The Silver Searcher

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
  nnoremap ff :Ag<SPACE>
endif

" JSX syntax highlighting
let g:jsx_ext_required = 0
""""
" NPM 
""""
command -nargs=* Npm !npm --no-color <args>

""""""
"""" PERFORMANCE IMPROVEMENT 
"" http://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance
"set nocursorcolumn
"set nocursorline
"set norelativenumber
syntax sync minlines=256

set list
set listchars=""                  "  "
set listchars=tab:▸\              " a tab should display as "▸" "
set listchars+=trail:·            " show trailing spaces as "·"  "
set listchars+=extends:◄          " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:►         " The character to show in the last column when wrap is off and the line continues beyond the right of the screen  "

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|dist|node_modules)',
  \ 'file': '\v\.(exe|so|dll|.min.js)$',
  \ }

nmap <D-/> <leader>c<Space>
vmap <D-/> <leader>c<Space>

vnoremap > >gv
vnoremap < <gv

let g:js_indent_log = 1

let NERDSpaceDelims=1

" Syntax complete"

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

"Airline"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" au BufRead,BufNewFile *.scalaws set filetype=scala
" au BufRead,BufNewFile *.scalaws imap <silent> <CR> <c-o>:call DoREPL()<CR>
"
"

function! AppendHello ()

  let __scala_input__ = bufnr('%')

  if !exists('g:__scala_output__')
    let g:__scala_output__ = ScratchBuffer()
  endif

  if !exists('g:__scala_started__')
    let g:__scala_started__ = 1
python << EOF
from subprocess import Popen, PIPE
scala = Popen(["scala"], stdout=PIPE, stdin=PIPE, bufsize=0, universal_newlines=True)
print("scala started")
EOF
  endif

python << EOF
import vim
global scala
output_buf = int(vim.eval('g:__scala_output__'))
input_buf = int(vim.eval('__scala_input__'))
output_buf = vim.buffers[output_buf]
input_buf= vim.buffers[input_buf]

del output_buf[0:len(output_buf)]

def clean():
    while True:
        line = scala.stdout.readline()
        if not line.strip():
            break

def result():
    scala.stdout.flush()
    scala.stdout.readline()
    return scala.stdout.readline()

def run(command):
    scala.stdin.write(command+"\n")

for index, line in enumerate(input_buf):
  clean()
  scala.stdin.write(line + "\n")
  run(line + "\n")
  output_buf.append(result())
EOF

endfunction

function! ScratchBuffer()
  vsplit __scala_output__
  normal! ggdG
  setlocal nobuflisted
  setlocal bufhidden=wipe 
  setlocal noswapfile
  setlocal buftype=nofile
  return bufnr('%')
endfunction

com! FormatJSON %!python -m json.tool

nnoremap <silent> > :bnext<CR>
nnoremap <silent> < :bprevious<CR>
