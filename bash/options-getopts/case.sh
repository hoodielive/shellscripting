#!/bin/bash 

#if [[ "${1}" = 'start' ]]
#then
#  echo "Starting..."
#elif [[ "${1}" = 'stop' ]]
#then
#  echo "Stopping..."
#elif [[ "${1}" = 'status' ]]
#then
#  echo "Status..." 
#else
#  echo "Please enter a valid option"
#  exit 44
#fi

case "${1}" in
  start) 
    echo "Starting..."
    ;; 
  stop) 
    echo "Stopping..."
    ;; 
  status|state|--status|--state) 
    echo "Status is as follows: "
    ;;
  *) 
    echo "Follow the rules!"
    exit 44
    ;;
esac
