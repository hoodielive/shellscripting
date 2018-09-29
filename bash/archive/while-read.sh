#!/bin/bash 

ls -1 | while read file 
do
	echo "$(stat -c"%a %A" "$file") $(md5sum "$file")"

done

