let NERDTreeChDirMode = 0
map <leader>n :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
