#!/usr/bin/env bash 
set -x
for dir in $PWD ; do
    homedir="${dir%/}"
    username="${homedir##}"

    case $username in
        *.*) continue ;; #skip name with a dot in fit
    esac

    chown -R "$username" "$dir"
done

#awk -F: -v user="$username" '{if($1 == user){print $6}}' < /etc/passwd

