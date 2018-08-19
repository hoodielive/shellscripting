#!/bin/bash 

set -x

if [[ "abc" == "abc" ]] 
then
	echo "yep" 
else
	echo "nope"
fi

if [[ string1 == "string1" ]] 
then 
	echo "they are the same"
else
	echo "they are not the same"
fi 

if [[ "abc" == "c" ]] 
then
	echo "yep" 
else
	echo "nope"
fi

if [[ "abc" == *c ]] 
then 
	echo "yep"
else
	echo "nope"
fi 

if [[ "linuxfestnorthewst 2018" == [a-z]*[^[:digit:]] ]]
then
	echo "doesn't match anything"
else 
	echo "matches something"
fi

if [[ "linuxfestnorthewst 2018" == [a-z]*[[:digit:]] ]]
then
	echo "doesn't match anything"
else 
	echo "matches something"
fi


if [[ "linuxfestnorthwest 2017" != *[^[:digit:]]* ]] 
then
	echo "oops"
else
	echo "ouch"
fi
