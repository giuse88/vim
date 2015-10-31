" Return to last edit position when opening files
augroup LastPosition
  autocmd! BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     exe "normal! g`\"" |
      \ endif
augroup END

" Remove empty character from the end of the line
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


augroup RemovePreview
    autocmd!
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END


