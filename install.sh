#!/bin/bash

#Create Symbolic Links from dotfiles Repo to Home Directory.
ln -sf ~/dotfiles/Xresources ~/.Xresources
xrdb -load ~/.Xresources
ln -sf ~/dotfiles/dircolors ~/.dircolors

ln -sf ~/dotfiles/bashrc ~/.bashrc

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/vim ~/.vim


