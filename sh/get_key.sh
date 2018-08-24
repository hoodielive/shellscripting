#!/usr/bin/env sh

# if a var is specified, the key will read into the variable. If not, it will be in $_KEY

get_key() 
{
	[ -t 0 ] && { 
		# check whether input is coming from the terminal
		[ -z "$_STTY" ] && { 
			_STTY=$(stty -g) # Store the current settings for later restoration  
        } 

		if [ ${TMOUT:--1} -ge 0 ] 
		then 
			_TMOUT=$TMOUT
			stty -echo -icanon time $(( $_TMOUT * 10 )) min ${dd_min:-1} 
		else
			stty -echo -icanon min ${dd_min:-1}
		fi
	} 
}

# Read a key from the keyboard, using dd with a block size (bs) of 1
# A period is appended, or command substitution will swallow a new line

_KEY=$(dd bs=1 count=1 2>/dev/null; echo .) 
_KEY=${_KEY%?} ## remove period 

## if a variable has been given on the command line, assign the result to it
[ -n "$1" ] && # or [[ $1 ]] 
	## Due to quoting, either ' or " needs special treatment; I chose ' 
	case $_KEY in
		"'") eval "$1=\"'" ;; 
		*) eval "$1='$_KEY'";; 
	esac
[ -t 0 ] && stty "$_STTY" ## reset terminal 
[ -n "$_KEY" ] ## succeed if a key has been entered (not timed out)
