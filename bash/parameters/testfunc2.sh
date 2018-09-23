#!/bin/bash 

# a function to explore parameter handling differences 
  echo "$# parameters";

  echo Using '$*';

  for p in $*;
  do
    echo "[$p]"; 
  done; 

  echo Using '"$*"'; 
  
  for p in "$*"; 
  do
    echo "[$p]"; 
  done; 

  echo Using '$@';

  for p in $@;
  do 
    echo "[$p]";
  done; 

  echo Using '"$@"'; 

  for p in "$@"; 
  do
    echo "[$p]"; 
  done; 

