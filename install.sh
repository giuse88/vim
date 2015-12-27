#!/bin/bash
# Usage: install vim script

ln -sf `pwd`/vim ~/.vim
ln -sf `pwd`/vimrc ~/.vimrc

echo "Installed config file"

vim +PluginInstall +qall

echo "Plugin installed"
