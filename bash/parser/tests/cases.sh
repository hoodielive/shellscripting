#!/bin/bash


progname=${0##*/}
version=1.0
blank=1
truncate=0
suppress=0
nwidth=5
cchar=
last=
opts=bstn:N:
n=1

usage()
{
}

die()
{
  error=$1
  shift
  printf "%s\n" "$progname" "$*" >&2
  exit $error
}

while getopts $opts var
  b) blank=0 ;; 
  s) suppress=1 ;;
  n) case $OPTARG in
      *[!0-9]*) die 5 "Numeric value required."
      esac
      n=$OPTARG
      ;;
  N) case $OPTARG in 
      *[!0-9]*) die 5 "Numeric value required."
     esac 
     nwidth=$OPTARG
     ;;
   t) truncate=1 ;;
 esac
done
shift $(( $OPTIND - 1 ))

if [ $truncate -eq 1 ]
then
  width=$(( $COLUMNS - ${nwidth} + 1 ))
  fmt="%${nwidth}d %-${width}.${width}s\n"
else
  fmt="%5d %s\n"
fi
