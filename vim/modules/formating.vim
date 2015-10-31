set autoindent                                  " preserve indentation
set backspace=indent,eol,start                  " smart backspace
set cinkeys-=0#                                 " don't force # indentation
set expandtab                                   " no real tabs
set ignorecase                                  " by default ignore case
set nrformats+=alpha                            " incr/decr letters C-a/-x
set shiftround                                  " be clever with tabs
set smartcase                                   " sensitive with uppercase
set smarttab                                    " tab to 0,4,8 etc.
set smartindent
set shiftwidth=2                                " default 8
set softtabstop=2                               " "tab" feels like <tab>
set tabstop=2                                   " replace <TAB> w/4 spaces

if has("patch-7.3.541")
  set formatoptions+=j
endif

set list
set listchars=""                  "  "
set listchars=tab:▸\              " a tab should display as "▸" "
set listchars+=trail:·            " show trailing spaces as "·"  "
set listchars+=extends:◄          " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:►         " The character to show in the last column when wrap is off and the line continues beyond the right of the screen  "
