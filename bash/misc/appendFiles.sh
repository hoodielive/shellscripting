#!/bin/sh 

case $# in 
	1) cat >> $1 ;; 
	2) cat $1 >> $2 ;; 
	*) echo "Ussage: append [fromfile] tofile" 1>&2 ;; 
esac
