#!/bin/bash 

echo "How many lines do you wish to change?"
read answer 

if [ "$answer" == 1 ]; then
  echo "What is the line number?"
  read answer1
elif [ "$answer" == 2 ]; then
  echo "What is the line number 1?"
  read answer2
  echo "What is the line number 2?"
  read answer2
elif [ "$answer" == 3 ]; then
  echo "What is the line number 1?"
  read answer1
  echo "What is the line number 2?"
  read answer2
  echo "What is the line number 3?"
  read answer3
elif [ "$answer" == 4 ]; then
  echo "What is the line number 1?"
  read answer1
  echo "What is the line number 2?"
  read answer2
  echo "What is the line number 3?"
  read answer3
  echo "What is the line number 4?"
  read answer4
else
  exit 255
fi

echo
printf "%s\n" $(awk 'NR=='$answer1'' $1)
echo
echo
printf "%s" $(awk 'NR=='$answer2'' $1)
echo
echo
printf "%s" $(awk 'NR=='$answer3'' $1)
echo
echo
printf "%s" $(awk 'NR=='$answer4'' $1)
echo
echo
