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
log() {
  local MESSAGE="${@}"
  if [[ ${VERBOSE} = "true" ]]
  then
    echo "${MESSAGE}"
  fi
}

# readonly is like a constant in other languages - makes the var unchangeable 
readonly VERBOSE='true'
log 'This is the message I have for you'
log 'this is fun!' 
