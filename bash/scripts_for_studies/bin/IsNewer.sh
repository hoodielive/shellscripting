
#
# Copyright (c) 2008 by Bruce Blinn
#
# File: IsNewer.sh
#

IsNewer() {
	#
	# NAME
	#	IsNewer - compare the dates of two files
	#
	# SYNOPSIS
	#	IsNewer file1 file2
	#
	# DESCRIPTION
	#	This function will return true (0) if file1 has
	#	been modified more recently that file2; otherwise,
	#	it will return false (1).
	#
	if [ $# -ne 2 ]; then
		echo "Usage: IsNewer file1 file2" 1>&2
		exit 1
	fi

	if [ ! -e "$1" -o ! -e "$2" ]; then
		return 1	# No
	fi

	if [ -n "$(find "$1" -newer "$2" -print)" ]; then
		return 0	# Yes
	else
		return 1	# No
	fi
}
