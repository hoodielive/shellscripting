#!/usr/bin/env bash


for nodes in $(cat phrases.txt) ; do 
	print $nodes; 
sed -i.bak -e '/^\[puppet:\/\/modules\/nodes\/$nodes\]/d' authz.erb
done > script.sh

