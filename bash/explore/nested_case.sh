#!/bin/bash

unset VERBOSE
VERBOSE=no

# Nested case statement.
case "$1" in
	start)
		[ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC " "$NAME"
		do_start
		case "$?" in
			0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;; 
		esac
		;;
	*) 
		# Failed to stop
		log_end_msg 1
		;;
esac
"You killed produs"
