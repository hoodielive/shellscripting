#!/bin/bash 
# 
# kill process 
# 

echo "Which process do you want to kill?" 
read TOKILL

kill $(ps aux | grep ${TOKILL} | grep -v grep | awk '{ print $2 }') 
