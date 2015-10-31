if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
  nnoremap ff :Ag<SPACE>
endif

