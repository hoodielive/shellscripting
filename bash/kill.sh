#!/bin/bash 
# 
# kill process 
# 

set -x

echo "Which process do you want to kill?" 

read TOKILL

kill $(ps aux | grep ${TOKILL} | grep -v grep | awk '{ print $2 }') 
