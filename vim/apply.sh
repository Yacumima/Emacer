#!/bin/sh

rm -rf ~/.vimrc
rm -rf ~/.vim

cp -r $1/dotVim ~/.vim
cp $1/dotVimrc ~/.vimrc
