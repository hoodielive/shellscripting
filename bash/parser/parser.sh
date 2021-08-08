#!/bin/bash
#set -x

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# Ascertain line number.

echo "What line number do you want to read?"
read lineNumber
# Display the line number specified by user.

printf '%s' $(awk 'NR=='$lineNumber'' $1)

# What does user want to change the string to?

printf '\n'
printf '\n'
echo "What do you want it to change it to?"
echo
read answer
echo

tobereplaced=$(awk 'NR=='$lineNumber'' $1)

replace_me=$(printf '%s\n' "$tobereplaced" | sed 's:[][\\/.^$*]:\\&:g')
replace_to=$(printf '%s\n' "$answer" | sed 's:[\\/&]:\\&:g;!s/$/\\/')

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

# If data is feasible, back up the original file and perform the substition.
if [ "$answer" == "yes" ]; then
    A="$replace_me" B="$replace_to" perl -pi.bak -e 's/\Q$ENV{A}\E/        $ENV{B}\,/g' $1
else
    echo "Exiting.."
fi