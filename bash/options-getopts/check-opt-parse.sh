#!/bin/bash -
#===============================================================================
#
#          FILE: check-opt-parse.sh
#
#         USAGE: ./check-opt-parse.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Larry 
#  ORGANIZATION: 
#       CREATED: 09/29/2018 10:33:03 PM
#      REVISION:  ---
#===============================================================================

#set -o nounset                                  # Treat unset variables as an error

if ( ! getopts "abc:deh" opt); then 
    echo "Usage: $(basename $0) options (-ab) (-c value) (-d) (-e) -h for help"; 
    exit $E_OPTERROR;
fi

while getopts "abc:deh" opt; do 
  case $opt in 
    a) echo something;;
    b) echo another;; 
    c) var=$OPTARG;; 
    *)
      echo "law"
      exit 44 
      ;;
  esac
done

