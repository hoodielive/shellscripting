#!/bin/bash 

if fgrep -qi "gentoo" /etc/os-release 
then 
	echo "gentoo " 
elif fgrep -qi "ubuntu" /etc/os-release
then
	echo "ubuntu "
else
	echo "not gentoo :-/"
fi

