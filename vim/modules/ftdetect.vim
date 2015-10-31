filetype plugin indent on

augroup FileTypeRules
    autocmd!
    autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
    autocmd BufNewFile,BufRead *.vim set ft=vim tw=79
    autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
    autocmd BufNewFile,BufRead *.txt set ft=txt tw=79
    autocmd BufNewFile,BufRead *.js set ft=javascript tw=79
    autocmd BufNewFile,BufRead *.jsx set ft=javascript tw=79
    autocmd BufNewFile,BufRead *.sc set ft=scala tw=79
    autocmd BufNewFile,BufRead *.scala set ft=scala tw=79
    autocmd BufNewFile,BufRead *.ws ft=scala tw=79
    autocmd BufNewFile,BufRead *.scalaws ft=scala tw=79
augroup END
