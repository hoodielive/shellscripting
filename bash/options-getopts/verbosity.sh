#!/bin/bash 
name="Belanor"
Message=true

usage() {
  echo usage.. 
}

VERBOSE() {
  (( verbose )) && echo "$1"
}

while getopts "hv" opt; do 
  case $opt in
    h) usage; exit;; 
    v) verbose=1;; 
    \?) usage; exit 1;; 
  esac 
done 

if ((verbose)); then 
  echo "Searching for something..."
fi
# or 

if [[ ! -z $Message ]]; then 
  VERBOSE "this is the son of ${name}"
fi
