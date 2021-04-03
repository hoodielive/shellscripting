#!/bin/sh 
set -x

USERDIR=$(for files in $(ls -1); do echo $files; done)

for user in $(cat user); do
    if $user -r $(echo $USERDIR); then
        echo "$user has been found in directory."
    else
        echo "$user not found."
    fi
done
