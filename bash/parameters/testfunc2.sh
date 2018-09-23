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


# Study the differences carefully, particulary for the quoted forms and the parameters that 
# include white space such as blanks or newline characters. For the single pair of [] characters, 
# note that the expansion of "$*" is indeed a single word. 
