#!/usr/bin/env bash

PI=3.14
VAR_A=10
VAR_B=$VAR_A
VAR_C=${VAR_B}

echo "Lets print 3 variables: "
echo $VAR_A
echo $VAR_B
echo $VAR_C

# Concatenate
STR_A="Ori"
STR_B="Sha"
echo "${STR_A} + ${STR_B} equals Ori + Sha"
STR_C=${STR_A}" + "${STR_B}
echo "${STR_C} is the same as Ori + Sha too!"
echo "${STR_C} + ${PI}"

exit 0
