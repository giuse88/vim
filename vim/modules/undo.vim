if has('persistent_undo') && exists("&undodir")
  set undodir=$HOME/.vim/undo/            " where to store undofiles
  set undofile                            " enable undofile
  set undolevels=500                      " max undos stored
  set undoreload=10000                    " buffer stored undos
endif
