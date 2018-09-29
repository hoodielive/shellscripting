#!/bin/bash

case "${1}" in
  start) echo "Starting..." ;; 
  stop) echo "Stopping..." ;; 
  status|state|--status|--state) echo "Status is as follows: " ;;
  *) 
    echo "Follow the rules!" >&2 
    exit 44
    ;;
esac
