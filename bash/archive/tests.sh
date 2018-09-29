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


# test 10 preservation of error status

false
err=$?
echo "error: exit code is $err" 

# test 11 parameter expansion - conditionals 

param=gnu; echo "${param:-default value for expansion}" 
unset param; echo "${param:-default value for expansion}" 

#echo "${param:?a nifty custom error string}"

echo "${PATH:+yes you have a PATH, great job}" 

echo "${BASH_VERSION:0:1}"

echo "${PATH##*:}"

echo -e "${PATH//:/\\n}"
