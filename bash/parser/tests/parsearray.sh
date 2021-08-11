#!/bin/bash 

set -x

arr=( 6 12 18 33 )
echo "What number?"
read arr 
if [[ $arr == "6" ]]; then
  echo "Got it"
else
  echo "Nothing."
fi

echo ${arr[0]}; 
echo ${arr[1]}

#for act in ${arr[@]} ; do
#  printf '%s' $(awk 'NR=='$act'' $1)
#  echo '\n'
#done
