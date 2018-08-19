#!/usr/local/bin/zsh

if [ -e $HOME/workdir ]  || mkdir $HOME/workdir; then 
    echo "it wasn't there but now it is" ls -ltr $HOME/workdir
fi 
    
