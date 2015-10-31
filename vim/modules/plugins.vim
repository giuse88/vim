" Die early if this Vim install is built with tiny or small.
" We don't want a Raspberry Pi, for example, running all of these.
if !1 | finish | endif

filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

execute 'source' Dot('plugins.vim')

call vundle#end()

" Load all plugin configuration files.

for file in split(glob(Dot('modules/plugins/*.vim')), '\n')
  exec 'source' file
endfor

filetype plugin indent on
