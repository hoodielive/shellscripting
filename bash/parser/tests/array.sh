#!/bin/bash 

echo "Hello, what are the numbers in question?"
readarray -n 4 food

input1=$(printf '%s' ${food[0]})
input2=$(printf '%s' ${food[1]})
input3=$(printf '%s' ${food[2]})
input4=$(printf '%s' ${food[3]})


printf '%s' $(awk 'NR=='$input1'' $1)
echo
echo
printf '%s' $(awk 'NR=='$input2'' $1)
echo
echo
printf '%s' $(awk 'NR=='$input3'' $1)
echo
echo
printf '%s' $(awk 'NR=='$input4'' $1)
echo
echo
