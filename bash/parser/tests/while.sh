#!/bin/bash 

#set -x

unset SUB_LINE
SUB_LINE=false

echo "Do you want to change a string?"
read answer
echo

if [ "$answer" == "yes" ]; then
  SUB_LINE=true
  echo "What line number is it?"
  read lineNumber
else 
  SUB_LINE=false
  echo "Abandoning operation.. Please try again."
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
