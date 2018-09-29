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
  local VERBOSE="${1}"
  shift 
  local MESSAGE="${@}"
  if [[ ${VERBOSE} = "true" ]]
  then
    echo "${MESSAGE}"
  fi
}

VERBOSITY='true'
log "${VERBOSITY}" 'This is the message I have for you'
log "${VERBOSITY}" 'this is fun!' 
