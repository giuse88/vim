set background=dark

if (&term =~ "xterm") || (&term =~ "screen")
    set t_Co=256
endif

function! s:custom_highlighting()
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline

  highlight Normal ctermbg=NONE
  highlight NonText ctermbg=NONE
  highlight LineNr ctermbg=NONE
  highlight SignColumn ctermbg=NONE
  highlight SignColumn guibg=#151515
  highlight CursorLine term=bold cterm=bold ctermbg=235 gui=bold guibg=#333333
  highlight CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
endfunction

augroup custom_highlighting
  autocmd!
  autocmd ColorScheme * call s:custom_highlighting()
augroup END
