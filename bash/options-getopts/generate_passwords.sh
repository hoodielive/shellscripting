#!/bin/bash 
#===============================================================================
#
#          FILE: getopts.sh
#
#         USAGE: ./getopts.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Larry Solomon
#  ORGANIZATION: 
#       CREATED: 09/29/2018 12:04:27 PM
#      REVISION:  ---
#===============================================================================
# this script generates a random password. 
# this user can set the password length with -l and a special character with -s. 
# verbose mode can be enabled with -v. 

usage() {
  echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
  echo 'Generate a random password'
  echo ' -l  LENGTH  Specify the password length.'
  echo ' -s          Append a special character to the password.'
  echo ' -v          Activate Verbosity'
  exit 1

}

log() {
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then
    echo "${MESSAGE}"
  fi
}

# Set a default password length 
unset LENGTH; 
LENGTH=48 

while getopts "vl:s" OPTION; do 
 case ${OPTION} in 
    v) 
      VERBOSE='true'
      log "Verbose mode activated."
      ;;
    l) 
      LENGTH="${OPTARG}"
      ;; 
    s) 
      USE_SPECIAL_CHARACTER='true'
      ;;
    ?) 
      usage
      exit 1
      ;;
  esac
done

log 'Generating a password'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# append a special character if requested to do so

if [[ ${USE_SPECIAL_CHARACTER} = 'true' ]]
then
  log 'Selecting a random special character.'
  SPECIAL_CHARACTER=$(echo '!@#$%^&*()-+=' | fold -w1 | shuf | head -c1)
  PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'Done.'
log 'Here is the password: '

# Display the password. 
echo "${PASSWORD}"

exit 0 
