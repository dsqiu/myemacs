#!/bin/sh
path=`pwd`
ln -s $path ~/.emacs.d
ln -s ~/.emacs.d/dotemacs.el ~/.emacs
ln -s ~/.emacs.d/gitconfig ~/.gitconfig
ln -s ~/.emacs.d/vim-config ~/.vim
ln -s ~/.emacs.d/vimrc ~/.vimrc
