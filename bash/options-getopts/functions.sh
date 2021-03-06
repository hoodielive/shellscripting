#!/bin/bash
#===============================================================================
#
#          FILE: functions.sh
#
#         USAGE: ./functions.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: --- 
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Larry Solomon
#  ORGANIZATION: 
#       CREATED: 09/29/2018 10:53:57 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
unset VERBOSE
VERBOSE=false;

log() {
  local MESSAGE="${@}"
  if [[ ${VERBOSE} = "true" ]]
  then
    echo "${MESSAGE}"
  fi
}

log "This is the message I have for you"
VERBOSE='true'
log "this is fun!"
