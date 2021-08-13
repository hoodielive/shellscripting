#!/bin/bash 

#set -x
unset SUB_LINE
unset replaceline1

replaceline1=false
SUB_LINE=false

echo "Tell me the line number of the strings you wish to change."
echo

echo "Type the first line."
read line1
echo

echo "Type the first line #2."
read line2
echo

echo "Type the first line #3."
read line3
echo

echo "Type the first line #4."
read line4
echo

# Verification.
echo "Is this the first line you would like to change?"
printf '%s\n' $(awk 'NR=='$line1'' $1)
echo "yes or no"
read line1verification

## Line Verification for Line #1 ##

if [ "$line1verification" == "yes" ]; then
  replaceline1=true
  echo "What do you want to change line: $line1 to?"
  echo
  read line1change
fi

echo "Is this the second line you would like to change?"
echo
printf '%s\n' $(awk 'NR=='$line2'' $1)
echo
echo "yes or no"
echo
read line2verification
echo

## Line Verification for Line #2 ##

if [ "$line2verification" == "yes" ]; then
  replaceline2=true
  echo "What do you want to change line: $line2 to?"
  echo
  read line2change
fi


if [ "$answer" == "yes" ]; then
  SUB_LINE=true
  echo "What line number is it?"
  echo
  read lineNumber
  echo
else 
  SUB_LINE=false
  echo "Abandoning operation.. Please try again."
  echo
  exit 255
fi

# While loop to loop through user input.

while [ "$SUB_LINE" == "true" ]; do
  printf '%s' $(awk 'NR=='$lineNumber'' $1)
  tobereplaced=$(awk 'NR=='$lineNumber'' $1)
  echo
  echo "Is this the line you want to change?"
  echo
  read itit
  echo
  echo "What do you want it to change it to?"
  echo
  read changeitto
  echo

  replace_me=$(printf '%s\n' "$tobereplaced" | sed 's:[][\\/.^$*]:\\&:g')
  replace_to=$(printf '%s\n' "$changeitto" | sed 's:[\\/&]:\\&:g;!s/$/\\/')

  # So as to give the user a clearly formatted statement.

  formatted_text=$(printf '%s\n' "$tobereplaced" | sed 's:[][\\/.^$*]:\\&:g')

  printf '%s' "Before: "$formatted_text""
  echo
  printf '%s' "After: "$replace_to","
  echo
  echo
  echo "Is this correct: yes or no?"
  echo
  read answer

  # Perform Operation
  if [ "$answer" == "yes" ]; then
      A="$replace_me" B="$replace_to" perl -pi.bak -e 's/\Q$ENV{A}\E/        $ENV{B}\,/g' $1
      answer=no
  elif [ "$answer" == "no" ]; then
      SUB_LINE=false
  fi
done
