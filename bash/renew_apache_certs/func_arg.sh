#!/bin/bash


options=$(getopt -o drv --long DEBUG --long  verbosity: -- "$@")
[ $? -eq 0 ] || {
	echo "Incorrect option provided."
	exit 1
}
eval set -- "$options"
while true; do
	case "$1" in
		-d)
			DEBUG=1
			;;
	  --debug)
			DEBUG=1
			;;
	  -r)
			echo "WISDOM"
			;;
		-v)
			shift;
			VERBOSITY=$1
			;;
		--)
			shift
			break
			;;
	esac
done
echo $DEBUG
echo $VERBOSITY
echo $VERBOSE
