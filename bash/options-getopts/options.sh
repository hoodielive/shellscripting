#!/bin/bash 

# Traditional UNIX/LINUX commands consider some of the passed args to options
# Historically, these were single character switches distinguished from other parameters 
# by having a leading hyphen or minus sign
# For convenience several options can be combined as in the command ls -lrt, which provides 
# a long (option -l) directory listing in reverse order (option -r) sorted by modification time (option -t)
# a colon (:) after an option letter indicates that the option requires a value; 
# a colon (:) before an option letter tells getopts to be silent and suppress the normal err messages because
# you are prefering the the script handles it own errors

echo "OPTIND starts at $OPTIND"
while getopts ":pq:" optname 
do 
  case "$optname" in
    "p") 
      echo "Option $optname is specified"
      ;;
    "q") 
      echo "Option $optname has value $OPTARG"
      ;; 
    "?") 
      echo "Unknown option $OPTARG"
      ;; 
    ":") 
      echo "No argument value for option $OPTARG"
      ;;
    *) 
      # Should not occur 
      echo "Unknown error while processing options"
      ;; 
   esac 
   echo "OPTIND is now $OPTIND"
 done

