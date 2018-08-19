#!/bin/bash 

set -x

# test 1
if [[ "abc" == "abc" ]] 
then
	echo "yep" 
else
	echo "nope"
fi

# test 2

if [[ string1 == "string1" ]] 
then 
	echo "they are the same"
else
	echo "they are not the same"
fi 

# test 3

if [[ "abc" == "c" ]] 
then
	echo "yep" 
else
	echo "nope"
fi

# test 4

if [[ "abc" == *c ]] 
then 
	echo "yep"
else
	echo "nope"
fi 

# test 5

if [[ "linuxfestnorthewst 2018" == [a-z]*[^[:digit:]] ]]
then
	echo "doesn't match anything"
else 
	echo "matches something"
fi

# test 6
if [[ "linuxfestnorthewst 2018" == [a-z]*[[:digit:]] ]]
then
	echo "doesn't match anything"
else 
	echo "matches something"
fi


# test 7

if [[ "linuxfestnorthwest 2017" != *[^[:digit:]]* ]] 
then
	echo "oops"
else
	echo "ouch"
fi

# test 8 

case one in 
	o) 
		echo 'o' 
		;; 
	o?e) 
		echo 'o?e'
		;;
	o*) 
		echo 'o*'
		;;
	*)
		echo 'nope'
		;; 
esac

# test 9 parameters 

set -- one two "three four" five 
printf "%s\n" "\$1: $1" "\$2: $2" "\$3: $3" "\$4: $4" "\$5: $5" "\$#: $#" "\$*: $*" "\$@: $@" 

false
err=$?
echo "error: exit code is $err" 

