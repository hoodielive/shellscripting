#!/bin/bash 

GLOBAL_RET=255

function my_function_global() 
{
  ls /home/${USER}/.zshrc
  GLOBAL_RET=$?
}

function my_function_return() 
{
  ls /home/${USER}/.zshrc
  return $?
}

function my_function_str() 
{
  local UNAME=$1
  local OUTPUT=""
  if [ -e /home/${UNAME}/.zshrc ]; then 
    OUTPUT='Found it!'
  else
    OUTPUT='Sorry, Not Found!'
  fi
  echo ${OUTPUT}
}

echo "Current ret: ${GLOBAL_RET}"
my_function_global "${USER}"
echo "Current ret after: ${GLOBAL_RET}"
GLOBAL_RET=255
echo "Current ret: ${GLOBAL_RET}"
my_function_global "${USER}"
GLOBAL_RET=$?
echo "Current ret after: ${GLOBAL_RET}"
