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
set encoding=utf-8                          " default $LANG/latin1
set fileencoding=utf-8                      " default none
set hidden                                  " buffer change, more undo
set history=1000                            " default 20
set iskeyword+=_,$,@,%,#                    " not word dividers
set laststatus=2                            " always show statusline
set linebreak                               " don't cut words on wrap
set listchars=tab:>\                        " > to highlight <tab>
set list                                    " displaying listchars
set noshowmode                              " hide mode cmd line
set noexrc                                  " don't use other .*rc(s)
set nostartofline                           " keep cursor column pos
set nowrap                                  " don't wrap lines
set numberwidth=5                           " 99999 lines
set shortmess+=I                            " disable startup message
set splitbelow                              " splits go below w/focus
set splitright                              " vsplits go right w/focus
set ttyfast                                 " for faster redraws etc
set ttymouse=xterm2                         " experimental
set autoread                                " refresh if changed
set confirm                                 " confirm changed files
set noautowrite                             " never autowrite
set nobackup                                " disable backups

set noswapfile                              " dont  files
set pastetoggle=<F3>
