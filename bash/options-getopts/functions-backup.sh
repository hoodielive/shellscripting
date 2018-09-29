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

backup_file() {
  # this function creates a backup of a file. Returns a non-zero status on error
  local FILE="${1}"
  
  # Make sure the file exists 
  if [[ -f "${FILE}" ]]
  then
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "Backing up ${FILE} to ${BACKUP_FILE}."
    # the exit status of the function will be the exit status of the cp command
    cp -p ${FILE} ${BACKUP_FILE}
  else
    # The file does not exist, so return a non-zero exit status 
    return 1 
  fi
}

# readonly is like a constant in other languages - makes the var unchangeable 
readonly VERBOSE='true'
log 'This is the message I have for you'
log 'this is fun!'  

# Logger is a shell command interface to the syslog(3) system log module 

backup_file '/etc/passwd'

# Make a decision based on the exit status of the function 
if [[ "${?}" -eq '0' ]]
then
  log 'File backup succeeded!'
else
  log 'File backup failed!'
  exit 1
fi
