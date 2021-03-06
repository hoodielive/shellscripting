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
  # this function sends a message to syslog and to stdout out if VERBOSE is true. 
  local MESSAGE="${@}"
  if [[ ${VERBOSE} = "true" ]]
  then
    echo "${MESSAGE}"
  fi
  # logger -t (allows you to tag syslog messages) 
  logger -t functions-readonly.sh "${MESSAGE}"
}

# readonly is like a constant in other languages - makes the var unchangeable 
#readonly VERBOSE='true'
readonly VERBOSE='false'
log 'This is the message I have for you'
log 'this is fun!'  

# Logger is a shell command interface to the syslog(3) system log module 
